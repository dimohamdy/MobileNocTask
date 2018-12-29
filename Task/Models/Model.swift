//
//	Model.swift
//
//	Create by Ahmed Tawfik on 27/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Model : Codable {

	let creationDate : String?
	let expiryDate : String?
	let id : Int?
	let name : String?


	enum CodingKeys: String, CodingKey {
		case creationDate = "creationDate"
		case expiryDate = "expiryDate"
		case id = "id"
		case name = "name"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate)
		expiryDate = try values.decodeIfPresent(String.self, forKey: .expiryDate)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}


}
