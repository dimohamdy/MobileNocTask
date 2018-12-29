//
//	Result.swift
//
//	Create by Ahmed Tawfik on 25/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Page : Codable {

	let content : [Content]?
	let first : Bool?
	let last : Bool?
	let number : Int?
	let numberOfElements : Int?
	let size : Int?
	let totalElements : Int?
	let totalPages : Int?


	enum CodingKeys: String, CodingKey {
		case content = "content"
		case first = "first"
		case last = "last"
		case number = "number"
		case numberOfElements = "numberOfElements"
		case size = "size"
		case totalElements = "totalElements"
		case totalPages = "totalPages"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		content = try values.decodeIfPresent([Content].self, forKey: .content)
		first = try values.decodeIfPresent(Bool.self, forKey: .first)
		last = try values.decodeIfPresent(Bool.self, forKey: .last)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		numberOfElements = try values.decodeIfPresent(Int.self, forKey: .numberOfElements)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		totalElements = try values.decodeIfPresent(Int.self, forKey: .totalElements)
		totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
	}


}
