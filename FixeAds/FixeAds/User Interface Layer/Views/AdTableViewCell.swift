//
//  AdTableViewCell.swift
//  FixeAds
//
//  Created by Hugo Sousa on 22/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

protocol AdTableViewCellDelegate {
    func adTableViewCellDidPressShare(cell: AdTableViewCell)
    func adTableViewCellDidPressLocation(cell: AdTableViewCell)
}

class AdTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!

    @IBOutlet weak var headerImageView: UIImageView!
    
    var delegate: AdTableViewCellDelegate? = nil
    
    override func awakeFromNib() {
        
        let cardLayer: CALayer = self.cardView.layer;
        cardLayer.borderWidth = 1
        cardLayer.borderColor = UIColor.orangeColor().CGColor
        cardLayer.cornerRadius = 3
        cardLayer.masksToBounds = true
    }
    
    @IBAction func shareButtonPressed(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.adTableViewCellDidPressShare(self)
        }
    }
    
    @IBAction func locationButtonPressed(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.adTableViewCellDidPressLocation(self)
        }
    }
}