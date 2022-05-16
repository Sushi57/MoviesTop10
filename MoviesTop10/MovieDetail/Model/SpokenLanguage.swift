
import Foundation
import ObjectMapper


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
