import UIKit

class AppCoordinator {

    let window: UIWindow
    let landmarkService: LandmarkService

    let navigationController = UINavigationController()
    var landmarkListViewController: LandmarkListViewController?
    
    var detailCoordinator: DetailCoordinator?

    var listViewData: LandmarkListViewData?

    init(window: UIWindow, landmarkService: LandmarkService) {
        self.window = window
        self.landmarkService = landmarkService

        self.window.rootViewController = navigationController
    }

    func start() {
        let viewController = makeLandmarkListViewController()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
        self.landmarkListViewController = viewController

        fetchAllLandmarks()
    }

    func makeLandmarkListViewController() -> LandmarkListViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandmarkListViewController") as? LandmarkListViewController else { preconditionFailure() }
        return viewController
    }

    func fetchAllLandmarks() {
        landmarkService.fetchAllLandmarks { result in
            let viewData: LandmarkListViewData
            switch result {
            case let .success(landmarks):
                let rows = landmarks.map { landmark in
                    LandmarkListViewData.Row(id: landmark.id, text: formattedRowText(for: landmark))
                }
                viewData = LandmarkListViewData(errorMessage: nil, rows: rows)
            case let .failure(error):
                viewData = LandmarkListViewData(errorMessage: error.localizedDescription, rows: [])
            }
            landmarkListViewController?.viewData = viewData
            self.listViewData = viewData
        }
    }

    func formattedRowText(for landmark: Landmark) -> String {
        return "\(landmark.name.uppercased()) (\(landmark.coordinate.latitude), \(landmark.coordinate.longitude))"
    }
}

extension AppCoordinator: LandmarkListViewDelegate {
    func didSelect(row: Int) {
        guard let landmarkID = listViewData?.rows[row].id else { return }
        detailCoordinator = DetailCoordinator(navigationController: navigationController, landmarkService: landmarkService)
        detailCoordinator?.start(landmarkID: landmarkID)
    }
}
