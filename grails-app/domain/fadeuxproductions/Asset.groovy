package fadeuxproductions

import fadeuxproductions.security.User

class Asset {
    String storedPath
    String fileName
    String originalFileName
    User uploadedBy
    String extension
    String contentType
    String title
    Date dateCreated

    static belongsTo = [show : Show]

    static constraints = {
        show(nullable: true)
        title(nullable:true)
    }
    static mapping = {
        autoTimestamp true
    }
}
