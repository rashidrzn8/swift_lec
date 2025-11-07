//
//  ContentView.swift
//  NetworkingDemo
//
//  Created by Rashid Ahamed on 25/10/25.
//

import SwiftUI

struct ContentView: View {
//    @State private var users:[UserModel] = []
    @State private var posts:[PostModel] = []
    var body: some View {
        List {
            ForEach(posts) { post in
                VStack{
                    Text(post.title)
                    Text(post.body)
                }
            }
        }
        .listStyle(.plain)
        .padding()
        .task {
          await fetchData()
            
        }
    }
    
    func fetchData() async {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else {
            print("Invald URL")
            return
        }
        
        do{
           let (data,urlRespose) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlRespose as? HTTPURLResponse else {
                print("invalid http respoce")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                print("Invalid status coddde")
                return
            }
            
            let postsData = try JSONDecoder().decode([PostModel].self, from: data)
            posts = postsData
            
        }catch{
            print("something went wrong")
        }
      
        
        
    }
}

#Preview {
    ContentView()
}
