//
//  MainViewModel.swift
//  240527_cityTableView
//
//  Created by 박다현 on 8/5/24.
//

import Foundation
import RxSwift
import RxCocoa


final class MainViewModel {
   
    let disposeBag = DisposeBag()
    
    struct Input {
        let modelSeleted:ControlEvent<Travel>

    }
    
    struct Output {
        let travelList: BehaviorSubject<[Travel]>
        let modelSeleted:ControlEvent<Travel>
    }
    
    func transform(input: Input) -> Output {
        let travelData = BehaviorSubject(value: TravelInfo().travel)
            
        
        return Output(travelList: travelData, modelSeleted: input.modelSeleted)
    }
}
