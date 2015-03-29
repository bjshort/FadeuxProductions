package fadeuxproductions

class ContactUsController {

    def index() {
        def background = null
        Random rand = new Random()
        def shows = Show.findAllByCoverImageIsNotNull()
        if(shows){
            background = shows[rand.nextInt(shows.size())].coverImage.storedPath
        }

        [title: Content.findByKey('contactUsTitle')?.message,
         description: Content.findByKey('contactUsDescription')?.message,
        background: background]
    }
}
