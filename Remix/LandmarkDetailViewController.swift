import UIKit

class LandmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var landmarkID: LandmarkID? {
        didSet {
            update()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        nameLabel?.text = "\(String(describing: landmarkID))"
    }
}
