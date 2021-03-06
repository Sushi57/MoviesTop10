//
//  MovieModelTest.swift
//  MoviesTop10Tests
//
//  Created by SAKSHI TIWARI on 17/05/22.
//

import XCTest
@testable import MoviesTop10
@testable import ObjectMapper

class MovieModelTest: XCTestCase {
    private var sut:MockMovie!
    
    override func setUpWithError() throws {
        sut = MockMovie()
        try super.setUpWithError()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVariables() throws {
        let result = sut.id
        XCTAssert(result != nil)
    }
    
    
}
class MockMovie : NSObject, NSCoding, Mappable{
    
    var adult : Bool?
    var backdropPath : String?
    var genreIds : [Int]?
    var id : Int? = 1
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var releaseDate : String?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?
    
    override init() {
        
    }
    required init?(map: Map){}
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIds <- map["genre_ids"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
        
    }
    
    
    @objc required init(coder aDecoder: NSCoder)
    {
        adult = aDecoder.decodeObject(forKey: "adult") as? Bool
        backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
        genreIds = aDecoder.decodeObject(forKey: "genre_ids") as? [Int]
        id = aDecoder.decodeObject(forKey: "id") as? Int
        originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
        originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
        overview = aDecoder.decodeObject(forKey: "overview") as? String
        popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
        posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
        releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        video = aDecoder.decodeObject(forKey: "video") as? Bool
        voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if adult != nil{
            aCoder.encode(adult, forKey: "adult")
        }
        if backdropPath != nil{
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if genreIds != nil{
            aCoder.encode(genreIds, forKey: "genre_ids")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if originalLanguage != nil{
            aCoder.encode(originalLanguage, forKey: "original_language")
        }
        if originalTitle != nil{
            aCoder.encode(originalTitle, forKey: "original_title")
        }
        if overview != nil{
            aCoder.encode(overview, forKey: "overview")
        }
        if popularity != nil{
            aCoder.encode(popularity, forKey: "popularity")
        }
        if posterPath != nil{
            aCoder.encode(posterPath, forKey: "poster_path")
        }
        if releaseDate != nil{
            aCoder.encode(releaseDate, forKey: "release_date")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if video != nil{
            aCoder.encode(video, forKey: "video")
        }
        if voteAverage != nil{
            aCoder.encode(voteAverage, forKey: "vote_average")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }
        
    }
    
    
}
