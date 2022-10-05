//
//  ViewController.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeViewModelDelegate {
    let viewModel = HomeViewModel()
    
    //Create tableview UI
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Add add bar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUser))
        
        title = "Home"
        table.dataSource = self
        table.delegate = self
        viewModel.delegate = self
        
        view.addSubview(table)
        table.frame = view.bounds
        view.backgroundColor = .gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getUsers(urlString: "https://jsonplaceholder.typicode.com/users")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)
        //print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = DetailViewController()
        detailViewController.user = viewModel.users[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func handleError(error: Error) {
        //handle errors
    }
    
    func handleData() {
        //print("Found \(users.count) users")
        table.reloadData()
    }
    
    @objc func addUser() {
        let addUserVC = AddUserViewController()
        navigationController?.pushViewController(addUserVC, animated: true)
    }

}

