//
//  RadioButton.swift
//  RedioButton
//
//  Created by narongrit kanhanoi on 6/8/2565 BE.
//

import UIKit
import NotificationCenter

@IBDesignable class RadioButton: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var radioLabel: UILabel!
    @IBOutlet weak var radioButton: UIImageView!
    
    
    @IBInspectable var label: String = "" {
        didSet{
            radioLabel.text = label
        }
    }
    
    @IBInspectable var group: String = ""
    @IBInspectable var value: String = ""
    
    
    // Instantiate Code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    // Instantiate Storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: RadioButton.self)
        
        let nibFile = UINib(nibName: "RadioButton", bundle: bundle)
        
        nibFile.instantiate(withOwner: self, options: nil)
        
        addSubview(view)
        view.frame = self.bounds
        
        
        radioButton.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onClick))
        radioButton.addGestureRecognizer(gesture)
        
        
        NotificationCenter.default.addObserver(forName: RadioButtonGroup.ON_GROUP_VALUE_CHANGED, object: nil, queue: .main) { [weak self] noti in
            
            let data = noti.object as! [String: String]
            let g = data["group"]
            let v = data["value"]
            
            if g == self?.group {
                if v == self?.value {
                    self?.radioButton.image = UIImage(named: "radio_active")
                }else{
                    self?.radioButton.image = UIImage(named: "radio_inactive")
                }
            }
            
        }
    }
    
    @objc func onClick(){
        RadioButtonGroup.changeGroupValue(group: group, value: value)
    }
    
    override func prepareForInterfaceBuilder() {
        
    }
    
}

