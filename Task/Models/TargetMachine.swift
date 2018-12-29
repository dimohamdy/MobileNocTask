//
//	TargetMachine.swift
//
//	Create by Ahmed Tawfik on 27/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct TargetMachine : Codable {

	let communicationProtocols : [CommunicationProtocol]?
	let id : Int?
	let ipAddress : String?
	let ipSubnetMask : String?
	let location : Int?
	let locationId : Int?
	let model : Model?
	let name : String?
	let serialNum : String?
	let serialNumber : String?
	let status : Status?
//    let targetMachinesInfo : [MachineInfo]?
	let type : Type?
	let version : String?
	let circuitStatusId : Int?
	let sourceMachineId : Int?


	enum CodingKeys: String, CodingKey {
		case communicationProtocols = "communicationProtocols"
		case id = "id"
		case ipAddress = "ipAddress"
		case ipSubnetMask = "ipSubnetMask"
		case location = "location"
		case locationId = "locationId"
		case model
		case name = "name"
		case serialNum = "serialNum"
		case serialNumber = "serialNumber"
		case status
//        case targetMachines = "targetMachines"
		case type
		case version = "version"
		case circuitStatusId = "circuitStatusId"
		case sourceMachineId = "sourceMachineId"
//        case targetMachine
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		communicationProtocols = try values.decodeIfPresent([CommunicationProtocol].self, forKey: .communicationProtocols)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		ipAddress = try values.decodeIfPresent(String.self, forKey: .ipAddress)
		ipSubnetMask = try values.decodeIfPresent(String.self, forKey: .ipSubnetMask)
		location = try values.decodeIfPresent(Int.self, forKey: .location)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
        model = try values.decodeIfPresent(Model.self, forKey: .model)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		serialNum = try values.decodeIfPresent(String.self, forKey: .serialNum)
		serialNumber = try values.decodeIfPresent(String.self, forKey: .serialNumber)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
//        targetMachinesInfo = try values.decodeIfPresent([MachineInfo].self, forKey: .targetMachines)
        type = try values.decodeIfPresent(Type.self, forKey: .type)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		circuitStatusId = try values.decodeIfPresent(Int.self, forKey: .circuitStatusId)
		sourceMachineId = try values.decodeIfPresent(Int.self, forKey: .sourceMachineId)
	}


}
