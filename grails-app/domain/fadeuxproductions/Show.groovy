package fadeuxproductions

class Show {

    String title
    String location
    String description
    String ticketURL
    Asset coverImage
    Asset thumbnail
    Date dateCreated

    static hasMany = [images: Asset]

    static constraints = {
        coverImage nullable: true
        thumbnail nullable: true
        ticketURL nullable: true
        description maxSize: 10000
    }

    static mapping = {
        autoTimestamp true
        images cascade: 'all-delete-orphan'
    }

    def getThumbnailUrl(){
        if(thumbnail){
            thumbnail?.storedPath
        } else {
            "/assets/thumbnail-blank.jpg"
        }
    }
}