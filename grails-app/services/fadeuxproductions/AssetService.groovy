package fadeuxproductions

import fadeuxproductions.security.User
import grails.transaction.Transactional
import org.apache.commons.io.FilenameUtils
import com.amazonaws.services.s3.model.*
import org.springframework.web.multipart.MultipartFile

@Transactional
class AssetService {
    def springSecurityService
    def grailsApplication
    def amazonWebService

    def saveAsset(MultipartFile assetFile, Long showId) {
        def show = Show.findById(showId)

        def extension = FilenameUtils.getExtension(assetFile.getOriginalFilename())

        if(!uploadAssetToS3(assetFile)){
            false
        }

        if(show.coverImage != null){
            def id = show.coverImage.id
            show.coverImage = null
            show.save()
            deleteAsset(id)
        }

        new Asset(fileName: show.title + "." + extension,
                originalFileName: assetFile.originalFilename,
                storedPath: generateS3URL(assetFile.originalFilename),
                extension: extension,
                uploadedBy: springSecurityService.getCurrentUser(),
                contentType: assetFile.getContentType(),
                show: show).save(failOnError: true)
    }

    def uploadAssetToS3(MultipartFile assetFile) {
        Boolean ret = true
        try {
            amazonWebService.s3.putObject(
                    new PutObjectRequest(
                            (String) grailsApplication.config.aws.bucket,
                            generateS3URL(assetFile.originalFilename, true),
                            multipartToFile(assetFile)
                    ).withCannedAcl(CannedAccessControlList.PublicRead))
        } catch (Exception e){
            println e.message
            ret = false
        }
        ret
    }

    private File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException{
        File convFile = new File( multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
    }

    String generateS3URL(String filename, Boolean relative = false){
        if(relative){
            'images/' + filename
        } else {
            "https://s3-eu-west-1.amazonaws.com/" + grailsApplication.config.aws.bucket +
                    "/images/" + filename
        }
    }

    def deleteAsset(id){
        def asset = Asset.findById(id)
        deleteAssetFromS3(asset)
        asset.show = null
        asset.delete()
    }

    def deleteAssetFromS3(Asset asset) {
        try {
            amazonWebService.s3.deleteObject(
                    (String) grailsApplication.config.aws.bucket,
                    generateS3URL(asset.originalFileName, true)
            )
        } catch (Exception e){
            println e.message
        }
    }
}
