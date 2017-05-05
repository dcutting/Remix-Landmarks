import LandmarkEntity

public protocol LandmarkListView {
    var viewData: LandmarkListViewData { get set }
    weak var delegate: LandmarkListViewDelegate? { get set }
}

public struct LandmarkListViewData {
    
    struct Row {
        let id: LandmarkID
        let name: String
    }
    
    var errorMessage: String?
    var rows: [Row] = []
}

public protocol LandmarkListViewDelegate: class {
    func didSelectLandmark(withID: LandmarkID)
}
