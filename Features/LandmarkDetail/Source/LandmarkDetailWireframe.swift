class LandmarkDetailWireframe {
    func makeLandmarkDetailViewController() -> LandmarkDetailViewController {
        return LandmarkDetailViewController.fromStoryboard(named: "LandmarkDetail", identifier: "LandmarkDetailViewController", bundle: "LandmarkDetail")
    }
}
