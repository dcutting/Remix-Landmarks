public class MockLandmarkService: LandmarkService {
    
    let landmarks: [Landmark]
    
    public init(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
    
    public func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        completion(.success(landmarks))
    }
    
    public func fetchLandmark(with id: LandmarkID, completion: (LandmarkServiceResult) -> Void) {
        let filtered = landmarks.filter { landmark in
            landmark.id == id
        }
        completion(.success(filtered))
    }

}
