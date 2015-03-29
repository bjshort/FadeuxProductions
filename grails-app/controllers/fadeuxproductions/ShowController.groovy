package fadeuxproductions

class ShowController {

    def index() {
        Random rand = new Random()
        def shows = Show.findAllByCoverImageIsNotNull([sort: 'dateCreated', order: 'desc'])
        if(shows){
            [shows: shows, background: shows[rand.nextInt(shows.size())].coverImage.storedPath]
        } else {
            render 404
        }

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
