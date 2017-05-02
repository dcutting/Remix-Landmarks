import LandmarkService
import LandmarkList

class AppCoordinator {
    
    let window: UIWindow
    let navigationController = UINavigationController()
    let landmarkListCoordinator: LandmarkListCoordinator
    
    init(window: UIWindow, landmarkListCoordinator: LandmarkListCoordinator) {
        self.window = window
        self.window.rootViewController = navigationController
        self.landmarkListCoordinator = landmarkListCoordinator
    }
    
    func start() {
        landmarkListCoordinator.delegate = self
        landmarkListCoordinator.start(navigationController: navigationController)
    }
}

extension AppCoordinator: LandmarkListCoordinatorDelegate {
    func didSelectLandmark(withID id: LandmarkID) {
        print("selected landmark \(id)")
    }
}
