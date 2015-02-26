package fadeuxproductions

import org.springframework.web.multipart.MultipartFile

class ShowController {

    def index() {
        [shows: Show.all]
    }
}
