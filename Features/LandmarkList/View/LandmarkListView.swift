import LandmarkEntity

public protocol LandmarkListViewDelegate: class {
    func didSelect(row: Int)
}

public protocol LandmarkListView: class {
    var viewData: LandmarkListViewData { get set }
    weak var delegate: LandmarkListViewDelegate? { get set }
}
