import XCTest
@testable import LandmarkEntity

class MockLandmarkServiceTests: XCTestCase {
    
    func test_fetchAllLandmarks_emptyByDefault() {
        let expect = expectation(description: "fetched")
        let sut = MockLandmarkService(landmarks: [])
        sut.fetchAllLandmarks { result in
            if case let .success(actual) = result {
                XCTAssertEqual(0, actual.count)
                expect.fulfill()
            } else {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 1.0)
    }
}
