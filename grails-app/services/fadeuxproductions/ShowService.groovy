package fadeuxproductions

import grails.transaction.Transactional

@Transactional
class ShowService {

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
}
