//
//  UserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SwiftyTable

class UserViewController: BaseViewController {
    
    private let baseScrollView = UIScrollView()
    private let imageContainer = UIView()
    private let navigationBarBacking = UIView()

    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setImage(url: "https://pbs.twimg.com/profile_banners/764414957920276480/1543038909/1500x500")
        return imageView
    }()
    private let userImageView = UserImageView()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "築山 朋紀"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "フリーランス/iOSエンジニア"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let profileMessage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "中1のときから不登校でその後一切学校に行かず、面接だけで受かる通信孤高も退学し、現在はフリーのiOSエンジニアをしております。\n\nご飯を食べたり寝たりする時間を忘れてコードを書く人とはいい話ができそうです。\n\nSwift\nRailsちょっと"
        return label
    }()
    private let twitterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "1DA1F2")
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        return button
    }()
    private let githubButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "181717")
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        return button
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.register(AgeSectionHeaderView.self)
        tableView.register(NormalTableViewCell.self)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    private let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("変更", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.rx.tap.subscribe(onNext: { _ in
            self.performSegue(withIdentifier: "toUserEdit", sender: nil)
        }).disposed(by: self.disposeBag)

        setLayout()
        showRequest()
        userImageView.setImage(url: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        baseScrollView.backgroundColor = .white
        baseScrollView.delegate = self
        view.addSubview(baseScrollView)
        baseScrollView.addSubview(imageContainer)
        baseScrollView.addSubview(headerImageView)
        baseScrollView.addSubview(userImageView)
        baseScrollView.addSubview(editButton)
        baseScrollView.addSubview(nameLabel)
        baseScrollView.addSubview(jobLabel)
        baseScrollView.addSubview(profileMessage)
        baseScrollView.addSubview(twitterButton)
        baseScrollView.addSubview(githubButton)
        baseScrollView.addSubview(tableView)
        view.addSubview(navigationBarBacking)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func showRequest() {
        UserAPI.fetchGetUser { (result) in
            switch result {
            case .success(let decoded):
                self.nameLabel.text = decoded.name
                self.jobLabel.text = decoded.job
            case .failure(_, let statusCode):
                print(statusCode ?? "")
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationBarBacking.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        baseScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        imageContainer.snp.makeConstraints { make in
            make.top.equalTo(baseScrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageContainer.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(navigationBarBacking).priority(.high)
        }
        
        headerImageView.snp.makeConstraints { make in
            make.left.right.equalTo(imageContainer)
            make.top.equalTo(view).priority(.high)
            make.height.greaterThanOrEqualTo(imageContainer).priority(.high)
            make.bottom.equalTo(imageContainer)
        }
        
        userImageView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.width.height.equalTo(100)
            make.top.equalTo(imageContainer.snp.bottom).inset(50)
        }
        
        editButton.snp.makeConstraints { make in
            make.right.equalTo(view).inset(16)
            make.bottom.equalTo(userImageView)
            make.height.equalTo(36)
            make.width.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(5)
            make.left.equalTo(16)
        }
        
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(16)
        }
        
        profileMessage.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(view).inset(16)
            make.top.equalTo(jobLabel.snp.bottom).offset(5)
        }
        
        twitterButton.snp.makeConstraints { make in
            make.top.equalTo(profileMessage.snp.bottom).offset(20)
            make.left.equalTo(16)
            make.width.height.equalTo(44)
        }
        
        githubButton.snp.makeConstraints { make in
            make.top.equalTo(twitterButton)
            make.left.equalTo(twitterButton.snp.right).offset(16)
            make.width.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(githubButton.snp.bottom).offset(10)
            make.height.equalTo(view)
        }
        baseScrollView.contentSize = CGSize(width: view.frame.width, height: tableView.frame.maxY)
    }
    
    private func setLayout() {
        let backView = DoneBarButtonView(image: UIImage(named: "back"), currentButton: .back)
        backView.delegate = self
        let backBarButtonItem = UIBarButtonItem(customView: backView)
        navigationItem.setLeftBarButton(backBarButtonItem, animated: true)
        let settingView = DoneBarButtonView(image: UIImage(named: "setting"), currentButton: .setting)
        settingView.delegate = self
        let settingBarButtonItem = UIBarButtonItem(customView: settingView)
        navigationItem.setRightBarButton(settingBarButtonItem, animated: true)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    @objc private func backButtonTappend() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func moveSetting() {
        performSegue(withIdentifier: "toSetting", sender: nil)
    }
}

extension UserViewController {
    private enum Section: Int, TableSection, CaseIterable {
        case age
        case social
    }
}

extension UserViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(section) {
        case .age:
            return 1
        case .social:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(of: NormalTableViewCell.self, for: indexPath)
        tableView.separatorColor = .white
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch Section(section) {
        case .age:
            let header = tableView.dequeueReusableHeaderFooterView(of: AgeSectionHeaderView.self)
            header?.titleLabel.text = "生年月日"
            return header
        case .social:
            let header = tableView.dequeueReusableHeaderFooterView(of: AgeSectionHeaderView.self)
            header?.titleLabel.text = "ソーシャル"
            return header
        }
    }
}

extension UserViewController: DoneBarButtonViewDelegate {
    func didTappendButton(_ doneBarButtonView: DoneBarButtonView, currentButton: DoneBarButtonView.currentButton) {
        switch currentButton {
        case .back:
            self.dismiss(animated: true, completion: nil)
        case .setting:
            self.performSegue(withIdentifier: "toSetting", sender: nil)
        case .done:
            break
        }
    }
    
    
}
