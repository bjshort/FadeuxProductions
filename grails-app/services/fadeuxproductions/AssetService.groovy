package fadeuxproductions

import fadeuxproductions.security.User
import grails.transaction.Transactional
import org.apache.commons.io.FilenameUtils
import com.amazonaws.services.s3.model.*
import org.springframework.web.multipart.MultipartFile

import java.text.SimpleDateFormat

@Transactional
class AssetService {
    def springSecurityService
    def grailsApplication
    def amazonWebService
    def showService

    def addAsset(def asset, Long showId, AssetType type) {
        String error = null
        Asset uploadedAsset = null

        if (asset != null && asset instanceof MultipartFile)
        {
            MultipartFile file = asset
            if(file.size > 2000000){
                error = "Size is over 2mb, nope!"
            } else {
                def savedAsset = saveAsset(file, showId, type)
                if(!savedAsset){
                    error = "Upload failed!!!"
                } else {
                    showService.addAssetToShow(savedAsset, showId, type)
                    uploadedAsset = savedAsset
                }
            }
        } else {
            error = "The uploaded file was null."
        }

        [error: error, asset: uploadedAsset]
    }

    def saveAsset(MultipartFile assetFile, Long showId, AssetType type) {
        def show = Show.findById(showId)

        def extension = FilenameUtils.getExtension(assetFile.getOriginalFilename())

        if(!uploadAssetToS3(assetFile)){
            false
        }

        switch (type){
            case AssetType.COVER:
                if(show.coverImage){
                    def id = show.coverImage.id
                    show.coverImage = null
                    show.save()
                    deleteAsset(id)
                }
                break
            case AssetType.THUMBNAIL:
                if(show.thumbnail){
                    def id = show.thumbnail.id
                    show.thumbnail = null
                    show.save()
                    deleteAsset(id)
                }
                break
            default:
                break
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
        File convFile = new File("tmp/" + multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
    }

    String generateS3URL(String filename, Boolean relative = false){
        def date = new Date().format('dd-MM-yy')
        if(relative){
            'images/' + filename + date
        } else {
            "https://s3-eu-west-1.amazonaws.com/" + grailsApplication.config.aws.bucket +
                    "/images/" + filename + date
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
