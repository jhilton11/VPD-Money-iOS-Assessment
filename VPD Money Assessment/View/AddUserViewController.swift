//
//  AddUserViewController.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import UIKit

class AddUserViewController: UIViewController, AddUserViewModelDelegate {
    var viewModel = AddUserViewModel()
    
    //Add all form textfields programmatically
    let textViewHeight = CGFloat(40)
    
    lazy var scrollview: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        //scrollview.backgroundColor = .gray
        return scrollview
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Full Name"
        return name
    }()
    
    lazy var emailTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Email"
        return name
    }()
    
    lazy var username: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Username"
        return name
    }()
    
    lazy var phoneTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Phone Number"
        return name
    }()
    
    lazy var websiteTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Website (Optional)"
        return name
    }()
    
    lazy var streetTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Street (Optional)"
        return name
    }()
    
    lazy var suiteTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Suite (Optional)"
        return name
    }()
    
    lazy var cityTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  City (Optional)"
        return name
    }()
    
    lazy var companyNameTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Company Name (Optional)"
        return name
    }()
    
    lazy var catchPhraseTv: MyTextField = {
        let name = MyTextField(frame: .zero)
        name.placeholder = "  Catch Phrase (Optional)"
        return name
    }()
    
    lazy var personDetailsLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Personal Details"
        name.font = UIFont(name: "Helvetica", size: 20)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var addressLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Address"
        name.font = UIFont(name: "Helvetica", size: 20)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var companyLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.text = "Company"
        name.font = UIFont(name: "Helvetica", size: 20)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Add New User"
        viewModel.delegate = self
        
        //Add all view constraints in code
        setUpConstraints()
        
    }
    
    @objc func submit() {
        print("Submit button tapped")
        
        var user = User(id: 6)
        user.name = nameTv.text!
        user.email = emailTv.text!
        user.username = username.text!
        user.phone = phoneTv.text!
        user.website = websiteTv.text!
        user.address.city = cityTv.text!
        user.address.suite = suiteTv.text!
        user.address.street = streetTv.text!
        user.company.name = companyNameTv.text!
        user.company.catchPhrase = catchPhraseTv.text!
        
        viewModel.user = user
        
        guard user.name.count>0 else {
            print("Enter name")
            displayAlertDialog("Please enter name")
            return
        }
        
        guard user.email.count>0, viewModel.isEmailValid() else {
            print("Enter valid email")
            displayAlertDialog("Please enter valid email")
            return
        }
        
        guard user.username.count>0 else {
            print("Enter username")
            displayAlertDialog("Please enter username")
            return
        }
        
        guard user.phone.count>0 else {
            print("Enter name")
            displayAlertDialog("Please enter phone number")
            return
        }
        
        print("Submitted")
        viewModel.saveUser(user)
    }
    
    func popVC() {
        print("In the pop vc method")
        let alert = UIAlertController(title: "Success", message: "User added successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {[weak self]
            _ in
            self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    func displayAlertDialog(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func setUpConstraints() {
        view.addSubview(scrollview)
        scrollview.addSubview(contentView)
        
        scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //scrollview.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollview.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollview.widthAnchor).isActive = true
        //contentView.heightAnchor.constraint(equalToConstant: 750).isActive = true
        
        //view.layoutIfNeeded()
        print("Scrollview width: \(scrollview.frame.width)")
        
        contentView.addSubview(personDetailsLabel)
        personDetailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        personDetailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        personDetailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        //nameTv.widthAnchor.constraint(equalToConstant: contentView.frame.width-22).isActive = true
        personDetailsLabel.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true
        
        contentView.addSubview(nameTv)
        nameTv.topAnchor.constraint(equalTo: personDetailsLabel.bottomAnchor).isActive = true
        nameTv.leadingAnchor.constraint(equalTo: personDetailsLabel.leadingAnchor).isActive = true
        nameTv.trailingAnchor.constraint(equalTo: personDetailsLabel.trailingAnchor).isActive = true
        //nameTv.widthAnchor.constraint(equalToConstant: contentView.frame.width-22).isActive = true
        nameTv.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true

        contentView.addSubview(emailTv)
        emailTv.topAnchor.constraint(equalTo: nameTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        emailTv.leftAnchor.constraint(equalTo: nameTv.leftAnchor).isActive = true
        emailTv.rightAnchor.constraint(equalTo: nameTv.rightAnchor).isActive = true
        emailTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true

        contentView.addSubview(username)
        username.topAnchor.constraint(equalTo: emailTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        username.leftAnchor.constraint(equalTo: emailTv.leftAnchor).isActive = true
        username.rightAnchor.constraint(equalTo: emailTv.rightAnchor).isActive = true
        username.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true

        contentView.addSubview(phoneTv)
        phoneTv.topAnchor.constraint(equalTo: username.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        phoneTv.leftAnchor.constraint(equalTo: username.leftAnchor).isActive = true
        phoneTv.rightAnchor.constraint(equalTo: username.rightAnchor).isActive = true
        phoneTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true

        contentView.addSubview(websiteTv)
        websiteTv.topAnchor.constraint(equalTo: phoneTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        websiteTv.leftAnchor.constraint(equalTo: phoneTv.leftAnchor).isActive = true
        websiteTv.rightAnchor.constraint(equalTo: phoneTv.rightAnchor).isActive = true
        websiteTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true

        contentView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: websiteTv.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: websiteTv.leftAnchor).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: websiteTv.rightAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(streetTv)
        streetTv.topAnchor.constraint(equalTo: addressLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        streetTv.leftAnchor.constraint(equalTo: addressLabel.leftAnchor).isActive = true
        streetTv.rightAnchor.constraint(equalTo: addressLabel.rightAnchor).isActive = true
        streetTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(suiteTv)
        suiteTv.topAnchor.constraint(equalTo: streetTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        suiteTv.leftAnchor.constraint(equalTo: streetTv.leftAnchor).isActive = true
        suiteTv.rightAnchor.constraint(equalTo: streetTv.rightAnchor).isActive = true
        suiteTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(cityTv)
        cityTv.topAnchor.constraint(equalTo: suiteTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        cityTv.leftAnchor.constraint(equalTo: suiteTv.leftAnchor).isActive = true
        cityTv.rightAnchor.constraint(equalTo: suiteTv.rightAnchor).isActive = true
        cityTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(companyLabel)
        companyLabel.topAnchor.constraint(equalTo: cityTv.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        companyLabel.leftAnchor.constraint(equalTo: nameTv.leftAnchor).isActive = true
        companyLabel.rightAnchor.constraint(equalTo: nameTv.rightAnchor).isActive = true
        companyLabel.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(companyNameTv)
        companyNameTv.topAnchor.constraint(equalTo: companyLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        companyNameTv.leftAnchor.constraint(equalTo: companyLabel.leftAnchor).isActive = true
        companyNameTv.rightAnchor.constraint(equalTo: companyLabel.rightAnchor).isActive = true
        companyNameTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(catchPhraseTv)
        catchPhraseTv.topAnchor.constraint(equalTo: companyNameTv.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        catchPhraseTv.leftAnchor.constraint(equalTo: companyNameTv.leftAnchor).isActive = true
        catchPhraseTv.rightAnchor.constraint(equalTo: companyNameTv.rightAnchor).isActive = true
        catchPhraseTv.heightAnchor.constraint(equalToConstant: CGFloat(textViewHeight)).isActive = true
        
        contentView.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: catchPhraseTv.bottomAnchor, constant: 20).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: nameTv.leadingAnchor).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: nameTv.trailingAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
