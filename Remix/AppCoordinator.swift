import UIKit
import MapKit

class AppCoordinator {
    
    let window: UIWindow
    let landmarkService: LandmarkService

    let navigationController = UINavigationController()
    var landmarkListViewController: LandmarkListViewController?
    var landmarkDetailViewController: LandmarkDetailViewController?

    var viewData: LandmarkListViewData?
    
    init(window: UIWindow, landmarkService: LandmarkService) {
        self.window = window
        self.landmarkService = landmarkService

        self.window.rootViewController = navigationController
    }
    
    func start() {
        let viewController = makeLandmarkListViewController()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
        self.landmarkListViewController = viewController

        fetchAllLandmarks()
    }
    
    func makeLandmarkListViewController() -> LandmarkListViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandmarkListViewController") as? LandmarkListViewController else { preconditionFailure() }
        return viewController
    }

    func fetchAllLandmarks() {
        landmarkService.fetchAllLandmarks { result in
            let viewData: LandmarkListViewData
            switch result {
            case let .success(landmarks):
                let rows = landmarks.map { landmark in
                    LandmarkListViewData.Row(id: landmark.id, text: formattedRowText(for: landmark))
                }
                viewData = LandmarkListViewData(errorMessage: nil, rows: rows)
            case let .failure(error):
                viewData = LandmarkListViewData(errorMessage: error.localizedDescription, rows: [])
            }
            landmarkListViewController?.viewData = viewData
            self.viewData = viewData
        }
    }

    func formattedRowText(for landmark: Landmark) -> String {
        return "\(landmark.name.uppercased()) (\(landmark.coordinate.latitude), \(landmark.coordinate.longitude))"
    }
}

extension AppCoordinator: LandmarkListViewDelegate {
    func didSelect(row: Int) {
        guard let landmarkID = viewData?.rows[row].id else { return }
        let viewController = makeLandmarkDetailViewController()
        landmarkService.fetchLandmark(with: landmarkID) { result in
            if case let .success(landmarks) = result, let landmark = landmarks.first {
                let viewData = makeLandmarkDetailViewData(for: landmark)
                viewController.viewData = viewData
            }
        }
        self.landmarkDetailViewController = viewController
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func makeLandmarkDetailViewController() -> LandmarkDetailViewController {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandmarkDetailViewController") as? LandmarkDetailViewController else { preconditionFailure() }
        return viewController
    }
    
    func makeLandmarkDetailViewData(for landmark: Landmark) -> LandmarkDetailViewData {
        let clCoordinate = makeCLCoordinate(for: landmark.coordinate)
        let span = MKCoordinateSpanMake(1, 1)
        var region = MKCoordinateRegionMake(clCoordinate, span)
        region.center = clCoordinate
        
        let formattedCoordinate = formattedText(for: landmark.coordinate)
        return LandmarkDetailViewData(title: landmark.name, coordinates: formattedCoordinate, funFact: landmark.funFact, mapRegion: region)
    }
    
    func makeCLCoordinate(for coordinate: LandmarkCoordinate?) -> CLLocationCoordinate2D {
        guard let coordinate = coordinate else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    func formattedText(for coordinate: LandmarkCoordinate?) -> String {
        guard let coordinate = coordinate else { return "" }
        let latitude = coordinate.latitude >= 0.0 ? coordinate.latitude : -coordinate.latitude
        let longitude = coordinate.longitude >= 0.0 ? coordinate.longitude : -coordinate.longitude
        let latitudeDirection = coordinate.latitude >= 0.0 ? "N" : "S"
        let longitudeDirection = coordinate.longitude >= 0.0 ? "E" : "W"
        return "\(latitude)\(latitudeDirection) \(longitude)\(longitudeDirection)"
    }
}
