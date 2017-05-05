public class LandmarkListViewControllerWireframe: LandmarkListWireframe {
    
    let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func makeLandmarkListView() -> LandmarkListView {
        return LandmarkListViewController.fromStoryboard(named: "LandmarkList", identifier: "LandmarkListViewController", bundle: "LandmarkList")
    }
    
    public func show(landmarkListView: LandmarkListView) {
        let landmarkListViewController = landmarkListView as! UIViewController
        navigationController.pushViewController(landmarkListViewController, animated: true)
    }
}
