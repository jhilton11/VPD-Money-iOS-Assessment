//
//  DetailViewController.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var user: User?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.isUserInteractionEnabled = true
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        touchGesture.numberOfTapsRequired = 1
        touchGesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(touchGesture)
        return imageView
    }()
    
    lazy var name: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Name: "
        return label
    }()
    
    lazy var email: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Email: "
        return label
    }()
    
    lazy var username: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Username: "
        return label
    }()
    
    lazy var phone: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Phone: "
        return label
    }()
    
    lazy var address: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Address: "
        label.numberOfLines = 0
        return label
    }()
    
    lazy var website: UserLabel = {
        let label = UserLabel(frame: .zero)
        label.text = "Website: "
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = user!.name

        view.addSubview(imageView)
        view.addSubview(name)
        view.addSubview(username)
        view.addSubview(email)
        view.addSubview(phone)
        view.addSubview(website)
        view.addSubview(address)
        
        setConstraints()
        configure(with: user!)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        } else {
            print("Unable to load image")
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func configure(with user: User) {
        name.text = "Name: \(user.name)"
        email.text = "Email: \(user.email)"
        phone.text = "Phone: \(user.phone)"
        website.text = "Website: \(user.website)"
        username.text = "Username: \(user.username)"
        let add = user.address
        address.text = "Address: \(add.suite), \(add.street), \(add.city)"
    }
    
    @objc func didTapButton() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.sourceType = .photoLibrary
            vc.cameraCaptureMode = .photo
            vc.allowsEditing = true
            present(vc, animated: true)
        } else {
            print("No Camera")
            let dialog = UIAlertController(title: "No Camera Found", message: "Unable to launch camera because no camera was found on device", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel) { action in
                dialog.dismiss(animated: true)
            }
            dialog.addAction(cancel)
            present(dialog, animated: true)
        }
        
    }
    
    func setConstraints() {
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            phone.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            phone.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 10),
            address.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            address.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            website.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            website.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            website.trailingAnchor.constraint(equalTo: name.trailingAnchor),
        ])
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
