//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/5/23.
//

import UIKit

class GFEmptyStateView: UIView {

    let messageLabel = GFTitleLabel(title: "This user does not have any followers 😔.", textAlignment: .center, fontSize: 28 )
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(with: "There are no results")
    }
    
    init(with message: String) {
        super.init(frame: .zero)
        configure(with: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with message: String) {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.text = message
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),   // Image is 30% larger than the screen
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
        
        
    }

}
