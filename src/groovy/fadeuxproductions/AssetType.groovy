package fadeuxproductions

enum AssetType {
    COVER(0), THUMBNAIL(1), SUPPLEMENT(2)

    private final int weighting;
    AssetType(int weight){
        this.weighting = weight;
    }
}
