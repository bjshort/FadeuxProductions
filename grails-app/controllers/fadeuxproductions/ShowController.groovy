package fadeuxproductions

import org.springframework.web.multipart.MultipartFile

class ShowController {

    def index() {
        [shows: Show.all]
    }

    def view(Long id){
        def show = Show.findById(id)

        if(!show){
            render 404
            return
        }

        render view: 'viewShow', model: [show: show]
    }
}
