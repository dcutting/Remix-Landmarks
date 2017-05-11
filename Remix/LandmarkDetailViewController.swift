import UIKit
import Layout
import MapKit

protocol LandmarkDetailViewControllerDelegate: class {
    func didTapInfoButton()
}

struct LandmarkDetailViewData {

    var title: String = ""
    var coordinates: String = ""
    var funFact: String = ""
    var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
}

class LandmarkDetailViewController: LayoutViewController {

    weak var delegate: LandmarkDetailViewControllerDelegate?
    
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
        delegate?.didTapInfoButton()
    }
}
