//
//  ContentView.swift
//  HackerNews
//
//  Created by LIN SHI ZHENG on 16/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkMgr = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkMgr.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkMgr.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
