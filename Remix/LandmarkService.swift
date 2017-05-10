public enum LandmarkServiceResult {
    case success([Landmark])
    case failure(Error)
}

public protocol LandmarkService {
    func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void)
    func fetchLandmark(with id: LandmarkID, completion: (LandmarkServiceResult) -> Void)
}
