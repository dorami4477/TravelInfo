//
//  AdDetailViewController.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/29/24.
//

import UIKit

class AdDetailViewController: UIViewController {

    var data:Travel?
    @IBOutlet var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "이벤트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(goBack))
        contentsLabel.text = data?.title
    }
    

    @objc func goBack(){
        dismiss(animated: true)
    }

}
