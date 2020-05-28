//
//  API.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/23/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {

    
    class func data(completion: @escaping(_ error : Error?,_ confirmed: NSDictionary?,_ deaths: NSDictionary?,_ recovered: NSDictionary?)-> Void){
        let url = URLs.totalURL
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (response) in
        switch response.result{
        case .failure(let error): print(error); completion(error,nil,nil,nil)
        case .success(let value):
            let json = JSON(value)
            guard let confirmed = json["confirmed"].dictionary else{
                completion(nil,nil,nil,nil)
                return
            }
            guard let deaths = json["deaths"].dictionary else{
                           completion(nil,nil,nil,nil)
                return
            }
            guard let recovered = json["recovered"].dictionary else{
                           completion(nil,nil,nil,nil)
                return
            }
            completion(nil,confirmed as NSDictionary,deaths as NSDictionary,recovered as NSDictionary)
        }
    }
}
    
    class func getCountriesISO(completion: @escaping(_ error: Error?,_ countries: [CountriesISO]?)->Void){
        let url = URLs.countriesISOURL
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (response) in
            switch response.result{
            case .failure(let error): print(error); completion(error,nil)
            case .success(let value):
                let json = JSON(value)
               // print(json)
                guard let countries = json["countries"].array else{
                    completion(nil,nil)
                    return
                }
                var nation = [CountriesISO]()
                for country in countries{
                    if let data = country.dictionary, let country = CountriesISO.init(dict: data){
                        nation.append(country)
                    }
                }
                completion(nil,nation)
            }
        }
    }
    
    class func getCountries(country: String,completion : @escaping(_ error:Error?,_ confirmed: NSDictionary?,_ deaths: NSDictionary?,_ recovered: NSDictionary?)-> Void){
        let url = URLs.countriesURL+country
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (response) in
            
        switch response.result{
            case .failure(let error): print(error); completion(error,nil,nil,nil)
            case .success(let value):
                let json = JSON(value)
//                print(json)
            guard let confirmed = json["confirmed"].dictionary else{
                completion(nil,nil,nil,nil)
                    return
                    }
            guard let deaths = json["deaths"].dictionary else{
                completion(nil,nil,nil,nil)
                    return
                    }
            guard let recovered = json["recovered"].dictionary else{
                completion(nil,nil,nil,nil)
                    return
                    }
                completion(nil,confirmed as NSDictionary,deaths as NSDictionary,recovered as NSDictionary)
                    
                 }
             }
    }
    
    
    
//    class func countries(country: String ,completion: @escaping(_ error:Error?,_ countries : [Countries]?)->Void){
//        let countriesURL = URL.countriesURL+country
//        Alamofire.request(countriesURL, method: .get).responseJSON { (response) in
//            switch response.result{
//            case .failure(let error): print(error); completion(error,nil)
//            case .success(let value):
//                let countriesJSON = JSON(value)
//               // print(countriesJSON)
//                guard let data = countriesJSON["countries"].array else{
//                    return
//                }
//                var countries = [Countries]()
//                for country in data{
//                    if let data = country.dictionary, let country = Countries.init(dict: data){
//                        countries.append(country)
//                    }
//                }
//                completion(nil,countries)
//            }
//        }
//
//    }
//
}
