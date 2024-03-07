//
//  File.swift
//  LastLogInApp
//
//  Created by Work on 05.03.2024.
//

import Foundation


struct User {
    let person: Person
    let user: String
    let password: String
    
    struct Person {
        let name: String
        let surname: String
        let description: String
    }
    
    static func getUser() -> User {
        User(person: Person(name: "Sergey",
                            surname: "Kosichkin",
                            description: "Hello, i live in Russia!"),
             user: "user",
             password: "password")
    }
}


