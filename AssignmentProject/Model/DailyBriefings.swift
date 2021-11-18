/**
 *  * *****************************************************************************
 *  * Filename: DailyBriefings.swift
 *  * Author  : Shivam Singh
 *  * Creation Date: 17/11/21
 *  * *
 *  * *****************************************************************************
 *  * Description:
 *  * Model struct will hold the API response
 *  *                                                                             *
 *  * *****************************************************************************
 */

import Foundation
struct DailyBriefings : Codable {
	let eu : [DescriptionModel]?
	let asia : [DescriptionModel]?
	let us : [DescriptionModel]?

	enum CodingKeys: String, CodingKey {

		case eu = "eu"
		case asia = "asia"
		case us = "us"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		eu = try values.decodeIfPresent([DescriptionModel].self, forKey: .eu)
		asia = try values.decodeIfPresent([DescriptionModel].self, forKey: .asia)
		us = try values.decodeIfPresent([DescriptionModel].self, forKey: .us)
	}

}
