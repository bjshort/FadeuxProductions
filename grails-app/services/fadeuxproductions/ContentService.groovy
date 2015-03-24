package fadeuxproductions

import grails.transaction.Transactional

@Transactional
class ContentService {

    def editContent(String contentTag, String message){
        def content = Content.findByKey(contentTag)

        if(content){
            content.message = message
            content.save()
        } else {
            new Content(key: contentTag, message: message).save()
        }
    }
}
