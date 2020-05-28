//
//  AffectedCountriesViewController.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/24/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PINRemoteImage

class AffectedCountriesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //OutletsDecalration
   
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lastUpdateImageView: UIImageView!
    
    
    var countries = [CountriesISO]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        confirmedLabel.customized()
        deathsLabel.customized()
        recoveredLabel.customized()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        navigationItem.title = "Affected Countries"
        lastUpdateImageView.contentMode = .scaleAspectFit
        getData()
        
        
    }
    
    //MARK:- PickerView DataSource Methods:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].countryName
    }
    
    //MARK:- PickerView Delegate Methods:
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        API.getCountries(country: countries[row].countryName) { (error, confirmed, deaths, recovered) in
            self.lastUpdateImageView.pin_setImage(from: URL.init(string: URLs.countriesURL+self.countries[row].countryName+"/og"), placeholderImage: UIImage(named: "Covid-19"))
            self.confirmedLabel.text = "\(confirmed?["value"] ?? "Data Unavailable!")"
            self.deathsLabel.text = "\(deaths?["value"] ?? "Data Unavailable!")"
            self.recoveredLabel.text = "\(recovered?["value"] ?? "Data Unavailable!")"
            self.activityIndicator.stopAnimating()
        }
     
    }
    
    func getData(){
        API.getCountriesISO { (error, countries : [CountriesISO]?) in
            if let country = countries{
                self.countries = country
                self.pickerView.reloadAllComponents()
            }
        }
    }
   
}

