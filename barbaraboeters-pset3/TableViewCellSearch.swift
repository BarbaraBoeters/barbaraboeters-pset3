//
//  TableViewCellSearch.swift
//  barbaraboeters-pset3
//
//  Created by Barbara Boeters on 18-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class TableViewCellSearch: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
