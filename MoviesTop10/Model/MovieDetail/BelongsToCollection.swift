
import Foundation
import ObjectMapper


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
