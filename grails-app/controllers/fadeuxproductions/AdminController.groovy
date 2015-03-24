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
        def response = assetService.addAsset(coverImage, showId, AssetType.COVER)

        flash.coverImageError = response.error
        redirect(action: 'displayEditShow', params: [id: showId])
    }

    def changeThumbnailImage(Long showId){
        MultipartFile thumbnailImage = params.thumbnailImage
        def image = ImageIO.read(thumbnailImage.getInputStream())
        if(image.getWidth() != 260 || image.getHeight() != 314){
            flash.thumbnailImageError = "Thumnails must be 260 x 314 pixels - resize the image before uploading."
        } else {
            def response = assetService.addAsset(thumbnailImage, showId, AssetType.THUMBNAIL)
            flash.thumbnailImageError = response.error
        }

        redirect(action: 'displayEditShow', params: [id: showId])
    }

    def editContent(){
        if(!params.content){
            flash.message = "No content was submitted, apparently..."
            redirect(action: 'index')
            return
        } else if (!(params.content instanceof Map)) {
            flash.message = "Content didn't convert to a Map.....tell Brendan"
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

}

@Validateable
class ShowCommand {
    Long id
    String title
    String description
    String location

    static constraints = {
        id nullable: true
        title blank: false
        description blank: false
        location blank: false
    }

    static ShowCommand buildFromShow(Show show) {
        new ShowCommand(id: show.id, title: show.title, description: show.description, location: show.location)
    }

    Show asShow() {
        new Show(id: this.id, title: this.title, description: this.description, location: this.location)
    }
}
