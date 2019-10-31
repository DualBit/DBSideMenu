//
//  DBSideMenuItem.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

class DBSideMenuItem: NSObject {
    
    var title: String = ""
    var image: UIImage = UIImage.init()
    var tintColor: UIColor = .white
    var selectedTintColor: UIColor = .white
    var selectedBackgroundColor: UIColor = .white

    var button: UIButton!

    convenience init(with title: String, image: UIImage, tintColor: UIColor, selectedTintColor: UIColor = .white, selectedBackgroundColor: UIColor) {
        self.init()
        self.title = title
        self.image = image
        self.tintColor = tintColor
        self.selectedTintColor = selectedTintColor
        self.selectedBackgroundColor = selectedBackgroundColor
    }
    
    @objc func selectItem() {
        self.button.isSelected = true
    }

}
