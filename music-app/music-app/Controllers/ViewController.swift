//
//  ViewController.swift
//  music-app
//
//  Created by 홍성범 on 2022/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var musicTableView: UITableView!
    
    // let searchController = UISearchController()
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    var networkManager = NetworkManager.shared
    var musics = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
        setupData()
    }
    
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
    }
    
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    func setupData() {
        networkManager.fetchMusic(searchTerm: "blackpink") { result in
            switch result {
            case .success(let musics):
                self.musics = musics
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        cell.imageUrl = musics[indexPath.row].imageUrl
        cell.trackNameLabel.text = musics[indexPath.row].trackName
        cell.artistNameLabel.text = musics[indexPath.row].artistName
        cell.collectionNameLabel.text = musics[indexPath.row].albumName
        cell.releaseDateLabel.text = musics[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.musics = []
        
        networkManager.fetchMusic(searchTerm: searchText) { result in
            switch result {
            case .success(let musics):
                self.musics = musics
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let vc = searchController.searchResultsController as! SearchResultViewController
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
    
    
}
