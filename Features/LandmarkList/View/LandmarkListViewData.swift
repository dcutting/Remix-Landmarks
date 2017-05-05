import LandmarkEntity

public struct LandmarkListViewData {
    
    struct Row {
        let id: LandmarkID
        let text: String
    }
    
    var errorMessage: String?
    var rows: [Row] = []
}
