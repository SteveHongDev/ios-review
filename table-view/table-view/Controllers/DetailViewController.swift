//
//  DetailViewController.swift
//  table-view
//
//  Created by 홍성범 on 2022/09/13.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        movieImageView.image = movie?.movieImage
        movieNameLabel.text = movie?.movieName
        movieDescriptionLabel.text = movie?.movieDescription
    }
}
