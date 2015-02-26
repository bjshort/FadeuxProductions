package fadeuxproductions

import org.springframework.security.access.annotation.Secured

class HomepageController {

    @Secured(['permitAll'])
    def index() {
        render view: 'index', model: [showsWithCover: Show.findAllByCoverImageIsNotNull()]
    }
}
