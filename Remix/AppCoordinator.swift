import LandmarkBrowser
import LandmarkService

class AppCoordinator {
    
    let window: UIWindow
    let navigationController = UINavigationController()
    let landmarkBrowserCoordinator: LandmarkBrowserCoordinator
    
    init(window: UIWindow, landmarkService: LandmarkService) {
        self.window = window
        self.window.rootViewController = navigationController
        landmarkBrowserCoordinator = LandmarkBrowserCoordinator(navigationController: navigationController, landmarkService: landmarkService)
    }
    
    func start() {
        landmarkBrowserCoordinator.start()
    }
}
