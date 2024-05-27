//
//  ViewController.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let travelData = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "도시 상세 정보"
        tableView.delegate = self
        tableView.dataSource = self
    
        tableView.register(UINib(nibName: "CityInfoCell", bundle: nil), forCellReuseIdentifier: "CityInfoCell")
        tableView.register(UINib(nibName: "AdCell", bundle: nil), forCellReuseIdentifier: "AdCell")
    }
    
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelData[indexPath.row].ad{
            return 80
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travelData[indexPath.row].ad{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
            cell.adTextLabel.text = travelData[indexPath.row].title
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityInfoCell", for: indexPath) as! CityInfoCell
            cell.configureData(data: travelData[indexPath.row])
            cell.setGradeImage(travelData[indexPath.row].grade ?? 0)
            return cell
        }
    }
    
    
}

