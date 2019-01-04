//
//  UserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    
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
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.setImage(url: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        return imageView
    }()
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

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        baseScrollView.backgroundColor = .white
        baseScrollView.delegate = self
        view.addSubview(baseScrollView)
        baseScrollView.addSubview(imageContainer)
        baseScrollView.addSubview(headerImageView)
        baseScrollView.addSubview(userImageView)
        baseScrollView.addSubview(nameLabel)
        baseScrollView.addSubview(jobLabel)
        baseScrollView.addSubview(twitterButton)
        baseScrollView.addSubview(githubButton)
        view.addSubview(navigationBarBacking)
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
        baseScrollView.contentSize = CGSize(width: baseScrollView.frame.width, height: baseScrollView.frame.height * 2)
        
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
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(5)
            make.left.equalTo(16)
        }
        
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(16)
        }
        
        twitterButton.snp.makeConstraints { make in
            make.top.equalTo(jobLabel.snp.bottom).offset(5)
            make.left.equalTo(16)
            make.width.height.equalTo(44)
        }
        
        githubButton.snp.makeConstraints { make in
            make.top.equalTo(twitterButton)
            make.left.equalTo(twitterButton.snp.right).offset(16)
            make.width.height.equalTo(44)
        }
    }
    
    private func setLayout() {
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.backButtonTappend))
        leftBarButton.tintColor = .white
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(self.moveSetting))
        rightBarButton.tintColor = .white
        navigationItem.setRightBarButton(rightBarButton, animated: true)
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

extension UserViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
