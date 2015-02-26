package fadeuxproductions

import grails.transaction.NotTransactional
import grails.transaction.Transactional

@Transactional
class ShowService {

    def assetService

    static transactional = true

    def createShow(Show show){
        show.save(failOnError: true)
    }

    def updateShow(Long id, String title, String description, String location){
        def show = Show.findById(id)
        show.title = title
        show.description = description
        show.location = location
        show.save(failOnError: true)
    }

    @NotTransactional
    def addAssetToShow(Asset asset, Long showId) {
        def show = Show.findById(showId)
        if (asset) {
            show.coverImage = asset
            show.save(failOnError: true)
        }
    }
}
