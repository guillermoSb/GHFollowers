//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/27/23.
//

import UIKit

extension UITableView {
    
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
