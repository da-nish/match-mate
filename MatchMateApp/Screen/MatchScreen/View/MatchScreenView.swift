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
        
        VStack{
            Button("get and save data"){
                controller.getData()
            }
            Button("get local data"){
                controller.getSavedData()
            }
        }
        
        
        ScrollView {
            Spacer().frame(height: 20)
            ForEach(controller.mateList, id: \.uuid){ item in
                MatchCardItem(item: item, action: { status in
                    controller.updateMate(item: item, status: status)
                })
                .padding([.bottom, .horizontal])
                
            }
        }
        
    }
}

#Preview {
    MatchScreenView()
}
