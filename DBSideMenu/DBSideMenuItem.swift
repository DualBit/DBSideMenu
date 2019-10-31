//
//  DBSideMenuItem.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

open class DBSideMenuItem: NSObject {
    
    public var title: String = ""
    public var image: UIImage = UIImage.init()
    public var tintColor: UIColor = .white
    public var selectedTintColor: UIColor = .white
    public var selectedBackgroundColor: UIColor = .white

    var button: UIButton!

    public convenience init(with title: String, image: UIImage, tintColor: UIColor, selectedTintColor: UIColor = .white, selectedBackgroundColor: UIColor) {
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
