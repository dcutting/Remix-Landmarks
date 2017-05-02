public class MockLandmarkService: LandmarkService {
    
    public var landmarks: [Landmark] = []
    
    func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        let result = LandmarkServiceResult.success(landmarks)
        completion(result)
    }
}
