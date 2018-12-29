//
//	MachineInfo.swift
//
//	Create by Ahmed Tawfik on 27/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct MachineInfo : Codable {

	let circuitStatusId : Int?
	let id : Int?
	let sourceMachineId : Int?
	let targetMachine : TargetMachine?


	enum CodingKeys: String, CodingKey {
		case circuitStatusId = "circuitStatusId"
		case id = "id"
		case sourceMachineId = "sourceMachineId"
		case targetMachine
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		circuitStatusId = try values.decodeIfPresent(Int.self, forKey: .circuitStatusId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		sourceMachineId = try values.decodeIfPresent(Int.self, forKey: .sourceMachineId)
        targetMachine = try values.decodeIfPresent(TargetMachine.self, forKey: .targetMachine)

	}


}
