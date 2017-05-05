import LoadablePodResource

import UIKit

class LandmarkListViewController: UIViewController, LandmarkListView, LoadablePodResource {
    
    @IBOutlet weak var tableView: UITableView!

    weak var delegate: LandmarkListViewDelegate?
    
    var viewData = LandmarkListViewData() {
        didSet {
            update()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landmarks"
        update()
    }
    
    func update() {
        guard isViewLoaded else { return }
        present(message: viewData.errorMessage)
        tableView.reloadData()
    }
    
    func present(message: String?) {
        guard let message = message else { return }
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        present(alert, animated: true)
    }
}

extension LandmarkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LandmarkCell")!
        let landmark = viewData.rows[indexPath.row]
        cell.textLabel?.text = landmark.name
        return cell
    }
}

extension LandmarkListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let landmark = viewData.rows[indexPath.row]
        let landmarkID = landmark.id
        delegate?.didSelectLandmark(withID: landmarkID)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
