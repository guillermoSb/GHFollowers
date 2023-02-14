//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 2/8/23.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
    

}
