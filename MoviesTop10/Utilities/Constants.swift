//
//  Constants.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 15/05/22.
//

import Foundation

//MARK: - Defining Constants

let API_KEY  = "api_key=e31023ca7a07ff97ae8dede026f9a082"

let BASE_URL  = "https://api.themoviedb.org/3/"
let IMAGE_BASE_URL  = Bundle.main.infoDictionary?["Image_URL"] ?? ""


let SITE_URL = "https://www.themoviedb.org/movie"
let REACHABLE_HOST = "www.apple.com"


//MARK: - Utilising Build Configurations
#if QA
    let SOME_SERVICE_KEY = "SomeKeyForQA"
#elseif PROD
    let SOME_SERVICE_KEY = "SomeKeyForPROD"
#else
    let SOME_SERVICE_KEY = "SomeKey"
#endif
