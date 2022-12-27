//
//  PostData.swift
//  HackerNews
//
//  Created by LIN SHI ZHENG on 16/12/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
