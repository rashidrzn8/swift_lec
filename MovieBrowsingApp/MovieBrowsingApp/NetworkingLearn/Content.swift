//
//  Content.swift
//  MovieBrowsingApp
//
//  Created by Rashid Ahamed on 7/11/25.
//

import SwiftUI

struct Content: View {
    @State private var users:GitHubUser?
    var body: some View {
        VStack(spacing: 20){
            
            if let avatarUrl = users?.avatarUrl, let url = URL(string: avatarUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: 120, height: 120)
                }
            } else {
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 120, height: 120)
            }

            
           
            Text(users?.login ?? "Login placeholder")
                .bold()
                .font(.title3)
            Text(users?.bio ?? "Bio placeholder")
                .padding()
            Spacer()
        }
        .padding()
        .task {
            do{
                users = try await getUser()
            }catch GHError.invalidURL{
                print("Invalid url")
            }catch{
                print("ddd")
            }
        }
    }
    
    func getUser() async throws -> GitHubUser {
        let endPoint = "http://api.github.com/users/rashidrzn8"
        
        guard let url = URL(string: endPoint) else {
            throw GHError.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from:url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          throw  GHError.invalidURL
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        }catch{
            throw GHError.invalidURL
        }
    }
    
}

#Preview {
    Content()
}


enum GHError:Error {
    case invalidURL
}
