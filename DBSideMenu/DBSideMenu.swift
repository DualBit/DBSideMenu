//
//  DBSideMenu.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
open class DBSideMenu: UIView, DBSideMenuItemDelegate {
    
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
        self.singleInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.config = DBSideMenuConfig()
        super.init(coder: aDecoder)
        
        self.commonInit()
        self.singleInit()
    }
    
    public convenience init(config: DBSideMenuConfig) {
        self.init(frame: .zero)
        self.config = config
        
        self.commonInit()
        self.singleInit()
    }
    
    public convenience init(bgColor: UIColor, menuItems: [DBSideMenuItem], menuSize: CGSize = .zero) {
        self.init(config: DBSideMenuConfig())
        self.backgroundColor = bgColor
        self.menuSize = menuSize == .zero ? self.frame.size : menuSize
    }
    
    public func setMenuItems(menuItems: [DBSideMenuItem]) {
        for menuItem in menuItems {
            menuItem.delegate = self
            self.stackView.addArrangedSubview(menuItem)
        }
    }
    
    public func setSideMenu(bgColor: UIColor = UIColor(named: "defaultColor") ?? .black, menuItems: [DBSideMenuItem], menuSize: CGSize) {
        self.backgroundColor = bgColor
        self.menuSize = menuSize
        self.setMenuItems(menuItems: menuItems)
    }
    
    public func commonInit() {
        self.backgroundColor = self.config.color
        self.stackView.alignment = .fill
        self.stackView.distribution = .fillEqually
        self.stackView.axis = .vertical
    }
    
    private func singleInit() {
        self.addSubview(self.stackView)
        self.stackView.bindFrameToSuperviewBounds()
    }
    
    // MARK: DBSideMenuItem delegate methods
    public func resetButtonsState() {
        for stackViewItem in self.stackView.arrangedSubviews {
            if let menuItem = stackViewItem as? DBSideMenuItem {
                menuItem.resetState()
            }
        }
    }
    
    
}
