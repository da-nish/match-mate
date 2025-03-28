//
//  MatchScreenViewModel.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation


class MatchScreenViewModel: ObservableObject{
    @Published var mateList: [MateModel] = []
    
    init() {
        getData()
    }
    
    func getData(){
        APIService.apiRequest(
            onComplete: {
                dd in
                self.mateList = dd.mateList
            },
            onError: onError(error:)
        )
    }
    
    private func onComplete(data: MatchResponseModel){
//        print(data)
        self.mateList = data.mateList
        print(mateList)
    }
    private func onError(error:String){
        print(error)
    }
    
}
