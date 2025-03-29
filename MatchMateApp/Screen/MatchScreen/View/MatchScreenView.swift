//
//  MatchScreenView.swift
//  MatchMateApp
//
//  Created by Danish khan on 28/03/25.
//

import SwiftUI

struct MatchScreenView: View {
    @StateObject var controller = MatchScreenViewModel()
   
    var body: some View {
        Text("Profile Matches")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
        ScrollView {
            Spacer().frame(height: 10)
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
