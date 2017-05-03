import LandmarkService

class LandmarkListPresenter {
    func prepare(result: LandmarkListInteractorResult) -> LandmarkListViewData {
        switch result {
        case let .success(landmarks):
            let mapped = landmarks.map {
                LandmarkListViewData.Row(id: $0.id, name: $0.name)
            }
            return LandmarkListViewData(errorMessage: nil, rows: mapped)
        case let .failure(error):
            return LandmarkListViewData(errorMessage: error.localizedDescription, rows: [])
        }
    }
}
