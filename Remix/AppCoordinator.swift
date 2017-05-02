import LandmarkList

class AppCoordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let landmarkListCoordinator = LandmarkListCoordinator()
        landmarkListCoordinator.start()
        
        let landmarkListViewController = LandmarkListViewController()
        
        window.rootViewController = landmarkListViewController
    }
}
