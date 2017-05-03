import LandmarkService

import UIKit

class LandmarkDetailViewController: UIViewController, Loadable {
    
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

extension Loadable where Self: UIViewController {
    
    static func fromResource() -> Self {
        let storyboard = UIStoryboard(name: "LandmarkDetail", bundle: bundle)
        if let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self {
            return viewController
        }
        preconditionFailure("Could not load \(className) from bundle")
    }
}

protocol Loadable: class {}

extension Loadable {
    
    static var className: String {
        return "\(self)".components(separatedBy: ".").last!
    }
    
    static var bundle: Bundle {
        let podBundle = Bundle(for: self)
        guard let bundleURL = podBundle.url(forResource: "LandmarkDetail", withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL) else {
                preconditionFailure("Could not locate resources bundle")
        }
        return bundle
    }
}
