//
//  ViewController.swift
//  table-view
//
//  Created by 홍성범 on 2022/09/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var moviesDataManager = DataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        tableView.delegate = self
        
        moviesDataManager.makeMoviesData()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        moviesDataManager.updateMovieData()
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDataManager.getMoviesData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        
        let movie = moviesDataManager.getMoviesData()[indexPath.row]
        cell.movieImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = moviesDataManager.getMoviesData()
            
            let index = sender as! IndexPath
            
            detailVC.movie = array[index.row]
        }
    }
}
