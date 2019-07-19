//
//  PMessagerControllerClass.swift
//  ExperimentAppVer2
//
//  Created by XHQ on 2019/07/19.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class ExperimenterMember: NSObject {
    
    var name: String?
    var profileImageName: String?
    
}

class Message: NSObject {
    
    var text: String?
    var date: Date?
    
    var experimenter: ExperimenterMember?
    
}

extension PMessagerCollectionViewController {
    
    func setupData() {
        
        let ryan = ExperimenterMember()
        ryan.name = "Ryan"
        ryan.profileImageName = "icon1"
        let message1 = Message()
        message1.experimenter = ryan
        message1.text = "Hello, my name is Ryan. I want to ask something about our experiment..."
        message1.date = Date()
        
        let nike = ExperimenterMember()
        nike.name = "Nike"
        nike.profileImageName = "icon2"
        let message2 = Message()
        message2.experimenter = nike
        message2.text = "There is something wrong with my computer, so that..."
        message2.date = Date()
        
        let tate = ExperimenterMember()
        tate.name = "Tate"
        tate.profileImageName = "icon3"
        let message3 = Message()
        message3.experimenter = tate
        message3.text = "Thank you for helping my research! And I just want to..."
        message3.date = Date()
        
        messages = [message1, message2, message3]
    }

    
}
