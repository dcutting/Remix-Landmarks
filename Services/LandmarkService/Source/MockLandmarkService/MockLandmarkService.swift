import LandmarkEntity

public class MockLandmarkService: LandmarkService {
    
    public var landmarks: [Landmark] = []
    
    public init() {}
    
    public func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        let result = LandmarkServiceResult.success(landmarks)
        completion(result)
    }
}
