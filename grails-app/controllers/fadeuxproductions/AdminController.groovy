package fadeuxproductions

import fadeuxproductions.security.User
import grails.validation.Validateable

class AdminController {

    def showService

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
