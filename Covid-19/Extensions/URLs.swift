//
//  URLs.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/23/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import Foundation

struct URLs{
    static let baseURL = "https://covid19.mathdro.id/api/"
    
    static let totalURL = baseURL + "countries/[country]"
    static let countriesURL = baseURL+"countries/"
    static let countriesISOURL = baseURL+"countries"
}
