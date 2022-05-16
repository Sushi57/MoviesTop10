//
//  MoviesTop10Tests.swift
//  MoviesTop10Tests
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import XCTest

class MoviesTop10Tests: XCTestCase {

    private var sut:MovieDetailViewModel!
    private var mockDataManager:MockDataManager!
    
    override func setUpWithError() throws {
        
        mockDataManager = MockDataManager()
        sut = MovieDetailViewModel.init(dataManager: mockDataManager)
        
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
        sut = nil
        mockDataManager = nil
        
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
class MockDataManager: NetworkManagerProtocol {
    
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel, Error?) -> Void) {
       
        
    }
    
    func fetchMovieDetails(movieId: String, completion: @escaping (MovieDetail, Error?) -> Void) {
       
    }
    
    func showIndicator() -> Bool {
        return true
    }
    
    
}
