import LandmarkEntity

class LandmarkListPresenter {
    func prepare(result: LandmarkListInteractorResult) -> LandmarkListViewData {
        switch result {
        case let .success(landmarks):
            let mapped = landmarks.map {
                LandmarkListViewData.Row(id: $0.id, text: formattedRowText($0))
            }
            return LandmarkListViewData(errorMessage: nil, rows: mapped)
        case let .failure(error):
            return LandmarkListViewData(errorMessage: error.localizedDescription, rows: [])
        }
    }
    
    func formattedRowText(_ landmark: Landmark) -> String {
        return "\(landmark.name.uppercased()) (\(landmark.coordinate.latitude), \(landmark.coordinate.longitude))"
    }
}
