import UIKit

class DetailCoordinator: LandmarkDetailViewControllerDelegate {

    let navigationController: UINavigationController
    let landmarkService: LandmarkService
    var landmarkDetailViewController: LandmarkDetailViewController?
    var detailViewData: LandmarkDetailViewData?

    init(navigationController: UINavigationController, landmarkService: LandmarkService) {
        self.navigationController = navigationController
        self.landmarkService = landmarkService
    }
    
    func start(landmarkID: LandmarkID) {
        let viewController = makeLandmarkDetailViewController()
        viewController.delegate = self
        landmarkService.fetchLandmark(with: landmarkID) { result in
            if case let .success(landmarks) = result, let landmark = landmarks.first {
                let viewData = LandmarkDetailPresenter().makeLandmarkDetailViewData(for: landmark)
                viewController.viewData = viewData
                self.detailViewData = viewData
            }
        }
        self.landmarkDetailViewController = viewController
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func makeLandmarkDetailViewController() -> LandmarkDetailViewController {
        return LandmarkDetailViewController()
    }

    func didTapInfoButton() {
        let alert = UIAlertController(title: detailViewData?.funFact, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Really?!", style: .default) { action in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        landmarkDetailViewController?.present(alert, animated: true)
    }
}
