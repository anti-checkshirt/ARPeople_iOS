//
//  HomeViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/19.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "つながり"
        let userBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(HomeViewController.userButtonTappend))
        navigationItem.setRightBarButtonItems([userBarButtonItem], animated: true)
        let nib = UINib(nibName: "UserIndex", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserIndex")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func userButtonTappend() {
        print("hoge")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserIndex", for: indexPath) as! UserIndexTableViewCell
        cell.setUp()
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
