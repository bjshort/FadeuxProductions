package fadeuxproductions

class Content {

    String key
    String message

    static constraints = {
        message maxSize: 10000
    }
}
