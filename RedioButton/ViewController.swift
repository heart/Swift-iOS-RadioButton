//
//  ViewController.swift
//  RedioButton
//
//  Created by narongrit kanhanoi on 6/8/2565 BE.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {

    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: RadioButtonGroup.ON_GROUP_VALUE_CHANGED, object: nil, queue: .main) { [weak self] noti in
            
            let data = noti.object as! [String: String]
            let g = data["group"]
            let v = data["value"]
            
            if g == "gender" {
                self?.text1.text = v
            }
            
            if g == "language" {
                self?.text2.text = v
            }
        }
        
    }

    @IBAction func submit(_ sender: Any) {
        text1.text = RadioButtonGroup.getGroupValue(group: "gender")
        text2.text = RadioButtonGroup.getGroupValue(group: "language")
    }
    
    @IBAction func changeValue(_ sender: Any) {
        RadioButtonGroup.changeGroupValue(group: "gender", value: "UNSPECIFTY")
    }
    
}

