//
//  JSON+Extension.swift
//  Covid-19
//
//  Created by yosef elbosaty on 5/23/20.
//  Copyright © 2020 yosef elbosaty. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON{
    var toString : String?{
        if let string = self.string{return string}
        if let int = self.int {
            let string = String(int)
            return string
        }
    return nil
    }
}
