//
//  ViewController.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/23/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PINRemoteImage

class ViewController: UIViewController {

    //Outlets Declaration
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var totalImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmedLabel.customized()
        deathsLabel.customized()
        recoveredLabel.customized()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .darkGray
        activityIndicator.center = view.center
        totalImageView.contentMode = .scaleToFill
        activityIndicator.startAnimating()
        
        navigationItem.title = "Last News"
        getData()
        
    }
    
   func getData(){
        API.data { (error, confirmed, deaths, recovered) in
            self.totalImageView.pin_setImage(from: URL.init(string: "https://covid19.mathdro.id/api/og"), placeholderImage: UIImage(named:"Covid-19"))
            self.confirmedLabel.text = "\(confirmed?["value"] ?? "")"
            self.deathsLabel.text = "\(deaths?["value"] ?? "")"
            self.recoveredLabel.text = "\(recovered?["value"] ?? "")"
            self.activityIndicator.stopAnimating()
        }
    }
}
extension UILabel{
    func customized(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
        self.textAlignment = .center
    }
}






