//
//  TitleTableViewCell.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    @IBOutlet weak var mTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mTitleLabel.textColor = .black
        mTitleLabel.font = .montserratBold(16)
    }
    
    func setupCell(_ title: String) {
        mTitleLabel.text = title
    }
}
