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
        configureTableView()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    
        tableView.register(UINib(nibName: CellID.cityInfoCellIdentifier, bundle: nil), forCellReuseIdentifier: CellID.cityInfoCellIdentifier)
        tableView.register(UINib(nibName: CellID.adCellIdentifier, bundle: nil), forCellReuseIdentifier: CellID.adCellIdentifier)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.adCellIdentifier, for: indexPath) as! AdCell
            cell.adTextLabel.text = travelData[indexPath.row].title
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID.cityInfoCellIdentifier, for: indexPath) as! CityInfoCell
            cell.configureData(data: travelData[indexPath.row])
            cell.setGradeImage(travelData[indexPath.row].grade ?? 0)
            return cell
        }
    }
    
    
}

