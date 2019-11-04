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
            
        var itemConfig = DBSideMenuItemConfig()
        itemConfig.titleFontSize = 12
        itemConfig.selectedBackgroundItemColor = .green
       
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30)
        let homeMenuItem = DBSideMenuItem(
            with: "Home",
            image: (UIImage.init(systemName: "house.fill", withConfiguration: symbolConfiguration)!),
            config: itemConfig
        )
        homeMenuItem.addAction(for: .touchUpInside) { () -> (Void) in
            debugPrint("home pressed")
        }
        let trashMenuItem = DBSideMenuItem(
            with: "Fornitori",
            image: (UIImage.init(systemName: "star.circle", withConfiguration: symbolConfiguration)!),
            config: itemConfig
        )
        
        let bohMenuItem = DBSideMenuItem(
            with: "Clienti",
            image: (UIImage.init(systemName: "person.3.fill", withConfiguration: symbolConfiguration)!),
            config: itemConfig
        )

        let bohMenuItem2 = DBSideMenuItem(
            with: "Clienti",
            image: (UIImage.init(systemName: "person.3.fill", withConfiguration: symbolConfiguration)!)
        )
        bohMenuItem2.config = itemConfig

        self.sideMenu.setSideMenu(
            bgColor: UIColor(named: "defaultColor")!,
            menuItems: [trashMenuItem,homeMenuItem,bohMenuItem,bohMenuItem2],
            menuSize: CGSize.init(width: self.sideMenu.frame.size.width, height: self.sideMenu.frame.size.height)
        )
    }

}
