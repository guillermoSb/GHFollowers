//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/31/23.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeHolderImage = Images.placeholder
    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage!
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let image = image, let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    
    
}
