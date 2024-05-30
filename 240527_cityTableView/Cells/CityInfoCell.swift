//
//  CityInfoCell.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/27/24.
//

import UIKit
import Kingfisher

class CityInfoCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var heartButton: UIButton!
    
    @IBOutlet var saveCountLabel: UILabel!
    
    @IBOutlet var gradeImageViews: [UIImageView]!
    override func awakeFromNib() {
        super.awakeFromNib()
        connfigureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func connfigureUI(){
        titleLabel.setTextUI(fontSize: 18, weight: .bold, textColor: .black)
        subTitleLabel.setTextUI(fontSize: 14, weight: .regular, textColor: .gray)
        saveCountLabel.setTextUI(fontSize: 12, weight: .regular, textColor: .lightGray)
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        gradeImageViews.forEach { $0.tintColor = .lightGray }
        heartButton.tintColor = .white
    }
    
    func configureData(data:Travel){
        titleLabel.text = data.title
        subTitleLabel.text = data.description
        saveCountLabel.text = data.gradeSaveString
        mainImageView.kf.setImage(with: data.imageUrl, placeholder: UIImage(systemName: "star"))
    }

    
    func setGradeImage(_ grade:Double){
        gradeImageViews.forEach { $0.tintColor = .lightGray }
        if Int(grade) != 0{
            for item in 0...Int(grade) - 1{
                gradeImageViews[item].tintColor = .systemYellow
            }
        }
    }
}
