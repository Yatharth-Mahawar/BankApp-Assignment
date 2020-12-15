//
//  MyCell.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

import UIKit


class MyCell: UITableViewCell {
    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var ifscCode: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
