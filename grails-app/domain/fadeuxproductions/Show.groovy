package fadeuxproductions

class Show {

    String title
    String location
    String description
    String ticketURL
    Asset coverImage
    Asset thumbnail
    Date dateCreated
    Date showDate

    static hasMany = [images: Asset]

    static constraints = {
        coverImage nullable: true
        thumbnail nullable: true
        ticketURL nullable: true
        showDate nullable: true
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

    def getShowDisplayDate(){
        if(showDate){
            return this.showDate.format('EEEE, d') + DateUtils.getDateSuffix(Integer.parseInt(this.showDate.format('d'))) + this.showDate.format(' MMMM yyyy')
        } else {
            return null
        }
    }
}