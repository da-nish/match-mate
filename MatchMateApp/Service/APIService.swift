//
//  APIService.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation

class APIService{
    
    static func apiRequest(onComplete: @escaping (MatchResponseModel)-> Void, onError: @escaping (String) -> Void){
            let urlString = "https://randomuser.me/api/?results=10"
            
            let url = URL(string: urlString)
            
            guard let error = url else {
                onError("Invalid url")
                return
            }
            
            let urlRequest = URLRequest(url: url!)
            
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){
                data, response, error in
                
                if let error = error{
                    onError("Something went wrong")
                }
                do{
                    if let hasData = data{
                        let parsedData = try JSONDecoder().decode(MatchResponseModel.self, from: hasData)
                        onComplete(parsedData)
                    }
                }
                catch let error{
                    onError("Something went wrong: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        }


}
