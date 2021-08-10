//
//  ColorTableViewCell.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import UIKit
import AlamofireImage

class ColorTableViewCell: UITableViewCell {
    
    static let identifier = "ColorTableViewCell"
    
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mCreatorLabel: UILabel!
    @IBOutlet weak var mHexLabel: UILabel!
    @IBOutlet weak var mColorImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mTitleLabel.textColor = .black
        mTitleLabel.font = .montserratBold(14)
        mTitleLabel.alpha = 0.9
        
        mCreatorLabel.textColor = .black
        mCreatorLabel.alpha = 0.9
        
        mHexLabel.textColor = .black
        mHexLabel.font = .montserratRegular(12)
        mHexLabel.alpha = 0.9
        
        mColorImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        mColorImage.layer.shadowOpacity = 0.2
        mColorImage.layer.masksToBounds = false
        mColorImage.layer.shadowRadius = 20
        mColorImage.layer.shadowPath = UIBezierPath(roundedRect: mColorImage.bounds, cornerRadius: 50).cgPath
        mColorImage.layer.shouldRasterize = true
        mColorImage.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setupCell(_ color: Color) {
        mTitleLabel.text = color.title
        mHexLabel.text = "#\(color.hex)"
        
        let fontAttributeBold = [NSAttributedString.Key.font: UIFont.montserratBold(12)]
        let fontAttributeLight = [NSAttributedString.Key.font: UIFont.montserratLight(12)]
        let attributedString = NSMutableAttributedString(string: "created by ", attributes: fontAttributeLight)
        attributedString.append(NSMutableAttributedString(string: color.userName, attributes: fontAttributeBold))
        mCreatorLabel.attributedText = attributedString
        
        if let url = URL(string: color.imageUrl) {
            mColorImage.af.setImage(withURL: url, filter: CircleFilter())
        }
        
        self.backgroundColor = UIColor(red: CGFloat(color.rgb.red) / 255, green: CGFloat(color.rgb.green) / 255, blue: CGFloat(color.rgb.blue) / 255, alpha: 0.7)
        
        let normalizedColorValue = ((CGFloat(color.rgb.red) + CGFloat(color.rgb.green) + CGFloat(color.rgb.blue)) / 255) / 3
        
        if normalizedColorValue < 0.5 {
            mTitleLabel.textColor = .white
            mCreatorLabel.textColor = .white
            mHexLabel.textColor = .white
        } else {
            mTitleLabel.textColor = .black
            mCreatorLabel.textColor = .black
            mHexLabel.textColor = .black
        }
        
        if normalizedColorValue == 1 {
            backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        }
    }
    
}
