//
//  UserLabel.swift
//  VPD Money Assessment
//
//  Created by user on 03/10/2022.
//

import UIKit

class UserLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Helvetica", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
