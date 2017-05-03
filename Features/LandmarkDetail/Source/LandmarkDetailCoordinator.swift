import LandmarkService

public class LandmarkDetailCoordinator {
    
    let navigationController: UINavigationController
    let landmarkID: LandmarkID
    
    public init(navigationController: UINavigationController, landmarkID: LandmarkID) {
        print("init LandmarkDetailCoordinator")
        self.navigationController = navigationController
        self.landmarkID = landmarkID
    }

    // TODO: http://irace.me/navigation-coordinators
    deinit {
        print("deinit LandmarkDetailCoordinator")
    }
    
    public func start() {
        let landmarkDetailViewController = LandmarkDetailViewController.fromResource()
        landmarkDetailViewController.landmarkID = landmarkID
        navigationController.pushViewController(landmarkDetailViewController, animated: true)
    }
}
