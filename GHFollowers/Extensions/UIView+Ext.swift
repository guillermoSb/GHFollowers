//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/26/23.
//

import UIKit
extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
