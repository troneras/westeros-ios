//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import UIKit

extension UIViewController{
    
    func wrappedInNavigation()->UINavigationController{
        return UINavigationController(rootViewController: self)
    }
}
