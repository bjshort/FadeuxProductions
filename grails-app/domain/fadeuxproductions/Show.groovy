package fadeuxproductions

class Show {

    String title
    String location
    String description
    Asset coverImage
    Asset thumbnail
    Date dateCreated

    static hasMany = [images: Asset]

    static constraints = {
        coverImage nullable: true
        thumbnail nullable: true
        description maxSize: 10000
    }

    static mapping = {
        autoTimestamp true
    }

    def getThumbnailUrl(){
        if(thumbnail){
            thumbnail?.storedPath
        } else {
            "/assets/thumbnail-blank.jpg"
        }
    }
}