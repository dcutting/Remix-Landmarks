import LandmarkService
import LoadablePodResources

public protocol LandmarkListCoordinatorDelegate: class {
    func didSelectLandmark(withID: LandmarkID)
}

public class LandmarkListCoordinator {
    
    public weak var delegate: LandmarkListCoordinatorDelegate?
    
    let landmarkService: LandmarkService
    
    public init(landmarkService: LandmarkService) {
        self.landmarkService = landmarkService
    }
    
    public func start(navigationController: UINavigationController) {
        let landmarkListViewController = LandmarkListViewController.fromStoryboard(named: "LandmarkList", identifier: "LandmarkListViewController", bundle: "LandmarkList")
        landmarkListViewController.delegate = self
        navigationController.pushViewController(landmarkListViewController, animated: true)
        
        landmarkService.fetchAllLandmarks { result in
            switch result {
            case let .success(landmarks):
                landmarkListViewController.landmarks = landmarks
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension LandmarkListCoordinator: LandmarkListViewControllerDelegate {
    func didSelectLandmark(withID id: LandmarkID) {
        delegate?.didSelectLandmark(withID: id)
    }
}
