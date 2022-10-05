//
//  MyTextField.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import UIKit

class MyTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        font = UIFont(name: "Helvetica", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        //backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
