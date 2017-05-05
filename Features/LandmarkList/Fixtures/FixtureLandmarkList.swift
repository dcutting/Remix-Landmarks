import LandmarkEntity
import LandmarkService

var landmarks: [Landmark] = []

@objc(FixtureLandmarkService)

public class FixtureLandmarkService: NSObject {
    
    var name = ""
    var latitude = 0.0
    var longitude = 0.0
    
    public func execute() {
        let landmark = Landmark(id: LandmarkID(), name: name, coordinate: LandmarkCoordinate(latitude: latitude, longitude: longitude))
        landmarks.append(landmark)
    }
    
    public func reset() {
        landmarks.removeAll()
    }
}

@objc(LandmarkListRows)

public class LandmarkListRows: NSObject {
    
    public func query() -> [[[String]]] {
        
        let landmarkService = MockLandmarkService()
        landmarkService.landmarks = landmarks
        
        let landmarkListWireframe = MockLandmarkListWireframe()
        
        let landmarkListCoordinator = LandmarkListCoordinator(landmarkService: landmarkService, landmarkListWireframe: landmarkListWireframe)
        
        landmarkListCoordinator.start()
        
        return []
        
//        return [
//            [
//                [ "row text", "LONDON (51.5, 0.1)" ]
//            ], [
//                [ "row text", "PARIS (48.8, 2.3)" ]
//            ]
//        ]
    }
}

class MockLandmarkListWireframe: LandmarkListWireframe {
    func makeLandmarkListView() -> LandmarkListView {
        return LandmarkListViewController()
    }

    func show(landmarkListView: LandmarkListView) {
    }
}
