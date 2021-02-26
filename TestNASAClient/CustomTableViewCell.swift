//
//  CustomTableViewCell.swift
//  TestNASAClient
//
//  Created by Raghu, Reshma L on 26/02/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
