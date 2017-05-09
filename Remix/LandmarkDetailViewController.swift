import UIKit
import MapKit

class LandmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!

    var landmark: Landmark? {
        didSet {
            update()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        guard isViewLoaded else { return }
        nameLabel?.text = landmark?.name
        coordinatesLabel?.text = text(for: landmark?.coordinate)
        mapView?.centerCoordinate = clCoordinate(for: landmark?.coordinate)
    }
    
    func text(for coordinate: LandmarkCoordinate?) -> String {
        guard let coordinate = coordinate else { return "" }
        return "\(coordinate.latitude), \(coordinate.longitude)"
    }
    
    func clCoordinate(for coordinate: LandmarkCoordinate?) -> CLLocationCoordinate2D {
        guard let coordinate = coordinate else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
