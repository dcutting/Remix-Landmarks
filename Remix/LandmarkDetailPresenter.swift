import MapKit

class LandmarkDetailPresenter {

    func makeLandmarkDetailViewData(for landmark: Landmark) -> LandmarkDetailViewData {
        let clCoordinate = makeCLCoordinate(for: landmark.coordinate)
        let span = MKCoordinateSpanMake(1, 1)
        var region = MKCoordinateRegionMake(clCoordinate, span)
        region.center = clCoordinate
        
        let formattedCoordinate = formattedText(for: landmark.coordinate)
        return LandmarkDetailViewData(title: landmark.name, coordinates: formattedCoordinate, funFact: landmark.funFact, mapRegion: region)
    }
    
    func makeCLCoordinate(for coordinate: LandmarkCoordinate?) -> CLLocationCoordinate2D {
        guard let coordinate = coordinate else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    func formattedText(for coordinate: LandmarkCoordinate?) -> String {
        guard let coordinate = coordinate else { return "" }
        let latitude = coordinate.latitude >= 0.0 ? coordinate.latitude : -coordinate.latitude
        let longitude = coordinate.longitude >= 0.0 ? coordinate.longitude : -coordinate.longitude
        let latitudeDirection = coordinate.latitude >= 0.0 ? "N" : "S"
        let longitudeDirection = coordinate.longitude >= 0.0 ? "E" : "W"
        return "\(latitude)\(latitudeDirection) \(longitude)\(longitudeDirection)"
    }
}
