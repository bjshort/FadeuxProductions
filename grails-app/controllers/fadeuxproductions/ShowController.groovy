package fadeuxproductions

class ShowController {

    def index() {
        Random rand = new Random()
        def shows = Show.findAllByCoverImageIsNotNullAndThumbnailIsNotNull()
        [shows: shows, background: shows[rand.nextInt(shows.size())].coverImage.storedPath]
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
