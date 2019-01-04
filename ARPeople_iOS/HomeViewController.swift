//
//  HomeViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/19.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SwiftyTable

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "つながり"
        let userBarButtonItem = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(HomeViewController.userButtonTappend))
        navigationItem.setRightBarButtonItems([userBarButtonItem], animated: true)
        tableView.register(UserIndexTableViewCell.self)
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func userButtonTappend() {
        performSegue(withIdentifier: "toUser", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(of: UserIndexTableViewCell.self, for: indexPath)
        cell.setUp()
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
