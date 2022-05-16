//
//  Constants.swift
//  MoviesTop10
//
//  Created by SAKSHI TIWARI on 15/05/22.
//

import Foundation

//MARK: - Defining Constants

let IMAGE_BASE_URL  = Bundle.main.infoDictionary?["Image_URL"] ?? ""
let SITE_URL = "https://www.themoviedb.org/movie"

//MARK: - Utilising Build Configurations
#if QA
    let SOME_SERVICE_KEY = "SomeKeyForQA"
#elseif PROD
    let SOME_SERVICE_KEY = "SomeKeyForPROD"
#else
    let SOME_SERVICE_KEY = "SomeKey"
#endif
