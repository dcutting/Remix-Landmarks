import UIKit
import MapKit

class LandmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!

    var landmark: Landmark?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        nameLabel?.text = landmark?.name
        coordinatesLabel?.text = formattedText(for: landmark?.coordinate)
        mapView?.centerCoordinate = clCoordinate(for: landmark?.coordinate)
    }
    
    func formattedText(for coordinate: LandmarkCoordinate?) -> String {
        guard let coordinate = coordinate else { return "" }
        let latitude = coordinate.latitude >= 0.0 ? coordinate.latitude : -coordinate.latitude
        let longitude = coordinate.longitude >= 0.0 ? coordinate.longitude : -coordinate.longitude
        let latitudeDirection = coordinate.latitude >= 0.0 ? "N" : "S"
        let longitudeDirection = coordinate.longitude >= 0.0 ? "E" : "W"    // TODO: correct?
        return "\(latitude)\(latitudeDirection) \(longitude)\(longitudeDirection)"
    }
    
    func clCoordinate(for coordinate: LandmarkCoordinate?) -> CLLocationCoordinate2D {
        guard let coordinate = coordinate else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
