//
//  UserCodable.swift
//  NewProject
//
//  Created by UjiN on 3/27/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation

class UserDataSource {
	
	var user: User?
	
    static let shared = UserDataSource()
	
    private init() {
	}
	
	func getUser() {
	let urlString = "https://swapi.co/api/people"
	guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data else { return }
			guard error == nil else { return }
			guard let response = response as? HTTPURLResponse,
			(200...299).contains(response.statusCode)
			else { return }
			
			do {
				let user = try JSONDecoder().decode(User.self, from: data)
			print(user)
				self.user = user
			} catch let error {
			print(error)
			}
		}.resume()
	}
}

struct User: Codable {
let results: [StudentNet]
}

struct StudentNet: Codable {
	let name: String?
	let gender: GenderNet?
}

enum GenderNet: String, Codable {
    case female
    case male
	case na = "n/a"
}
