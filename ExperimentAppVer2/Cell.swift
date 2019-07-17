//
//  Cell.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/5/23.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    
    @IBOutlet weak var sampleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var isTapped : Bool = false
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        isTapped = !isTapped
        
        if isTapped {
            saveButton.setImage(#imageLiteral(resourceName: "Image-1"), for: .normal)
        } else {
            saveButton.setImage(#imageLiteral(resourceName: "Image-2"), for: .normal)
        }
    }
    
    var informationsItem : Information!
    
    func setInformation(informations: Information) {
        informationsItem = informations
        sampleImageView.image = informations.image
        titleLabel.text = informations.title
        priceLabel.text = informations.price
        dateLabel.text = informations.date
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func fill(title: String, date: String) {
//        titleLabel.text = title
//        dateLabel.text = date
//    }
}
