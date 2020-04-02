//
//  UserCodable.swift
//  NewProject
//
//  Created by UjiN on 3/27/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation
import Alamofire

class StudentsDataSource {
	
	var students: Students?
	
	static let shared = StudentsDataSource()
	
	private init() {
	}
	
	func getUser(page: Int, completion: @escaping () -> Void) {
		
		AF.request("https://reqres.in/api/users?page=\(page)&per_page=2")
			.validate()
			.responseDecodable(of: Students.self) { (response) in
				guard let newStudents = response.value else { return }
				if page > 1 {
					self.students?.data.append(contentsOf: newStudents.data)
					self.students?.page = newStudents.page
				} else {
					self.students = newStudents
					print(newStudents)
				}
				completion()
		}
		
		//	let urlString = "https://reqres.in/api/users"
		//		guard let url = URL(string: urlString) else { return }
		//
		//		URLSession.shared.dataTask(with: url) { (data, response, error) in
		//			guard let data = data else { return }
		//			guard error == nil else { return }
		//			guard let response = response as? HTTPURLResponse,
		//				(200...299).contains(response.statusCode)
		//				else { return }
		//
		//			do {
		//				let user = try JSONDecoder().decode(User.self, from: data)
		//				print(user)
		//				self.user = user
		//				DispatchQueue.main.async {
		//					completion()
		//				}
		//
		//			} catch let error {
		//				print(error)
		//			}
		//
		//		}.resume()
	}
}
struct Students: Codable {
	let totalPages: Int
	var page: Int
	var data: [StudentNet]
	
	enum CodingKeys: String, CodingKey {
		case data
		case page
		case totalPages = "total_pages"
	}
}

struct StudentNet: Codable {
	let name: String?
	let surName: String?
	
	enum CodingKeys: String, CodingKey {
		case name = "first_name"
		case surName = "last_name"
	}
}
//enum GenderNet: String, Codable {
//    case female
//    case male
//	case na = "n/a"
//}
