//
//  SettingUserViewController.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/15.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class SettingUserViewController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var pass2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pass1.isSecureTextEntry = true
        pass2.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
