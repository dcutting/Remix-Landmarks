import LandmarkEntity
import LandmarkService

var mockLandmarkService = MockLandmarkService(landmarks: [])
let mockLandmarkListView = MockLandmarkListView()
var landmarkListCoordinator: LandmarkListCoordinator?
let mockLandmarkListCoordinatorDelegate = MockLandmarkListCoordinatorDelegate()

@objc(PopulateLandmarkService)

public class PopulateLandmarkService: NSObject {
    
    var id = ""
    var name = ""
    var latitude = ""
    var longitude = ""
    
    var landmarks: [Landmark] = []
    
    public func reset() {
        id = ""
        name = ""
        latitude = ""
        longitude = ""
    }

    public func execute() {
        guard let latitudeNumber = Double(latitude), let longitudeNumber = Double(longitude) else { return }
        let landmark = Landmark(id: id, name: name, coordinate: LandmarkCoordinate(latitude: latitudeNumber, longitude: longitudeNumber))
        landmarks.append(landmark)
    }
    
    public func endTable() {
        mockLandmarkService = MockLandmarkService(landmarks: landmarks)
    }
}

@objc(LandmarkListRows)

public class LandmarkListRows: NSObject {
    
    public func query() -> [[[String]]] {
        
        let mockLandmarkListWireframe = MockLandmarkListWireframe(landmarkListView: mockLandmarkListView)
        landmarkListCoordinator = LandmarkListCoordinator(landmarkService: mockLandmarkService, landmarkListWireframe: mockLandmarkListWireframe)
        landmarkListCoordinator?.delegate = mockLandmarkListCoordinatorDelegate

        landmarkListCoordinator?.start()
        
        let viewData = mockLandmarkListView.viewData
        let table = viewData.rows.map { row in
            [ [ "row text", row.text ] ]
        }
        return table
    }
}

@objc(SelectRow)

public class SelectRow: NSObject {
    
    var row = ""
    var delegateToldID = ""
    
    public func execute() {
        guard let rowValue = Int(row) else { return }
        mockLandmarkListView.delegate?.didSelect(row: rowValue)
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
    
    init(landmarkListView: LandmarkListView) {
        self.landmarkListView = landmarkListView
    }
    
    func makeLandmarkListView() -> LandmarkListView {
        return landmarkListView
    }
    
    func show(landmarkListView: LandmarkListView) {
    }
}

class MockLandmarkListCoordinatorDelegate: LandmarkListCoordinatorDelegate {
    
    var landmarkID: LandmarkID?
    
    func didSelectLandmark(withID landmarkID: LandmarkID) {
        self.landmarkID = landmarkID
    }
}
