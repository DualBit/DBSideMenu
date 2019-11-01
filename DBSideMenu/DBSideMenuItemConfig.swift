//
//  SHSearchBarConfig.swift
//  SHSearchBar
//
//  Created by Stefan Herold on 17/08/16.
//  Copyright © 2016 StefanHerold. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
public struct DBSideMenuItemConfig {
    /// The animation duration for showing/hiding the cancel button.
    public var titleTextColor: UIColor = defaultTextColor
    
    /// The animation duration for showing/hiding the cancel button.
    public var selectedTitleTextColor: UIColor = defaultTextColor
    
    /// The width and height for one square of the layout raster. All sizes, margins, distances, etc. are calculated as multiples of this value.
    public var titleFontSize: CGFloat = 15.0
    
    /// The animation duration for showing/hiding the cancel button.
    public var imageColor: UIColor = defaultImageColor
    
    /// The animation duration for showing/hiding the cancel button.
    public var backgroundItemColor: UIColor = defaultBackgroundItemColor
    
    /// The animation duration for showing/hiding the cancel button.
    public var selectedBackgroundItemColor: UIColor = defaultBackgroundItemSelectedColor
    
    /// Controls the visibility of the cancel button
    public var showTitle: Bool = false
    
    // MARK: - Lifecycle
    
    /// Use this initializer and then set the properties to your desired values.
    public init() {}
    
    // MARK: - Defaults
    
    /// This is used as the default text foreground color for button and text in the searchbar if nothing has been set by the user.
    public static var defaultTextColor = UIColor.white
    public static var defaultImageColor = UIColor.white
    public static var defaultBackgroundItemColor = UIColor.clear
    public static var defaultBackgroundItemSelectedColor = UIColor.darkGray
    
}

