//
//  GFContainerView.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/29/23.
//

import UIKit

class GFContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16.0
        layer.cornerCurve = .continuous
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false

    }
}
