import UIKit
import Layout
import MapKit

struct LandmarkDetailViewData {

    var title: String = ""
    var coordinates: String = ""
    var funFact: String = ""
    var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
}

class LandmarkDetailViewController: LayoutViewController {

    weak var mapView: MKMapView!
    weak var nameLabel: UILabel!
    weak var coordinatesLabel: UILabel!

    var viewData = LandmarkDetailViewData() {
        didSet {
            self.layoutNode?.state = viewData
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout(
            named: "LandmarkDetails.xml",
            state: viewData
        )
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
