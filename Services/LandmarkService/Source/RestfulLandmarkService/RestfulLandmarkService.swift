public enum RestfulLandmarkServiceError: Error {
    case network
}

public class RestfulLandmarkService: LandmarkService {
    public func fetchAllLandmarks(completion: (LandmarkServiceResult) -> Void) {
        // TODO
        completion(.failure(RestfulLandmarkServiceError.network))
    }
}
