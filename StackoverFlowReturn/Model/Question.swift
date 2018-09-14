//
//  Questions.swift
//  StackoverFlowReturn
//
//  Created by John John on 9/4/18.
//  Copyright © 2018 John John. All rights reserved.
//

import Foundation

struct Questions: Decodable {
    var hasMore: Int
    var items: [Description]
    
    private enum CodingKeys: String, CodingKey {

        case hasMore = "has_more", items
    }
}

struct Description: Decodable {

    let owner: OwnerDescription
    let questionId : Int
    let title: String

    private enum CodingKeys: String, CodingKey {

        case owner
        case questionId = "question_id"
        case title

    }
}

struct OwnerDescription: Decodable {
    let displayName: String
    let profileImage: String

    private enum CodingKeys: String, CodingKey {

        case displayName = "display_name"
        case profileImage = "profile_image"

    }
}



