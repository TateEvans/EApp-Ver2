//
//  Information.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/5/24.
//  Copyright © 2019 XHQ. All rights reserved.
//

import Foundation
import UIKit

class Information {
    
    var image: UIImage
    var title: String
    var price: String
    var date: String
    
    init(image: UIImage, title: String, price: String, date: String) {
        self.image = image
        self.title = title
        self.price = price
        self.date = date
    }
}
