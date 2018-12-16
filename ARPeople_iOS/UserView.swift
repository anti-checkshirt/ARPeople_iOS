//
//  UserView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/16.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SDWebImage

class UserView: UIView {
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        return view
    }()
    
    private let image = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .left
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let twitterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let githubLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    func setUp() {
        nameLabel.text = "日比野"
        ageLabel.text = "16歳"
        twitterLabel.text = "Twitter: _hibinokota_"
        githubLabel.text = "Github: hibino"
        image.image = UIImage(named: "ooUVH5FH_400x400")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseView.frame = self.bounds
        image.frame = CGRect(x: 0, y: 0, width: frame.width / 4, height: frame.height / 4)
        nameLabel.frame = CGRect(x: image.frame.maxX, y: 0, width: frame.width / 4 * 3, height: frame.height / 4)
        ageLabel.frame = CGRect(x: 0, y: nameLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        twitterLabel.frame = CGRect(x: 0, y: ageLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        githubLabel.frame = CGRect(x: 0, y: twitterLabel.frame.maxY, width: frame.width, height: frame.height / 4)
        
        self.addSubview(baseView)
        baseView.addSubview(image)
        baseView.addSubview(nameLabel)
        baseView.addSubview(ageLabel)
        baseView.addSubview(twitterLabel)
        baseView.addSubview(githubLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
