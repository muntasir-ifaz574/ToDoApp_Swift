//
//  User.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
