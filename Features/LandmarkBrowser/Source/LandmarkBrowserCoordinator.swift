import LandmarkEntity
import LandmarkService
import LandmarkList
import LandmarkDetail

public class LandmarkBrowserCoordinator {
    
    let navigationController: UINavigationController
    let landmarkListCoordinator: LandmarkListCoordinator
    var landmarkDetailCoordinator: LandmarkDetailCoordinator?
    
    public init(navigationController: UINavigationController, landmarkService: LandmarkService) {
        self.navigationController = navigationController
        landmarkListCoordinator = LandmarkListCoordinator(landmarkService: landmarkService)
    }
    
    public func start() {
        landmarkListCoordinator.delegate = self
        landmarkListCoordinator.start(navigationController: navigationController)
    }
}

extension LandmarkBrowserCoordinator: LandmarkListCoordinatorDelegate {
    public func didSelectLandmark(withID id: LandmarkID) {
        landmarkDetailCoordinator = LandmarkDetailCoordinator(navigationController: navigationController, landmarkID: id)
        landmarkDetailCoordinator?.start()
    }
}
