import LandmarkEntity

public class MockLandmarkService: LandmarkService {
    
    public var landmarks: [Landmark] = []
    
    public init() {}
    
    public func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        completion(.success(landmarks))
    }
}
