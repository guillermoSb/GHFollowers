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
        addSubviews(messageLabel, logoImageView)
        configureMessageLabel(with: message)
        configureImage()
    }
    
    private func configureMessageLabel(with message: String) {

        messageLabel.text = message
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        let labelCenterYConstant: CGFloat = DeviceTypes.isIPhoneSE || DeviceTypes.isIPhone8Zoomed ? -50 : -150
        let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
        messageLabelCenterYConstraint.isActive = true
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureImage() {
  
        logoImageView.image = Images.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let logoBottomConstant: CGFloat = DeviceTypes.isIPhoneSE || DeviceTypes.isIPhone8Zoomed ? -60 : 40
        let logoImageViewBottomConstaint = logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
        logoImageViewBottomConstaint.isActive = true
        
        NSLayoutConstraint.activate([
           
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),   // Image is 30% larger than the screen
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
        ])
    }

}
