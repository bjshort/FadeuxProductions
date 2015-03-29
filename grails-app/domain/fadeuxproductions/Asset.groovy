package fadeuxproductions

import fadeuxproductions.security.User

class Asset {
    String storedPath
    String relativePath
    String fileName
    User uploadedBy
    Date dateCreated

    static belongsTo = [show : Show]

    static constraints = {
        show(nullable: true)
    }
    static mapping = {
        autoTimestamp true
    }

    def assetService

    def beforeDelete = {
        assetService.deleteAssetFromS3(this)
    }
}
