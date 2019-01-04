//
//  SettingViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SafariServices

class SettingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let sections = ["アカウント", "サポート", "アプリについて"]
    private let accounts = ["ログアウト"]
    private let supports = ["お問い合わせ"]
    private let apps = ["利用規約", "プライバシーポリシー", "ライセンス"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "設定"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return accounts.count
        case 1:
            return supports.count
        case 2:
            return apps.count
        default:
            assertionFailure()
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = accounts[indexPath.row]
        case 1:
            cell.textLabel?.text = supports[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        case 2:
            cell.textLabel?.text = apps[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        default: break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            tableView.deselectRow(at: indexPath, animated: true)
            
        case (1, 0):
            performSegue(withIdentifier: "toInfo", sender: nil)
            
        case (2, 0):
            guard let url = URL(string: "https://tomoki69386.github.io/Qiita_Client/Service/Service") else { return }
            let SFVC = SFSafariViewController(url: url)
            present(SFVC, animated: true, completion: nil)
            
        case (2, 1):
            guard let url = URL(string: "https://tomoki69386.github.io/Qiita_Client/Privacy/Privacy") else { return }
            let SFVC = SFSafariViewController(url: url)
            present(SFVC, animated: true, completion: nil)
            
        case (2, 2):
            tableView.deselectRow(at: indexPath, animated: true)
            guard let url = URL(string: "app-settings:root=General&path=com.gekkado.lunascope") else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        default: break
        }
    }
}
