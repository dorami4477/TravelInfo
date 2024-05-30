//
//  AdCell.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/27/24.
//

import UIKit

class AdCell: UITableViewCell {


    @IBOutlet var adTextLabel: UILabel!
    let adBackgroundColor:[UIColor] = [.systemIndigo, .systemMint, .systemBrown, .systemYellow]
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI(){
        adTextLabel.layer.cornerRadius = 10
        adTextLabel.clipsToBounds = true
        adTextLabel.backgroundColor = adBackgroundColor.randomElement()
        adTextLabel.setTextUI(fontSize: 20, weight: .bold, textColor: .black)
        adTextLabel.textAlignment = .center
    }

}
