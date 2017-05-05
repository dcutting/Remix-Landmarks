import LandmarkEntity

class LandmarkListPresenter {
    func prepare(result: LandmarkListInteractorResult) -> LandmarkListViewData {
        switch result {
        case let .success(landmarks):
            let mapped = landmarks.map { landmark in
                LandmarkListViewData.Row(id: landmark.id, text: formattedRowText(for: landmark))
            }
            return LandmarkListViewData(errorMessage: nil, rows: mapped)
        case let .failure(error):
            return LandmarkListViewData(errorMessage: error.localizedDescription, rows: [])
        }
    }
    
    func formattedRowText(for landmark: Landmark) -> String {
        return "\(landmark.name.uppercased()) (\(landmark.coordinate.latitude), \(landmark.coordinate.longitude))"
    }
}
