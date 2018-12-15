//
//  UserView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .left
        label.backgroundColor = .red
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private let twitterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private let githubLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    func setUp() {
        nameLabel.text = "hibino"
        ageLabel.text = "16歳"
        twitterLabel.text = "_hibinokota_"
        githubLabel.text = "hibino"
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseView.frame = self.bounds
        nameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 4)
        ageLabel.frame = CGRect(x: 0, y: nameLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        twitterLabel.frame = CGRect(x: 0, y: ageLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        githubLabel.frame = CGRect(x: 0, y: twitterLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        
        self.addSubview(baseView)
        baseView.addSubview(nameLabel)
        baseView.addSubview(ageLabel)
        baseView.addSubview(twitterLabel)
        baseView.addSubview(githubLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
