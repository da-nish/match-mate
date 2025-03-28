//
//  MatchCardItem.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import SwiftUI

struct MatchCardItem: View {
    let item: MateModel
    init(item: MateModel) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading){
//            HStack() {
//                Text(item.name)
//            }
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                
//                Rectangle()
//                    .frame( height: 400)
//                    .foregroundColor(.gray)
//                    .cornerRadius(10)
//                Image(systemName: "globe")
//                    .frame( height: 400)
//                    .foregroundColor(.gray)
//                    .cornerRadius(10)
//                
                AsyncImage(url: URL(string: item.picture.medium)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Optional: Show loading indicator
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    case .failure:
                        Image(systemName: "exclamationmark.triangle") // Error handling
                    @unknown default:
                        EmptyView() // Handle any future cases
                    }
                }
                

                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("\(item.dob.age) \(item.gender.rawValue.capitalized)")
                    .foregroundColor(.white)
                    .padding()
            }
                
            HStack() {
                Text(item.name.first ?? "a")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "globe")
            }
            HStack{
                Text(item.location?.street?.name ?? "b")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            Spacer().frame(height: 40)
            HStack{
                Button("No", systemImage: "xmark") {}
                  .buttonStyle(.bordered)
                  .controlSize(.large)
                
                Button("Yes", systemImage: "checkmark") {}
                  .buttonStyle(.borderedProminent)
                  .foregroundColor(.white)
                  .controlSize(.large)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        

        
    }
    
    func start(){
        
    }
}


#Preview {
    MatchCardItem(item:
                MateModel(
                    gender: .male,
                    name: Name(title: "AA", first: "Aa", last: "Bb"),
                    location: Location(street: Street(number: 24, name: "Bengaluru")),
                    email: "email@address",
                    dob: Dob(date: "", age: 24),
                    phone: "+9134343434", cell: "22323",
//                    id: ID(name: "", value: ""),
                    picture: Picture(
                        large: "https://randomuser.me/api/portraits/men/11.jpg",
                        medium: "https://randomuser.me/api/portraits/med/men/11.jpg",
                        thumbnail: "https://randomuser.me/api/portraits/thumb/men/11.jpg")
                    )
                )
}
