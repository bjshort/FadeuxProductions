package fadeuxproductions

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile
import com.amazonaws.services.s3.model.*

import javax.imageio.ImageIO

class AdminController {

    def showService
    def assetService
    def amazonWebService
    def contentService

    def index() {
        [shows: Show.all]
    }

    def displayAddShow(){

    }

    def addShow(ShowCommand command){
        if(command.hasErrors()){
            render view: 'displayAddShow', model: [command: command]
            return
        }

        def newShow

        if(command.id){
            newShow = showService.updateShow(command.id, command.title, command.description, command.location)
        } else {
            newShow = showService.createShow(command.asShow())
        }

        flash.message = "Show created."
        redirect(action: 'index')
    }

    def displayEditShow(Long id){
        Show show = Show.findById(id)
        render view: 'displayAddShow', model: [command: ShowCommand.buildFromShow(show), show: show]
    }

    def changeCoverImage(Long showId){
        MultipartFile coverImage = params.coverImage

        if(validateIsImage(coverImage)){
            def image = ImageIO.read(coverImage.getInputStream())
            def heightBoundary = (Long) (image.getWidth() * 0.61)
            if(image.getWidth() < 1280){
                flash.coverImageError = "The cover image must be more than 1280 pixels wide."
            } else if(image.getHeight() > heightBoundary) {
                flash.coverImageError = "Your image is too tall for it's width. Crop the height to $heightBoundary px or lower."
            } else {
                def response = assetService.addAsset(coverImage, showId, AssetType.COVER)
                flash.coverImageError = response.error
            }
        } else {
            flash.coverImageError = "File is not an image..."
        }

        redirect(action: 'displayEditShow', params: [id: showId])
    }

    def changeThumbnailImage(Long showId){
        MultipartFile thumbnailImage = params.thumbnailImage
        if(validateIsImage(thumbnailImage)){
            def image = ImageIO.read(thumbnailImage.getInputStream())
            if(image.getWidth() != 260 || image.getHeight() != 314){
                flash.thumbnailImageError = "Thumbnails must be 260 x 314 pixels - resize the image before uploading."
            } else {
                def response = assetService.addAsset(thumbnailImage, showId, AssetType.THUMBNAIL)
                flash.thumbnailImageError = response.error
            }
        } else {
            flash.thumbnailImageError = "File is not an image..."
        }


        redirect(action: 'displayEditShow', params: [id: showId])
    }

    def editContent(){
        if(!params.content){
            flash.error = "No content was submitted, apparently..."
            redirect(action: 'index')
            return
        } else if (!(params.content instanceof Map)) {
            flash.error = "Content didn't convert to a Map.....tell Brendan"
            redirect(action: 'index')
            return
        } else {
            Map content = params.content
            content.each {
                contentService.editContent((String) it.key, (String) it.value)
            }
        }

        flash.message = "Content was updated"
        redirect(action: 'index')
    }

    def deleteShow(Long id){
        def response = showService.deleteShow(id)

        if(response){
            flash.error = response
        } else {
            flash.error = "Show could not be deleted."
        }

        redirect(action: 'index')
    }

    static validateIsImage(MultipartFile file){
        def isImage = false

        if(file.contentType.contains("image/")){
            isImage = true
        }
        isImage
    }

}

@Validateable
class ShowCommand {
    Long id
    String title
    String description
    String location
    String ticketURL

    static constraints = {
        id nullable: true
        title blank: false
        description blank: false
        location blank: false
    }

    static ShowCommand buildFromShow(Show show) {
        new ShowCommand(id: show.id, title: show.title, description: show.description, location: show.location,
                        ticketURL: show.ticketURL)
    }

    Show asShow() {
        new Show(id: this.id, title: this.title,
                description: this.description, location: this.location,
                ticketURL: this.ticketURL)
    }
}
