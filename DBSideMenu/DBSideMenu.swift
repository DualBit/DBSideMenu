//
//  DBSideMenu.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

open class DBSideMenu: UIView {

    //private var menuButtons = [UIButton]()
    public var menuItems = [DBSideMenuItem]()
    public var menuSize : CGSize = CGSize(width: UIScreen.main.bounds.size.width / 5, height: UIScreen.main.bounds.size.height)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    public convenience init(bgColor: UIColor, menuItems: [DBSideMenuItem], menuSize: CGSize) {
        self.init()
        self.backgroundColor = bgColor
        self.menuItems = menuItems
        self.menuSize = menuSize
    }
    
    public func setSideMenu(bgColor: UIColor, menuItems: [DBSideMenuItem], menuSize: CGSize) {
        self.backgroundColor = bgColor
        self.menuItems = menuItems
        self.menuSize = menuSize
        
        for menuItem in menuItems {
            menuItem.button = UIButton(frame: CGRect(x: 0, y: 0, width: self.menuSize.width, height: self.menuSize.width))
            menuItem.button.backgroundColor = menuItem.selectedBackgroundColor
            menuItem.button.setImage(menuItem.image, for: .normal)
            menuItem.button.setTitle(menuItem.title, for: .normal)
            menuItem.button.tintColor = menuItem.tintColor
            menuItem.button.setTitleColor(menuItem.tintColor, for: .normal)
            menuItem.button.setTitleColor(menuItem.selectedTintColor, for: .selected)
            menuItem.button.alignImageAndTitleVertically()
            //menuItem.button.addTarget(menuItem, action: #selector(selectButton), for: .touchUpInside)
            self.addSubview(menuItem.button)
        }
        
    }

    public func commonInit() {
        self.backgroundColor = UIColor.systemYellow
    }
    
}

extension UIButton {

    func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding

        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )

        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }


}
