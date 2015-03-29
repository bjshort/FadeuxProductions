package fadeuxproductions

class AboutUsController {

    def index() {
        def background = null
        Random rand = new Random()
        def shows = Show.findAllByCoverImageIsNotNull()
        if(shows){
            background = shows[rand.nextInt(shows.size())].coverImage.storedPath
        }

        [title: Content.findByKey('aboutUsTitle')?.message,
         description: Content.findByKey('aboutUsDescription')?.message,
         background: background]
    }
}
