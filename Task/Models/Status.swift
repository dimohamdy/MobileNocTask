//
//	Status.swift
//
//	Create by Ahmed Tawfik on 27/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Status : Codable {

	let id : Int?
	let legacyValue : String?
	let statusValue : String?


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case legacyValue = "legacyValue"
		case statusValue = "statusValue"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		legacyValue = try values.decodeIfPresent(String.self, forKey: .legacyValue)
		statusValue = try values.decodeIfPresent(String.self, forKey: .statusValue)
	}


}
