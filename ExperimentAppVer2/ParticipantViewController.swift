//
//  ParticipantViewController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/7.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class ParticipantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
    }
    
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func favoriteButton(_ sender: UIButton) {
        allButton.setTitleColor(#colorLiteral(red: 0.7567955852, green: 0.7569057345, blue: 0.7567715049, alpha: 1), for: .normal)
        favoriteButton.setTitleColor(#colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1), for: .normal)
        allButton.layer.shadowOpacity = 0
        favoriteButton.layer.shadowOpacity = 0.5
    }
    @IBAction func allButton(_ sender: UIButton) {
        allButton.setTitleColor(#colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1), for: .normal)
        favoriteButton.setTitleColor(#colorLiteral(red: 0.7567955852, green: 0.7569057345, blue: 0.7567715049, alpha: 1), for: .normal)
        allButton.layer.shadowOpacity = 0.5
        favoriteButton.layer.shadowOpacity = 0
    }
    
    var information: [Information] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        information = createArray()
        
        
//        var insets = UIEdgeInsets()
//        insets.top = 3
//        insets.bottom = -3.0
//
//        self.recentItem.imageInsets = insets
//        self.recentItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
       
        
//        tabBar.tintColor = #colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1)
//        tabBar.selectedItem = tabBar.items?.first
//
    }
    
    func createArray() -> [Information] {
        
        var tempImage: [Information] = []
        let dates = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: dates)
        let month = calendar.component(.month, from: dates)
        
        let Image1 = Information(image: #imageLiteral(resourceName: "onsei_ninshiki_computer"), title: "音声識別実験", price:"￥1000", date: "\(month).\(day)")
        let Image2 = Information(image: #imageLiteral(resourceName: "medical_nouha_shindan"), title: "EEG実験", price: "￥1500", date: "\(month).\(day)")
        let Image3 = Information(image: #imageLiteral(resourceName: "pasokon_kyoushitsu_woman"), title: "行動実験", price: "￥1000", date: "\(month).\(day)")
        let Image4 = Information(image: #imageLiteral(resourceName: "kenkoushindan_mri_man"), title: "FMRI実験", price: "￥2000", date: "\(month).\(day)")
        
        tempImage.append(Image1)
        tempImage.append(Image2)
        tempImage.append(Image3)
        tempImage.append(Image4)
        
        return tempImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let informations = information[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.setInformation(informations: informations)
        cell.saveButton.setImage(#imageLiteral(resourceName: "Image-2"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136.2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
