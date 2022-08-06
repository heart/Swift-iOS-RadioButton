//
//  RadioButtonGroup.swift
//  RedioButton
//
//  Created by narongrit kanhanoi on 6/8/2565 BE.
//

import NotificationCenter

class RadioButtonGroup {
    
    static let ON_GROUP_VALUE_CHANGED = NSNotification.Name("ON_GROUP_VALUE_CHANGED")
    
    static var groupValue: [String: String] = [:]
    
    static func changeGroupValue(group: String, value: String){
        groupValue[group] = value
        
        let data = [
            "group": group,
            "value": value
        ]
        
        NotificationCenter.default.post(name: ON_GROUP_VALUE_CHANGED, object: data)
    }
    
    static func getGroupValue(group: String) -> String? {
        return groupValue[group]
    }
    
    
    
}
