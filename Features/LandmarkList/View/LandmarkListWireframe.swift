public protocol LandmarkListWireframe {
    func makeLandmarkListView() -> LandmarkListView
    func show(landmarkListView: LandmarkListView)
}
