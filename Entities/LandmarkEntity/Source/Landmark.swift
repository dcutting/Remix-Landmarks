public typealias LandmarkID = String

public struct LandmarkCoordinate {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct Landmark {
    public let id: LandmarkID
    public let name: String
    public let coordinate: LandmarkCoordinate
    
    public init(id: LandmarkID, name: String, coordinate: LandmarkCoordinate) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
    }
}
