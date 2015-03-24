package fadeuxproductions

import org.springframework.security.access.annotation.Secured

class HomepageController {

    @Secured(['permitAll'])
    def index() {
        render view: 'index', model: [shows: Show.all,
                                      content: [title: Content?.findByKey('homepageTitle')?.message,
                                                description: Content?.findByKey('homepageDescription')?.message]]
    }
}
