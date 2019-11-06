//
//  DBSideMenuItem.swift
//  DBSideMenu
//
//  Created by Alberto Paladino on 26/10/2019.
//  Copyright © 2019 DualBit. All rights reserved.
//

import UIKit

public protocol DBSideMenuItemDelegate {
    func resetButtonsState()
}

@available(iOS 11.0, *)
open class DBSideMenuItem: UIView {
    
    public var title: String = ""
    public var image: UIImage = UIImage.init()
    public var config: DBSideMenuItemConfig? {
        didSet {
            self.commonInit()
        }
    }
    private var button: UIButton!
    public var delegate: DBSideMenuItemDelegate?
    
    convenience init(config: DBSideMenuItemConfig) {
        self.init()
        self.config = config
        self.commonInit()
    }
    
    public convenience init(with title: String, image: UIImage, config: DBSideMenuItemConfig = DBSideMenuItemConfig()) {
        self.init()
        self.config = config
        self.title = title
        self.image = image
        
        self.commonInit()
        self.singleInit()
    }
    
    private func commonInit() {
        if (self.config == nil){
            self.config = DBSideMenuItemConfig()
        }
        if self.button == nil {
            self.button = UIButton()
        }
        
        self.button.setBackgroundColor(color: self.config?.backgroundItemColor ?? UIColor.clear, forState: .normal)
        self.button.setBackgroundColor(color: self.config?.selectedBackgroundItemColor ?? UIColor.clear, forState: .selected)
        self.button.tintColor = self.config?.imageColor
        self.button.setImage(self.image, for: .normal)
        self.button.setTitle(self.title, for: .normal)
        self.button.titleLabel?.font = UIFont.systemFont(ofSize: self.config!.titleFontSize)
        self.button.setTitleColor(self.config?.titleTextColor, for: .normal)
        self.button.setTitleColor(self.config?.selectedTitleTextColor, for: .selected)
    }
    
    private func singleInit() {
        self.button.addTarget(self, action: #selector(didTapMenuItem), for: .touchUpInside)
        self.addSubview(self.button)
        self.button.bindFrameToSuperviewBounds()
    }
    
    @objc func didTapMenuItem() {
        if let delegate = self.delegate {
            delegate.resetButtonsState()
        }
        self.button.isSelected = !self.button.isSelected
    }
    
    public func addAction(for controlEvents: UIControl.Event = .touchUpInside, closure: @escaping ()->(Void)) {
        self.button.addAction(for: controlEvents, closure)
    }
    
    public func setSelected(_ selected : Bool) {
        self.button.isSelected = selected
    }
    
    open override func didMoveToSuperview() {
        self.button.alignImageAndTitleVertically(padding: 6)
    }
    
    open func resetState() {
        self.button.isSelected = false
    }
    
}

@objc class ClosureSleeve: NSObject {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
    
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

extension UIView {
    
    /// Adds constraints to this UIView instances superview object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its superview is nil – add this UIView instance as a subview before calling this.
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! superview was nil – call addSubview(view: UIView) before calling bindFrameToSuperviewBounds() to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
    }
}
