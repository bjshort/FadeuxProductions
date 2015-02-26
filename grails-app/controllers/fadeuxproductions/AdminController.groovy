package fadeuxproductions

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile
import com.amazonaws.services.s3.model.*

class AdminController {

    def showService
    def assetService
    def amazonWebService

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

        if(command.id){
            showService.updateShow(command.id, command.title, command.description, command.location)
        } else {
            showService.createShow(command.asShow())
        }

        flash.message = "Show created."
        redirect(action: 'index')
    }

    def displayEditShow(Long id){
        def show = Show.findById(id)
        render view: 'displayAddShow', model: [command: ShowCommand.buildFromShow(show)]
    }

    def addAsset() {

        if (params.assetFile != null && params.assetFile instanceof MultipartFile)
        {
            MultipartFile file = params.assetFile
            if(file.size > 2000000){
                flash.message = "Size is over 2mb, nope!"
                redirect(action: 'displayEditShow', params: [id: params.showId])
                return
            }

            def asset = assetService.saveAsset(file, Long.parseLong(params.showId))
            if(!asset){
                flash.message = "Upload failed!!!"
                redirect(action: 'index')
                return
            }

            showService.addAssetToShow(asset, Long.parseLong(params.showId))

        }
        flash.message = "Image added to show"
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
