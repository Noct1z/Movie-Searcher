//
//  MovieTableViewCell.swift
//  Movie Searcher
//
//  Created by nstudent on 3/11/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    static let identifier = "MovieTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
        
    }
    
    func configure(with model: Movie) {
        self.movieTitleLabel.text = model.Title
        self.movieYearLabel.text = model.Year
        let url = model.Poster
        
        // Use URLSession to asynchronously fetch the image
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            // Check for errors and unwrap the data
            if let data = data, let image = UIImage(data: data) {
                // Update UI on the main thread
                DispatchQueue.main.async {
                    self.moviePosterImageView.image = image
                }
            }
        }.resume()
    }
    
    
}
