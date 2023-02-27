//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/29/23.
//

import UIKit

class GFBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: CGRect.zero)
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
    }
}
