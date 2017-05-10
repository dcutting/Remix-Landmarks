import UIKit
import MapKit

struct LandmarkDetailViewData {
    
    var title: String = ""
    var coordinates: String = ""
    var funFact: String = ""
    var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
}

class LandmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!

    var viewData = LandmarkDetailViewData() {
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
        nameLabel?.text = viewData.title
        coordinatesLabel?.text = viewData.coordinates
        mapView?.setRegion(viewData.region, animated: false)
    }
    
    @IBAction func didTapInfoButton(_ sender: Any) {
        let alert = UIAlertController(title: viewData.funFact, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Really?!", style: .default) { action in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
