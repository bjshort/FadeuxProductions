package fadeuxproductions

class Show {

    String title
    String location
    String description
    Asset coverImage

    static constraints = {
        coverImage nullable: true
        description maxSize: 10000
    }
}