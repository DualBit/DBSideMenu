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
    public var config: DBSideMenuItemConfig? {
        didSet {
            self.commonInit()
        }
    }
    
    var button: UIButton!

    convenience init(config: DBSideMenuItemConfig) {
        self.init()
        self.config = config
        self.commonInit()

    }
    
    private func commonInit() {
        if (self.config == nil){
            self.config = DBSideMenuItemConfig()
        }
        self.button = UIButton()
        self.button.backgroundColor = self.config?.backgroundItemColor
        self.button.tintColor = self.config?.imageColor
        self.button.titleLabel?.font = UIFont.systemFont(ofSize: self.config!.titleFontSize)
        self.button.setTitleColor(self.config?.titleTextColor, for: .normal)
        self.button.setTitleColor(self.config?.selectedTitleTextColor, for: .selected)


    }
    
    public convenience init(with title: String, image: UIImage) {
        self.init()
        if (self.config == nil){
            self.config = DBSideMenuItemConfig()
        }
        self.commonInit()
        self.title = title
        self.image = image
    }
    
    @objc func selectItem() {
        self.button.isSelected = true
    }

}
