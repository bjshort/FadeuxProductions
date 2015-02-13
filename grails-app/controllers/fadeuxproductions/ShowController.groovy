package fadeuxproductions

class ShowController {

    def index() {
        [shows: Show.all]
    }
}
