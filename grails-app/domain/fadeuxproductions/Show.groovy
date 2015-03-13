package fadeuxproductions

class Show {

    String title
    String location
    String description
    Asset coverImage
    Asset thumbnail

    static constraints = {
        coverImage nullable: true
        thumbnail nullable: true
        description maxSize: 10000
    }
}