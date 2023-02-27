//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Guillermo Santos Barrios on 1/28/23.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    let tableView: UITableView = UITableView()
    var favorites: [Follower] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getFavorites()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds;
        tableView.removeExcessCells()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GFFavoriteCell.self, forCellReuseIdentifier: GFFavoriteCell.reuseID)
    }
    
    func getFavorites() {
        PersistenceManager.retreiveFavorites { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(view: self.view, with: "You have not selected any favorite")
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
                break
            }
        }
    }

}

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GFFavoriteCell.reuseID) as! GFFavoriteCell
        cell.set(favorite: favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = self.favorites[indexPath.row]
        let destVC = FollowerListVC(userName: favorite.login)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        PersistenceManager.updateWith(favorite: self.favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else {return}
            guard let error = error else {
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
