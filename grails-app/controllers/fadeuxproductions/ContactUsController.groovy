package fadeuxproductions

class ContactUsController {

    def index() {
        [title: Content.findByKey('contactUsTitle')?.message,
         description: Content.findByKey('contactUsDescription')?.message]
    }
}
