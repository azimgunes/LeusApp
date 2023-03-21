//
//  NewFeedViewCell.swift
//  LeusApp
//
//  Created by Azim Güneş on 18.03.2023.
//

import UIKit

class NewFeedViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userMailLabel: UILabel!
    
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButton(_ sender: Any) {
      print("Tıklandı.")
    }
    
    
    
}
