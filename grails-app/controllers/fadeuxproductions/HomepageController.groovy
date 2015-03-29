package fadeuxproductions

import org.springframework.security.access.annotation.Secured

class HomepageController {

    @Secured(['permitAll'])
    def index() {
        render view: 'index', model: [shows: Show.findAllByCoverImageIsNotNull([sort: 'dateCreated', order: 'desc']),
                                      content: [title: Content?.findByKey('homepageTitle')?.message,
                                                description: Content?.findByKey('homepageDescription')?.message,
                                                showsTitle: Content?.findByKey('homepageShowsTitle')?.message,
                                                showsDescription: Content?.findByKey('homepageShowsBody')?.message,
                                                whatWeDoTitle: Content?.findByKey('homepageWhatWeDoTitle')?.message,
                                                whatWeDoDescription: Content?.findByKey('homepageWhatWeDoDescription')?.message]]
    }
}
