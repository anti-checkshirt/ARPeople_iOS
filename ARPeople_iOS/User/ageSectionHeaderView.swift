//
//  ageSectionHeaderView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ageSectionHeaderView: UITableViewHeaderFooterView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "年齢"
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.backgroundView = UIView() // 背景透明化
        self.contentView.addSubview(self.titleLabel)
        
        // Layout
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualToSuperview()
            make.left.equalTo(self.contentView.snp.leftMargin)
            make.bottom.equalTo(self.contentView.snp.bottomMargin)
        }
    }
}
