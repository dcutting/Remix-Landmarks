import LandmarkEntity
import LandmarkService
import LandmarkList

import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        
        appCoordinator = makeAppCoordinator(window: window)
        appCoordinator?.start()

        window.makeKeyAndVisible()
        
        return true
    }
    
    func makeAppCoordinator(window: UIWindow) -> AppCoordinator {
        let landmarkService = makeLandmarkService()
        return AppCoordinator(window: window, landmarkService: landmarkService)
    }
    
    func makeLandmarkService() -> LandmarkService {
        let london = Landmark(id: LandmarkID("london"), name: "London", coordinate: LandmarkCoordinate(latitude: 51.5, longitude: 0.1))
        let paris = Landmark(id: LandmarkID("paris"), name: "Paris", coordinate: LandmarkCoordinate(latitude: 48.8, longitude: 2.3))
        let landmarks = [london, paris]
        let landmarkService = MockLandmarkService(landmarks: landmarks)
        return landmarkService
    }
}
