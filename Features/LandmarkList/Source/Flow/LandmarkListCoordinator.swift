import LandmarkEntity
import LandmarkService

public protocol LandmarkListCoordinatorDelegate: class {
    func didSelectLandmark(withID: LandmarkID)
}

public class LandmarkListCoordinator {
    
    public weak var delegate: LandmarkListCoordinatorDelegate?
    
    let landmarkListInteractor: LandmarkListInteractor
    let landmarkListWireframe: LandmarkListWireframe

    public init(landmarkService: LandmarkService, landmarkListWireframe: LandmarkListWireframe) {
        landmarkListInteractor = LandmarkListInteractor(landmarkService: landmarkService)
        self.landmarkListWireframe = landmarkListWireframe
    }
    
    public func start() {
        var landmarkListView = landmarkListWireframe.makeLandmarkListView()
        landmarkListView.delegate = self
        landmarkListWireframe.show(landmarkListView: landmarkListView)
        
        landmarkListInteractor.fetchAllLandmarks { result in
            let landmarkViewData = LandmarkListPresenter().prepare(result: result)
            landmarkListView.viewData = landmarkViewData
        }
    }
}

extension LandmarkListCoordinator: LandmarkListViewDelegate {
    public func didSelectLandmark(withID id: LandmarkID) {
        delegate?.didSelectLandmark(withID: id)
    }
}
