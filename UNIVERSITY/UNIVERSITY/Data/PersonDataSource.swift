//
//  PersonDataSource.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/11/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
import Alamofire

class PersonDataSource {
	
	var persons: [Person] = []
	
	static let shared = PersonDataSource()
	
	private init() {
	}
	
	func getPerson(completion: @escaping () -> Void) {
		
		AF.request("https://jsonplaceholder.typicode.com/users")
			.validate()
			.responseDecodable(of: [Person].self) { (response) in
				guard let personsFromInternet = response.value else { return }
				self.persons = personsFromInternet
				completion()
		}
	}
}

struct Person: Codable {
	let name: String
	let username: String
	var company: Company
}

struct Company: Codable {
	let name: String
}

