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
        label.font = .boldSystemFont(ofSize: 20)
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
            make.edges.equalTo(self.contentView.snp_margins)
        }
    }
}
