//
//  UserCell.swift
//  VPD Money Assessment
//
//  Created by user on 03/10/2022.
//

import UIKit

class UserCell: UITableViewCell {
    static let identifier = "userCell"
    
    //Create the UI elements programmatically
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var username: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var email: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(name)
        contentView.addSubview(username)
        contentView.addSubview(email)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with user: User) {
        name.text = user.name
        username.text = user.username
        email.text = user.email
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: name.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            //email.heightAnchor.constraint(equalToConstant: 20),
            email.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

}
