//
//  MoviesTop10Tests.swift
//  MoviesTop10Tests
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import XCTest
@testable import MoviesTop10
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
    
    
    func testAPIModelType(){
        
        sut.dataManager = nil
        sut.getMovieDetails(movieId: "\(556)") { state in
            if state {
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            }
            
        }
        
    }
    
    
    
}
class MockDataManager: NetworkManagerProtocol {
    var movList : MovieListModel?
    var movDet : MovieDetail?
    
    func fetchPopularMovies(pageNo: Int, completion: @escaping (MovieListModel) -> Void, failure: @escaping (String) -> Void) {
        if let movie = movList {
            completion(movie)
        }
    }
    
    func fetchMovieDetails(movieId: String, completion: @escaping (MovieDetail) -> Void, failure: @escaping (String) -> Void) {
        if let movieDet = movDet {
            completion(movieDet)
        }
    }
    
}
