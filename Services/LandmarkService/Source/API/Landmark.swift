public struct LandmarkID {
    public let value: UUID
}

public struct LandmarkCoordinate {
    public let latitude: Double
    public let longitude: Double
}

public struct Landmark {
    public let id: LandmarkID
    public let name: String
    public let coordinate: LandmarkCoordinate
}
