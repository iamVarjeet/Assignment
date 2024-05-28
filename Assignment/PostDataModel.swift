//
//  PostDataModel.swift
//  Assignment
//
//  Created by ios developer on 28/05/24.
//
//   let allPostModel = try? JSONDecoder().decode(AllPostModel.self, from: jsonData)

import Foundation

// MARK: - AllPostModelElement
struct AllPostModelElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias AllPostModel = [AllPostModelElement]
