import LandmarkService

enum LandmarkListInteractorResult {
    case success([Landmark])
    case failure(Error)
}

class LandmarkListInteractor {
    
    let landmarkService: LandmarkService
    
    init(landmarkService: LandmarkService) {
        self.landmarkService = landmarkService
    }
    
    func fetchAllLandmarks(completion: (LandmarkListInteractorResult) -> Void) {
        landmarkService.fetchAllLandmarks { result in
            switch result {
            case let .success(landmarks):
                completion(.success(landmarks))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
