//
//  InputField.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable
class InputField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 5
        self.backgroundColor = AppColor.bgGlay
    }
}

class AgeInputField: InputField {
    
    let datepicker = UIDatePicker()
    var dateFormat: String = "yyyy/MM/DD"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        let timeZone = datepicker.timeZone
        datepicker.timeZone = timeZone
        datepicker.datePickerMode = UIDatePicker.Mode.date
        datepicker.minimumDate = Date()
        
        let vi = UIView(frame: datepicker.bounds)
        vi.backgroundColor = UIColor.white
        vi.addSubview(datepicker)
        self.inputView = vi
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        let doneButton   = UIBarButtonItem(title: "決定", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
        let cancelButton = UIBarButtonItem(title: "キャンセル", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelPressed))
        let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        self.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        self.resignFirstResponder()
        self.text = "\(self.format(date: datepicker.date))"
    }
    
    @objc func cancelPressed() {
        self.resignFirstResponder()
        self.text = ""
    }
    
    func format(date: Date) -> String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = dateFormat
        let strDate = dateformatter.string(from: date)
        return strDate
    }
}
