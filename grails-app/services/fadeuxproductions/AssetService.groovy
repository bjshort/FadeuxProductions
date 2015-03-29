package fadeuxproductions

import grails.transaction.Transactional
import org.apache.commons.io.FilenameUtils
import com.amazonaws.services.s3.model.*
import org.springframework.web.multipart.MultipartFile

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
        def uploadURLs = generateS3URL(assetFile.originalFilename)

        if(!uploadAssetToS3(assetFile, uploadURLs.relative)){ false }

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

        new Asset(
                fileName: assetFile.originalFilename,
                storedPath: uploadURLs.full,
                relativePath: uploadURLs.relative,
                uploadedBy: springSecurityService.getCurrentUser(),
                show: show).save(failOnError: true)
    }

    def uploadAssetToS3(MultipartFile assetFile, String relativeURL) {
        Boolean ret = true
        try {
            amazonWebService.s3.putObject(
                    new PutObjectRequest(
                            (String) grailsApplication.config.aws.bucket,
                            relativeURL,
                            multipartToFile(assetFile)
                    ).withCannedAcl(CannedAccessControlList.PublicRead))
        } catch (Exception e){
            println e.message
            ret = false
        }
        ret
    }

    private File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException{
        def folder = new File( 'tmp' )

        if( !folder.exists() ) {
            folder.mkdirs()
        }

        File convFile = new File("tmp/" + multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
    }

    Map<String, String> generateS3URL(String filename){
        def extension = FilenameUtils.getExtension(filename)
        def name = FilenameUtils.getBaseName(filename)
        def date = new Date().format('dd-MM-yy_HH-mm-ss')
        def fullName = name + date + "." + extension

        [full: "https://s3-eu-west-1.amazonaws.com/" + grailsApplication.config.aws.bucket +
                "/images/" + fullName, relative: 'images/' + fullName]
    }

    def deleteAsset(id){
        def asset = Asset.findById(id)
        asset.show = null
        asset.delete()
    }

    def deleteAssetFromS3(Asset asset) {
        try {
            amazonWebService.s3.deleteObject(
                    (String) grailsApplication.config.aws.bucket,
                    asset.relativePath
            )
        } catch (Exception e){
            println e.message
        }
    }
}
