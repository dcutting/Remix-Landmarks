import LandmarkService

import UIKit

protocol LandmarkListViewControllerDelegate: class {
    func didSelectLandmark(withID: LandmarkID)
}

class LandmarkListViewController: UIViewController, Loadable {
    
    @IBOutlet weak var tableView: UITableView!

    weak var delegate: LandmarkListViewControllerDelegate?
    
    var landmarks: [Landmark] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landmarks"
        tableView.reloadData()
    }
}

extension LandmarkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LandmarkCell")!
        let landmark = landmarks[indexPath.row]
        cell.textLabel?.text = landmark.name
        return cell
    }
}

extension LandmarkListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let landmark = landmarks[indexPath.row]
        let landmarkID = landmark.id
        delegate?.didSelectLandmark(withID: landmarkID)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension Loadable where Self: UIViewController {
    
    static func fromResource() -> Self {
        let storyboard = UIStoryboard(name: "LandmarkList", bundle: bundle)
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
        guard let bundleURL = podBundle.url(forResource: "LandmarkList", withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL) else {
                preconditionFailure("Could not locate resources bundle")
        }
        return bundle
    }
}
