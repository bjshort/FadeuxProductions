package fadeuxproductions

class AboutUsController {

    def index() {
        [title: Content.findByKey('aboutUsTitle')?.message,
         description: Content.findByKey('aboutUsDescription')?.message]
    }
}
