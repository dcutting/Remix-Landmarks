import LandmarkEntity

public class MockLandmarkService: LandmarkService {
    
    let landmarks: [Landmark]
    
    public init(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
    
    public func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        completion(.success(landmarks))
    }
}
