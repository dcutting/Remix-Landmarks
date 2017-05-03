class LandmarkListWireframe {
    func makeLandmarkListViewController() -> LandmarkListViewController {
        return LandmarkListViewController.fromStoryboard(named: "LandmarkList", identifier: "LandmarkListViewController", bundle: "LandmarkList")
    }
}
