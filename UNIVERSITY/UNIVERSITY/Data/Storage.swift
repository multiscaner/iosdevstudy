//
//  Storage.swift
//  UNIVERSITY
//
//  Created by UjiN on 4/9/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import Foundation

class Storage {
	
	func saveUseData(username: String, password: String) {
		let userPasswordDictionary = [username: password] // create dict

		do {
			let data = try JSONEncoder().encode(userPasswordDictionary) //convert dict to data
			try data.write(to: pathToFile) //write to file
		} catch {
			print("Couldn't write file")
		}
	}
	
	func loadData() -> [String: String] {
		
		do {
			let data = try Data(contentsOf: pathToFile) // read from file
			return try JSONDecoder().decode([String: String].self, from: data) // convert data to dict
		} catch {
			print("Couldn't read file.")
		}
		return [:]
	}
	
	var pathToFile: URL {
		let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! //finc your directory
		let fullPath = directory.appendingPathComponent("users.txt") //create url
		return fullPath
	}
}
