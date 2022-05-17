//
//  MoviesTop10Tests.swift
//  MoviesTop10Tests
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import XCTest
@testable import MoviesTop10
class MovieDetailViewModelTests: XCTestCase {
    
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
    
    
    func testDataManager(){
//        sut.dataManager = nil
        let movieId = "4006"
        sut.getMovieDetails(movieId: movieId) { status in
            XCTAssertEqual(status, true)
        }
        
    }
    func testgetRated(){
        let rated = sut.getRated()
        XCTAssert(rated.count > 0)
    }
    
    
}
class MockDataManager: NetworkManagerProtocol {
    var movDet : MovieDetail?
    
   
    func fetchPopularMovies(url: URL, pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping (String) -> Void) {
            
    }
    
    func fetchMovieDetails(url: URL, movieId: String, completion: @escaping (MovieDetail) -> Void, failure: @escaping (String) -> Void) {
        if let movieDet = movDet {
            completion(movieDet)
        }
    }
    
}
