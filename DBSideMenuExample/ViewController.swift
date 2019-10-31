//
//  ViewController.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sideMenu: DBSideMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeMenuItem = DBSideMenuItem(with: "Home", image: (UIImage.init(systemName: "house")!), tintColor: .white, selectedTintColor: .white, selectedBackgroundColor: .blue)
        // Do any additional setup after loading the view.
        self.sideMenu.setSideMenu(bgColor: UIColor(named: "defaultColor")!, menuItems: [homeMenuItem], menuSize: CGSize.init(width: self.sideMenu.frame.size.width, height: self.sideMenu.frame.size.height))
    }


}

