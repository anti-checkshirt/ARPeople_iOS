//
//  StoryBoards.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2019/01/12.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class Storyboards {
    
    fileprivate init() {}
    
    static let settingUserNav = Storyboard<SettingViewController>(name: "SettingUser")
    static let registerNav = Storyboard<UINavigationController>(name: "Register")
}

// MARK: - Storyboard -

final class Storyboard<InitialVC: UIViewController>: Storyboards {
    
    let name: String
    
    fileprivate init(name: String) {
        self.name = name
    }
    
    func instantiateViewController() -> InitialVC {
        let storyboard = UIStoryboard(name: self.name, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else {
            assertionFailure("\(self.name).storyboardでinitialVCが設定されていません")
            return InitialVC()
        }
        guard let initialVC = vc as? InitialVC else {
            assertionFailure("\(self.name).storyboardのinitialVCは\(type(of: vc.self))型です")
            return InitialVC()
        }
        return initialVC
    }
}
