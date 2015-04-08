package fadeuxproductions

import grails.transaction.NotTransactional
import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional
class ShowService {

    def assetService

    static transactional = true

    def createShow(Show show){
        show.save(failOnError: true)
    }

    def updateShow(Long id, String title, String description, String location, String date){
        def show = Show.findById(id)
        show.title = title
        show.description = description
        show.location = location
        show.showDate = Date.parse('d/M/yy', date)
        show.save(failOnError: true)
    }

    @NotTransactional
    def addAssetToShow(Asset asset, Long showId, AssetType type) {
        def show = Show.findById(showId)
        if (asset) {
            switch (type) {
                case AssetType.COVER:
                    show.coverImage = asset
                    break
                case AssetType.THUMBNAIL:
                    show.thumbnail = asset
                    break
                case AssetType.SUPPLEMENT:
                    show.addToImages(asset)
                    break
                default:
                    break
            }
            show.save(failOnError: true)
        }
    }

    def deleteShow(Long id){
        def show = Show.findById(id)

        if(show){
            show.delete()
            return "Show was successfully deleted."
        }

        null
    }
}
