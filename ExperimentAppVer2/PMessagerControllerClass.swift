//
//  PMessagerControllerClass.swift
//  ExperimentAppVer2
//
//  Created by XHQ on 2019/07/19.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit
//import RealmSwift

class Contacts: NSObject {

    var name: String?
    var profileImageName: String?

}

class Message: NSObject {

    var text: String?
    var date: Date?

    var contacts: Contacts?

}

extension PMessagerCollectionViewController {
    
    func setupData() {
        
        let ryan = Contacts()
        ryan.name = "Ryan"
        ryan.profileImageName = "icon1"
        
        
        let nike = Contacts()
        nike.name = "Nike"
        nike.profileImageName = "icon2"

        
        let tate = Contacts()
        tate.name = "Tate"
        tate.profileImageName = "icon3"
        
        
        createMessageWithText(text: "Hello, my name is Ryan. I want to ask something about our experiment...", experimenter: ryan, minutesAgo: 2)
        createMessageWithText(text: "There is something wrong with my computer, so that...", experimenter: nike, minutesAgo: 1)
        createMessageWithText(text: "Thank you for helping my research! And I just want to...", experimenter: tate, minutesAgo: 0)
        
//        let realm = try! Realm()
//
//        print(Realm.Configuration.defaultConfiguration.fileURL)
//
//        try! realm.write {
//            realm.add(ryan)
//            realm.add(nike)
//            realm.add(tate)
//        }

        
    }

    private func createMessageWithText(text: String, experimenter: Contacts, minutesAgo: Double) {
        let message = Message()
        message.text = text
        message.contacts = experimenter
        message.date = Date().addingTimeInterval(-minutesAgo * 60)
        messages?.append(message)
    }
    
}
