//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/8/23.
//

import UIKit

protocol FollowerItemVCDelegate: AnyObject  {
    func didTapGithubFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    weak var delegate: FollowerItemVCDelegate!
    
    init(user: User, delegate: FollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .followers, with: user.followers)
        itemInfoView2.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    override func actionButtonTapped() {
        delegate.didTapGithubFollowers(for: user)
    }
}
