import LandmarkEntity
import LandmarkService
import LoadablePodResource

public protocol LandmarkListCoordinatorDelegate: class {
    func didSelectLandmark(withID: LandmarkID)
}

public class LandmarkListCoordinator {
    
    public weak var delegate: LandmarkListCoordinatorDelegate?
    
    let landmarkListInteractor: LandmarkListInteractor
    
    public init(landmarkService: LandmarkService) {
        landmarkListInteractor = LandmarkListInteractor(landmarkService: landmarkService)
    }
    
    public func start(navigationController: UINavigationController) {
        let landmarkListViewController = LandmarkListWireframe().makeLandmarkListViewController()
        landmarkListViewController.delegate = self
        navigationController.pushViewController(landmarkListViewController, animated: true)
        
        landmarkListInteractor.fetchAllLandmarks { result in
            let landmarkViewData = LandmarkListPresenter().prepare(result: result)
            landmarkListViewController.viewData = landmarkViewData
        }
    }
}

extension LandmarkListCoordinator: LandmarkListViewControllerDelegate {
    func didSelectLandmark(withID id: LandmarkID) {
        delegate?.didSelectLandmark(withID: id)
    }
}
