//
//  CountriesISO.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/27/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CountriesISO{
    var countryName: String
    init?(dict: [String:JSON]){
        guard let countryName = dict["name"]?.toString else{
            return nil
        }
        self.countryName = countryName
    }
}
