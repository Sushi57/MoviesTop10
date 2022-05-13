//
//  MovieDetailMode.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 13/05/22.
//

import Foundation
import ObjectMapper


class MovieDetailModel : NSObject, NSCoding, Mappable{

    var adult : Bool?
    var backdropPath : String?
    var belongsToCollection : BelongsToCollection?
    var budget : Int?
    var genres : [Genre]?
    var homepage : String?
    var id : Int?
    var imdbId : String?
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var productionCompanies : [ProductionCompany]?
    var productionCountries : [ProductionCountry]?
    var releaseDate : String?
    var revenue : Int?
    var runtime : Int?
    var spokenLanguages : [SpokenLanguage]?
    var status : String?
    var tagline : String?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?


    class func newInstance(map: Map) -> Mappable?{
        return MovieDetailModel()
    }
    required init?(map: Map){}
    
    private override init(){}

    func mapping(map: Map)
    {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        belongsToCollection <- map["belongs_to_collection"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdbId <- map["imdb_id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        productionCompanies <- map["production_companies"]
        productionCountries <- map["production_countries"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spokenLanguages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         adult = aDecoder.decodeObject(forKey: "adult") as? Bool
         backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
         belongsToCollection = aDecoder.decodeObject(forKey: "belongs_to_collection") as? BelongsToCollection
         budget = aDecoder.decodeObject(forKey: "budget") as? Int
         genres = aDecoder.decodeObject(forKey: "genres") as? [Genre]
         homepage = aDecoder.decodeObject(forKey: "homepage") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imdbId = aDecoder.decodeObject(forKey: "imdb_id") as? String
         originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
         originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         productionCompanies = aDecoder.decodeObject(forKey: "production_companies") as? [ProductionCompany]
         productionCountries = aDecoder.decodeObject(forKey: "production_countries") as? [ProductionCountry]
         releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
         revenue = aDecoder.decodeObject(forKey: "revenue") as? Int
         runtime = aDecoder.decodeObject(forKey: "runtime") as? Int
         spokenLanguages = aDecoder.decodeObject(forKey: "spoken_languages") as? [SpokenLanguage]
         status = aDecoder.decodeObject(forKey: "status") as? String
         tagline = aDecoder.decodeObject(forKey: "tagline") as? String
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
        if belongsToCollection != nil{
            aCoder.encode(belongsToCollection, forKey: "belongs_to_collection")
        }
        if budget != nil{
            aCoder.encode(budget, forKey: "budget")
        }
        if genres != nil{
            aCoder.encode(genres, forKey: "genres")
        }
        if homepage != nil{
            aCoder.encode(homepage, forKey: "homepage")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imdbId != nil{
            aCoder.encode(imdbId, forKey: "imdb_id")
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
        if productionCompanies != nil{
            aCoder.encode(productionCompanies, forKey: "production_companies")
        }
        if productionCountries != nil{
            aCoder.encode(productionCountries, forKey: "production_countries")
        }
        if releaseDate != nil{
            aCoder.encode(releaseDate, forKey: "release_date")
        }
        if revenue != nil{
            aCoder.encode(revenue, forKey: "revenue")
        }
        if runtime != nil{
            aCoder.encode(runtime, forKey: "runtime")
        }
        if spokenLanguages != nil{
            aCoder.encode(spokenLanguages, forKey: "spoken_languages")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if tagline != nil{
            aCoder.encode(tagline, forKey: "tagline")
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
class Genre : NSObject, NSCoding, Mappable{

    var id : Int?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return Genre()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
class BelongsToCollection : NSObject, NSCoding, Mappable{

    var backdropPath : String?
    var id : Int?
    var name : String?
    var posterPath : String?


    class func newInstance(map: Map) -> Mappable?{
        return BelongsToCollection()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        backdropPath <- map["backdrop_path"]
        id <- map["id"]
        name <- map["name"]
        posterPath <- map["poster_path"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if backdropPath != nil{
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if posterPath != nil{
            aCoder.encode(posterPath, forKey: "poster_path")
        }

    }

}

class ProductionCompany : NSObject, NSCoding, Mappable{

    var id : Int?
    var logoPath : String?
    var name : String?
    var originCountry : String?


    class func newInstance(map: Map) -> Mappable?{
        return ProductionCompany()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        logoPath <- map["logo_path"]
        name <- map["name"]
        originCountry <- map["origin_country"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         logoPath = aDecoder.decodeObject(forKey: "logo_path") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         originCountry = aDecoder.decodeObject(forKey: "origin_country") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if logoPath != nil{
            aCoder.encode(logoPath, forKey: "logo_path")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if originCountry != nil{
            aCoder.encode(originCountry, forKey: "origin_country")
        }

    }

}

class ProductionCountry : NSObject, NSCoding, Mappable{

    var iso31661 : String?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return ProductionCountry()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        iso31661 <- map["iso_3166_1"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         iso31661 = aDecoder.decodeObject(forKey: "iso_3166_1") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if iso31661 != nil{
            aCoder.encode(iso31661, forKey: "iso_3166_1")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}

class SpokenLanguage : NSObject, NSCoding, Mappable{

    var englishName : String?
    var iso6391 : String?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return SpokenLanguage()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        englishName <- map["english_name"]
        iso6391 <- map["iso_639_1"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         englishName = aDecoder.decodeObject(forKey: "english_name") as? String
         iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if englishName != nil{
            aCoder.encode(englishName, forKey: "english_name")
        }
        if iso6391 != nil{
            aCoder.encode(iso6391, forKey: "iso_639_1")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
