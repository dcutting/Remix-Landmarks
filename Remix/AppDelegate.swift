import LandmarkService
import LandmarkList

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        
        let landmarkService = MockLandmarkService()
        let london = Landmark(id: LandmarkID(), name: "London", coordinate: LandmarkCoordinate(latitude: 51.0, longitude: 0.0))
        landmarkService.landmarks = [london]
        let landmarkListCoordinator = LandmarkListCoordinator(landmarkService: landmarkService)
        appCoordinator = AppCoordinator(window: window, landmarkListCoordinator: landmarkListCoordinator)
        appCoordinator?.start()
        
        window.makeKeyAndVisible()
        
        return true
    }
}
