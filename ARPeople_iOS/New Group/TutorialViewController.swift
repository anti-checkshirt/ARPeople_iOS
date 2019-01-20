//
//  TutorialViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        let tutorial1 = toView(tutorial: .first)
        self.baseView.addSubview(tutorial1)
        tutorial1.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(baseScrollView)
        }
        let tutorial2 = toView(tutorial: .second)
        self.baseView.addSubview(tutorial2)
        tutorial2.snp.makeConstraints { make in
            make.left.equalTo(tutorial1.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(baseScrollView)
        }
        let tutorial3 = toView(tutorial: .thaad)
        self.baseView.addSubview(tutorial3)
        tutorial3.snp.makeConstraints { make in
            make.left.equalTo(tutorial2.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(baseScrollView)
        }
    }
    
    private func toView(tutorial: Tutorial) -> UIView {
        let nibView = UINib(nibName: "Tutorial1", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! TutorialView
        nibView.setUp(tutorial: tutorial)
        return nibView
    }
}

extension TutorialViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = scrollView.currentPage - 1
    }
}
