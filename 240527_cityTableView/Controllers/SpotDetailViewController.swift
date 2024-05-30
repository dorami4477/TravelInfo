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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureUI()
        
    }
    
    func configureData(){
        title = data?.title
        guard let imageURL = data?.travel_image else { return }
        let url = URL(string:  imageURL)
        mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        
        titleLabel.text = data?.title
        descriptionLabel.text = data?.description
    }
    
    func configureUI(){
        mainImageView.contentMode = .scaleAspectFill
        titleLabel.setLabelUI(fontSize: 18, weight: .bold, textColor: .black)
        descriptionLabel.setLabelUI(fontSize: 15, weight: .regular, textColor: .darkGray)
        descriptionLabel.numberOfLines = 0
    }
    


}
