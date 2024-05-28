//
//  ExtentionsUI.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/27/24.
//


import UIKit

extension UILabel{
    func setLabelUI(fontSize:CGFloat, weight:UIFont.Weight,textColor:UIColor){
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
    }
}
