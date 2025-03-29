//
//  MatchScreenViewModel.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation
import CoreData


class MatchScreenViewModel: ObservableObject{
    let cdUtil = CoreDataUtil()
    var cdService: CoreDataService
    @Published var mateList: [MatchMateModel] = []
    
    init() {
        cdService = CoreDataService(viewContext: cdUtil.getContext())
        getData()
    }
    
    
    func getData(){
        if isConnectedToNetwork(){
            APIService.apiRequest(
                onComplete: onComplete(data:),
                onError: onError(error:)
            )
        }
        else {
            getSavedData()
        }
        
    }
    
    private func onComplete(data: MatchResponseModel){
        saveMateList(list: data.mateList)
    }
    
    private func onError(error:String){
        print(error)
    }
    
    func saveMateList(list: [MateModel]){
        cdService.saveList(list: list)
        getSavedData()
    }
    
    func updateMate(item: MatchMateModel, status: MatchStatus){
        
        for (i, element) in mateList.enumerated(){
            if element.uuid == item.uuid{
                mateList[i].matchStatus = status
            }
        }
        cdService.updateItem(item: item, status: MatchStatus.getValue(value: status))
    }
    
    
    func getSavedData(){
        let list:[CDMatchMate] = cdService.getAllRecords()
        DispatchQueue.main.async {
            self.mateList.removeAll()
        }
        var tempList: [MatchMateModel] = []
        
        for item in list{
            let model = MatchMateModel(
                uuid: item.uuid ?? UUID().uuidString,
                name: item.name ?? "",
                age: Int(item.age),
                gender: item.gender ?? "",
                image: item.image ?? "",
                matchStatus: MatchStatus.getType(value: item.matchStatus),
                street: item.street ?? ""
            )
            tempList.append(model)
                                       
        }
        
        DispatchQueue.main.async {
            self.mateList = tempList
        }
    }
    
}
