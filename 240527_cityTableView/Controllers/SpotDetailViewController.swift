//
//  SpotDetailViewController.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/29/24.
//

import UIKit

class SpotDetailViewController: UIViewController {

    var data:Travel?
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var gradeImageViews: [UIImageView]!
    @IBOutlet var gradeSaveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureUI()
        setGradeImage(data?.grade ?? 0)
    }
    
    func configureData(){
        title = data?.title
        mainImageView.kf.setImage(with: data?.imageUrl, placeholder: UIImage(systemName: "star"))
        titleLabel.text = data?.title
        descriptionLabel.text = data?.description
        gradeSaveLabel.text = data?.gradeSaveString
    }
    
    func configureUI(){
        mainImageView.contentMode = .scaleAspectFill
        titleLabel.setTextUI(fontSize: 28, weight: .bold, textColor: .black)
        descriptionLabel.setTextUI(fontSize: 16, weight: .regular, textColor: .darkGray)
        descriptionLabel.numberOfLines = 0
        gradeSaveLabel.setTextUI(fontSize: 13, weight: .regular, textColor: .gray)
        
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
