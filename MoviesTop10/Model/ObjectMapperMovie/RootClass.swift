//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RootClass : NSObject, NSCoding, Mappable{

	var page : Int?
	var results : [Result]?
	var totalPages : Int?
	var totalResults : Int?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		page <- map["page"]
		results <- map["results"]
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
         results = aDecoder.decodeObject(forKey: "results") as? [Result]
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
		if results != nil{
			aCoder.encode(results, forKey: "results")
		}
		if totalPages != nil{
			aCoder.encode(totalPages, forKey: "total_pages")
		}
		if totalResults != nil{
			aCoder.encode(totalResults, forKey: "total_results")
		}

	}

}