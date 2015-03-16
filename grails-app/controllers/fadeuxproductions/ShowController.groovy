package fadeuxproductions

import org.springframework.web.multipart.MultipartFile

class ShowController {

    def index() {
        Random rand = new Random()
        def shows = Show.findAllByCoverImageIsNotNull()
        def random = rand.nextInt(shows.size())
        println("Random: " + random + " Shows size: " + shows.size())
        [shows: Show.all, background: shows[random].coverImage.storedPath]
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
