/**
 *  * *****************************************************************************
 *  * Filename: Authors.swift
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
struct Authors : Codable {
	let name : String?
	let title : String?
	let bio : String?
	let email : String?
	let phone : String?
	let facebook : String?
	let twitter : String?
	let googleplus : String?
	let subscription : String?
	let rss : String?
	let descriptionLong : String?
	let descriptionShort : String?
	let photo : String?

	enum CodingKeys: String, CodingKey {

		case name
		case title
		case bio
		case email
		case phone
		case facebook
		case twitter
		case googleplus
		case subscription
		case rss
		case descriptionLong
		case descriptionShort
		case photo
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		bio = try values.decodeIfPresent(String.self, forKey: .bio)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		facebook = try values.decodeIfPresent(String.self, forKey: .facebook)
		twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
		googleplus = try values.decodeIfPresent(String.self, forKey: .googleplus)
		subscription = try values.decodeIfPresent(String.self, forKey: .subscription)
		rss = try values.decodeIfPresent(String.self, forKey: .rss)
		descriptionLong = try values.decodeIfPresent(String.self, forKey: .descriptionLong)
		descriptionShort = try values.decodeIfPresent(String.self, forKey: .descriptionShort)
		photo = try values.decodeIfPresent(String.self, forKey: .photo)
	}

}
