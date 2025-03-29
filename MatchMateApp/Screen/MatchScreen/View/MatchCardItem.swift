//
//  MatchCardItem.swift
//  MatchMateApp
//
//  Created by Danish khan on 28/03/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MatchCardItem: View {
    let item: MatchMateModel
    let action: (MatchStatus) -> Void
    init(item: MatchMateModel, action: @escaping (MatchStatus) -> Void) {
        self.item = item
        self.action = action
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                WebImage(url: URL(string: item.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                } placeholder: {
                                    Rectangle()
                                        .frame(height: 160)
                                        .foregroundColor(.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("\(item.age) \(item.gender.capitalized)")
                    .foregroundColor(.white)
                    .padding()
            }
                
            HStack() {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "globe")
            }
            HStack{
                Text(item.street)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            Spacer().frame(height: 20)
            
            HStack(spacing: 10) {
                if item.matchStatus == .accepted{
                    AcceptButtonView(title: "Accepted")
                        .transition(.flipFromRight)
                }
                else if item.matchStatus == .rejected{
                    RejectButtonView(title: "Rejected")
                        .transition(.flipFromLeft)
                }
                else {
                    
                    Button(
                        action: {
                            withAnimation(.easeInOut(duration: 0.3)) {action(.rejected)}
                        }
                    ){
                        RejectButtonView(title: "Reject")
                    }
                    Button(
                        action: {
                            withAnimation(.easeInOut(duration: 0.3)) {action(.accepted)}
                        }
                    ){
                        AcceptButtonView(title: "Accept")
                    }
                }
            }
                    .frame(height: 50)
//                    .shadow(radius: 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 10, x: 0, y: 5)

        
    }
    
    struct RejectButtonView: View {
        let title: String
        init(title: String) {
            self.title = title
        }
        
        var body: some View {
            HStack {
                Image(systemName: "hand.thumbsdown.fill")
                Text(title)
            }
                .frame(maxWidth: .infinity) // Takes up all available space
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.898))
                .foregroundColor(.black)
                .cornerRadius(8)
        }
    }
    
    struct AcceptButtonView: View {
        let title: String
        init(title: String) {
            self.title = title
        }
        var body: some View {
            HStack {
                Image(systemName: "heart.fill")
                Text(title)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black.opacity(0.8).gradient)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }

    
    
}


#Preview {
    MatchCardItem(
        item: MatchMateModel(
            uuid: UUID().uuidString,
            name: "AA",
            age: 24,
            gender: "Male",
            image: "https://randomuser.me/api/portraits/men/96.jpg",
            matchStatus: MatchStatus.getType(value: "n"),
            street: "Bangalore"
        ),
        action: { status in
            print("preview clicked \(status)")
        }
    )
}

