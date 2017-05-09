import UIKit

class LandmarkListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkService: LandmarkService?
    
    fileprivate var landmarks: [Landmark] = []
    fileprivate var errorMessage: String?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Landmarks"
        fetchLandmarks()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLandmarkDetail" {
            guard let landmarkDetailViewController = segue.destination as? LandmarkDetailViewController else { return }
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            landmarkDetailViewController.landmark = landmarks[selectedRow]
        }
    }
}

extension LandmarkListViewController {
    
    fileprivate func fetchLandmarks() {
        landmarkService?.fetchAllLandmarks { result in
            switch result {
            case let .success(landmarks):
                self.landmarks = landmarks
                self.errorMessage = nil
            case let .failure(error):
                self.landmarks = []
                self.errorMessage = error.localizedDescription
            }
            update()
        }
    }

    private func update() {
        present(message: errorMessage)
        tableView.reloadData()
    }
    
    private func present(message: String?) {
        guard let message = message else { return }
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        present(alert, animated: true)
    }
}

extension LandmarkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LandmarkCell")!
        let landmark = landmarks[indexPath.row]
        cell.textLabel?.text = formattedRowText(for: landmark)
        return cell
    }
    
    private func formattedRowText(for landmark: Landmark) -> String {
        return "\(landmark.name.uppercased()) (\(landmark.coordinate.latitude), \(landmark.coordinate.longitude))"
    }
}

extension LandmarkListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
