//
//  AgeSectionHeaderView.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class AgeSectionHeaderView: UITableViewHeaderFooterView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = AppColor.bg
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
        self.backgroundView = UIView()
        self.contentView.addSubview(self.titleLabel)
        
        // Layout
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.contentView.snp.leftMargin)
        }
    }
}
