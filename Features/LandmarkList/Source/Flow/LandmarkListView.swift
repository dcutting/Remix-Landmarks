import LandmarkEntity

public protocol LandmarkListView {
    var viewData: LandmarkListViewData { get set }
    weak var delegate: LandmarkListViewDelegate? { get set }
}

public struct LandmarkListViewData {
    
    struct Row {
        let id: LandmarkID
        let text: String
    }
    
    var errorMessage: String?
    var rows: [Row] = []
}

public protocol LandmarkListViewDelegate: class {
    func didSelect(row: Int)
}
