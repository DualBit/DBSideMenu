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
    public var menuItems: [DBSideMenuItem]!
    public var menuSize : CGSize = CGSize(width: UIScreen.main.bounds.size.width / 5, height: UIScreen.main.bounds.size.height)
    public var config: DBSideMenuConfig {
        didSet {
            self.commonInit()
        }
    }
    var stackView = UIStackView()
    
    override init (frame: CGRect) {
        self.config = DBSideMenuConfig()
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.config = DBSideMenuConfig()
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    public convenience init(config: DBSideMenuConfig) {
        self.init(frame: .zero)
        self.config = config
        self.commonInit()
    }
    
    public convenience init(bgColor: UIColor, menuItems: [DBSideMenuItem], menuSize: CGSize = .zero) {
        self.init(config: DBSideMenuConfig())
        self.backgroundColor = bgColor
        self.menuItems = menuItems
        self.menuSize = menuSize == .zero ? self.frame.size : menuSize
    }
    
    public func setMenuItems(menuItems: [DBSideMenuItem]) {
        self.menuItems = menuItems
        for menuItem in menuItems {
            menuItem.button.frame = CGRect(x: 0, y: 0, width: self.menuSize.width, height: self.menuSize.width)
            menuItem.button.setImage(menuItem.image, for: .normal)
            menuItem.button.setTitle(menuItem.title, for: .normal)
            menuItem.button.setTitleColor(menuItem.config?.titleTextColor, for: .normal)
            //debugPrint(menuItem.config?.titleTextColor)
            menuItem.button.alignImageAndTitleVertically()

            //menuItem.button.addTarget(menuItem, action: #selector(selectButton), for: .touchUpInside)
            self.stackView.addArrangedSubview(menuItem.button)
        }
    }
    
    public func setSideMenu(bgColor: UIColor = UIColor.init(named: "defaultColor") ?? .black, menuItems: [DBSideMenuItem], menuSize: CGSize) {
        self.backgroundColor = bgColor
        self.menuSize = menuSize
        self.setMenuItems(menuItems: menuItems)
        let stackViewHeight = Int(self.frame.size.width) * self.menuItems.count
        self.stackView.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: CGFloat(stackViewHeight))

    }
    
    public func commonInit() {
        self.backgroundColor = self.config.color
        self.stackView.alignment = .center
        self.stackView.distribution = .fillEqually
        self.stackView.axis = .vertical
        self.addSubview(self.stackView)
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
