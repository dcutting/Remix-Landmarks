import LandmarkEntity
import LandmarkService



var mockLandmarkService = MockLandmarkService(landmarks: [])

let mockLandmarkListView = MockLandmarkListView()
let mockLandmarkListWireframe = MockLandmarkListWireframe(landmarkListView: mockLandmarkListView)

let mockLandmarkListCoordinatorDelegate = MockLandmarkListCoordinatorDelegate()

let landmarkListCoordinator = LandmarkListCoordinator(landmarkService: mockLandmarkService, landmarkListWireframe: mockLandmarkListWireframe)



@objc(PopulateLandmarkService)

public class PopulateLandmarkService: NSObject {
    
    var id = ""
    var name = ""
    var latitude: NSNumber = 0.0
    var longitude: NSNumber = 0.0
    
    var landmarks: [Landmark] = []

    public func execute() {
        let landmark = Landmark(id: id, name: name, coordinate: LandmarkCoordinate(latitude: latitude.doubleValue, longitude: longitude.doubleValue))
        landmarks.append(landmark)
    }
    
    public func endTable() {
        mockLandmarkService = MockLandmarkService(landmarks: landmarks)
    }
}

@objc(ShowLandmarkList)

public class ShowLandmarkList: NSObject {
    
    public func showsListOnStart() -> NSNumber {
        landmarkListCoordinator.start()
        guard let actual = mockLandmarkListWireframe.actualShowLandmarkListView else { return false }
        let ok = actual === mockLandmarkListView
        return NSNumber(booleanLiteral: ok)
    }
}

@objc(LandmarkListRows)

public class LandmarkListRows: NSObject {
    
    public func query() -> [[[String]]] {
        
        landmarkListCoordinator.delegate = mockLandmarkListCoordinatorDelegate

        landmarkListCoordinator.start()
        
        let viewData = mockLandmarkListView.viewData
        let table = viewData.rows.map { row in
            [ [ "row text", row.text ] ]
        }
        return table
    }
}

@objc(SelectRow)

public class SelectRow: NSObject {
    
    var row: NSNumber = 0
    var delegateToldID = ""
    
    public func execute() {
        mockLandmarkListView.delegate?.didSelect(row: row.intValue)
        guard let id = mockLandmarkListCoordinatorDelegate.landmarkID else { return }
        delegateToldID = id
    }
}

class MockLandmarkListView: LandmarkListView {
    var viewData = LandmarkListViewData()
    var delegate: LandmarkListViewDelegate?
}

class MockLandmarkListWireframe: LandmarkListWireframe {
    
    let landmarkListView: LandmarkListView
    var actualShowLandmarkListView: LandmarkListView?
    
    init(landmarkListView: LandmarkListView) {
        self.landmarkListView = landmarkListView
    }
    
    func makeLandmarkListView() -> LandmarkListView {
        return landmarkListView
    }
    
    func show(landmarkListView: LandmarkListView) {
        actualShowLandmarkListView = landmarkListView
    }
}

class MockLandmarkListCoordinatorDelegate: LandmarkListCoordinatorDelegate {
    
    var landmarkID: LandmarkID?
    
    func didSelectLandmark(withID landmarkID: LandmarkID) {
        self.landmarkID = landmarkID
    }
}
