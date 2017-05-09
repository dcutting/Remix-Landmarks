import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = window?.rootViewController as? UINavigationController
        if let landmarkListViewController = navigationController?.topViewController as? LandmarkListViewController {
            landmarkListViewController.landmarkService = makeLandmarkService()
        }
        
        return true
    }
    
    func makeLandmarkService() -> LandmarkService {
        let london = Landmark(id: LandmarkID("london"), name: "London", coordinate: LandmarkCoordinate(latitude: 51.5, longitude: 0.1))
        let paris = Landmark(id: LandmarkID("paris"), name: "Paris", coordinate: LandmarkCoordinate(latitude: 48.8, longitude: 2.3))
        let quito = Landmark(id: LandmarkID("quito"), name: "Quito", coordinate: LandmarkCoordinate(latitude: -30.1, longitude: -20.4))    // TODO
        let landmarks = [london, paris, quito]
        let landmarkService = MockLandmarkService(landmarks: landmarks)
        return landmarkService
    }
}
