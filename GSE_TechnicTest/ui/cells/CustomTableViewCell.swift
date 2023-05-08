//
//  CustomTableViewCell.swift
//  GSE_TechnicTest
//
//  Created by Jonathan Perez on 7/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView : UIImageView?
    @IBOutlet weak var Name : UILabel!
    @IBOutlet weak var Email : UILabel!
    @IBOutlet weak var WebSite : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
