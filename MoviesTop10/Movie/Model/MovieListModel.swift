
import Foundation
import ObjectMapper


class MovieListModel : NSObject, NSCoding, Mappable{
    
    var page : Int?
    var movies : [Movie]?
    var totalPages : Int?
    var totalResults : Int?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return MovieListModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        page <- map["page"]
        movies <- map["results"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        page = aDecoder.decodeObject(forKey: "page") as? Int
        movies = aDecoder.decodeObject(forKey: "results") as? [Movie]
        totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int
        totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if page != nil{
            aCoder.encode(page, forKey: "page")
        }
        if movies != nil{
            aCoder.encode(movies, forKey: "results")
        }
        if totalPages != nil{
            aCoder.encode(totalPages, forKey: "total_pages")
        }
        if totalResults != nil{
            aCoder.encode(totalResults, forKey: "total_results")
        }
        
    }
    
}
