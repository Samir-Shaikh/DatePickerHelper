//
//  DatePickerHelper.swift
//  MaiStro-Vendor
//
//  Created by Sam on 18/01/21.
//  Copyright © 2021 samir. All rights reserved.
//

import UIKit

class DatePickerHelper: NSObject {
    
    //MARK: Variables
    static let shared = DatePickerHelper()
    private var toolBar : UIToolbar!
    private var datePicker : UIDatePicker!
    private var completion : ((Date) -> ())?
    
    func openDatePicker(datePickerMode : UIDatePicker.Mode,selectedDate:Date,minDate:Date,maxDate:Date,completion:@escaping ((Date)->())){
        
        self.completion = completion
        let window = UIApplication.shared.windows.first!
        
        //picker
        datePicker = UIDatePicker.init()
        datePicker.autoresizingMask = .flexibleWidth
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.backgroundColor = .white
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        
       
        //set data
        datePicker.datePickerMode = datePickerMode
        datePicker.date = selectedDate
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        
        
        //toolbar
        toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "  Cancel", style: .plain, target: self, action: #selector(self.cancelPressed))
        let doneBarButton = UIBarButtonItem(title: "Done  ", style: .plain, target: self, action: #selector(self.onDoneButtonClick))
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        toolBar.sizeToFit()
        
        window.addSubview(self.datePicker)
        window.addSubview(self.toolBar)
        
        datePicker.alpha = 0
        toolBar.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.datePicker.alpha = 1
            self.toolBar.alpha = 1
        }
    }
    
    @objc private func cancelPressed() {
        
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    @objc private func onDoneButtonClick() {
        
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
        self.completion?(datePicker.date)
    }
}
