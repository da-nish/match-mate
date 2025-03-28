//
//  MatchScreenView.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import SwiftUI

struct MatchScreenView: View {
    @StateObject var controller = MatchScreenViewModel()
   
    var body: some View {
        
//        Button("get data"){
//            controller.getData()
//        }
//
//        Text("asdfdf")
        
        
        ScrollView {
            ForEach(controller.mateList, id: \.id){ item in
                MatchCardItem(item: item)
    //            Rectangle()
    //                .frame(width: 100, height: 100)
    //                .background(.red)
                
            }
        }
//        .onAppear{
//            controller.getData()
//        }
        
        
    }
}

#Preview {
    MatchScreenView()
}
