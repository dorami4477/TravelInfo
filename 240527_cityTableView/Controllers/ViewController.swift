//
//  ViewController.swift
//  240527_cityTableView
//
//  Created by 박다현 on 5/27/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let travelData = TravelInfo().travel
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "도시 상세 정보"
        configureTableView()
        bind()
    }
    
    func configureTableView(){
        tableView.register(UINib(nibName: CellID.cityInfoCellIdentifier, bundle: nil), forCellReuseIdentifier: CellID.cityInfoCellIdentifier)
        tableView.register(UINib(nibName: CellID.adCellIdentifier, bundle: nil), forCellReuseIdentifier: CellID.adCellIdentifier)
    }
    
    func bind() {
        let input = MainViewModel.Input(modelSeleted: tableView.rx.modelSelected(Travel.self))
        let output = viewModel.transform(input: input)
        
        output.travelList
            .bind(to: tableView.rx.items){ tableView, row, item in
                let indexPath = IndexPath.init(item: row, section: 0)
                
                if item.ad{
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: CellID.adCellIdentifier, for: indexPath) as! AdCell
                    cell.adTextLabel.text = item.title
                    cell.selectionStyle = .none
                    return cell
                    
                }else{
                   
                    let cell = tableView.dequeueReusableCell(withIdentifier: CellID.cityInfoCellIdentifier, for: indexPath) as! CityInfoCell
                    cell.configureData(data: item)
                    cell.setGradeImage(item.grade ?? 0)
                    cell.selectionStyle = .none
                    return cell
                }
            }
            .disposed(by: disposeBag)
        

        output.modelSeleted
            .bind(with: self) { owner, travel in
                if travel.ad{
                    let vc = owner.storyboard?.instantiateViewController(withIdentifier: "AdDetailViewController") as! AdDetailViewController
                    vc.data = travel
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    owner.present(nav, animated: true)
                    
                }else{
                    let vc = owner.storyboard?.instantiateViewController(withIdentifier: "SpotDetailViewController") as! SpotDetailViewController
                    vc.data = travel
                    owner.navigationController?.pushViewController(vc, animated: true)
                }
            }
            .disposed(by: disposeBag)
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}


// MARK: - UITableView
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelData[indexPath.row].ad{
            return 80
        }else{
            return 120
        }
    }
    
}

