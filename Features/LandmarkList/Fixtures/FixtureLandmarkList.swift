import LandmarkEntity
import LandmarkService

var mockLandmarkService = MockLandmarkService(landmarks: [])

@objc(FixtureLandmarkService)

public class FixtureLandmarkService: NSObject {
    
    var name = ""
    var latitude = 0.0
    var longitude = 0.0
    
    var landmarks: [Landmark] = []

    public func execute() {
        let landmark = Landmark(id: LandmarkID(), name: name, coordinate: LandmarkCoordinate(latitude: latitude, longitude: longitude))
        landmarks.append(landmark)
    }
    
    public func endTable() {
        mockLandmarkService = MockLandmarkService(landmarks: landmarks)
    }
}

@objc(LandmarkListRows)

public class LandmarkListRows: NSObject {
    
    public func query() -> [[[String]]] {
        
        let mockLandmarkListView = MockLandmarkListView()
        let mockLandmarkListWireframe = MockLandmarkListWireframe(landmarkListView: mockLandmarkListView)
        let landmarkListCoordinator = LandmarkListCoordinator(landmarkService: mockLandmarkService, landmarkListWireframe: mockLandmarkListWireframe)

        landmarkListCoordinator.start()
        
        let viewData = mockLandmarkListView.viewData
        let table = viewData.rows.map { row in
            [ [ "row text", row.text ] ]
        }
        return table
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
