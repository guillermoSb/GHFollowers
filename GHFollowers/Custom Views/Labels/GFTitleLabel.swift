//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/29/23.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(title: String, textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: CGRect.zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true // In case the title is to long to fit
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail   // Make the title just one line
        
    }
    

}
