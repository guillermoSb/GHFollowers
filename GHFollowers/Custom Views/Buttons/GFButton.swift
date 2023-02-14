//
//  GFButton.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/28/23.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)    // Call the superclass because we are building on top of the UI Button
        configure()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)    // Call our super initializer
        self.backgroundColor = backgroundColor  // Set the background color to the one passed
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // We are not using storyboards
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius              = 10
        layer.cornerCurve               = .continuous
        setTitleColor(.white, for: .normal)
        titleLabel?.font                = UIFont.preferredFont(forTextStyle: .headline)
    }

}
