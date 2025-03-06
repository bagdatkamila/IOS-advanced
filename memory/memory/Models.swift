//
//  Models.swift
//  memory
//
//  Created by Камила Багдат on 23.02.2025.
//

import Foundation

struct UserProfile {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int
    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    // Remember: Only use immutable properties
    func hash(into hasher: inout Hasher){
            hasher.combine(id)
        }
    
    
    // TODO: Implement Equatable
    // Consider: Which properties determine equality?
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
            return lhs.id == rhs.id
        }
    
}

struct Post {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int
    
    // TODO: Implement Hashable
    // Consider: Which properties should be used for hashing?
    static func == (lhs: Post, rhs: Post) -> Bool {
            return lhs.id == rhs.id
        }
    
    // TODO: Implement Equatable
    // Consider: When should two posts be considered equal?
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}
