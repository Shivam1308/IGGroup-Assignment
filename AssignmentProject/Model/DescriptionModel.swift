/**
 *  * *****************************************************************************
 *  * Filename: DescriptionModel.swift
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
struct DescriptionModel : Codable {
	let title : String?
	let url : String?
	let description : String?
	let content : String?
	let firstImageUrl : String?
	let headlineImageUrl : String?
	let articleImageUrl : String?
	let backgroundImageUrl : String?
	let videoType : String?
	let videoId : String?
	let videoUrl : String?
	let videoThumbnail : String?
	let newsKeywords : String?
	let authors : [Authors]?
	let instruments : [String]?
	let tags : [String]?
	let categories : [String]?
	let displayTimestamp : Int?
	let lastUpdatedTimestamp : Int?

	enum CodingKeys: String, CodingKey {

		case title
		case url
		case description
		case content
		case firstImageUrl
		case headlineImageUrl
		case articleImageUrl
		case backgroundImageUrl
		case videoType
		case videoId
		case videoUrl
		case videoThumbnail
		case newsKeywords
		case authors
		case instruments
		case tags
		case categories
		case displayTimestamp
		case lastUpdatedTimestamp
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		firstImageUrl = try values.decodeIfPresent(String.self, forKey: .firstImageUrl)
		headlineImageUrl = try values.decodeIfPresent(String.self, forKey: .headlineImageUrl)
		articleImageUrl = try values.decodeIfPresent(String.self, forKey: .articleImageUrl)
		backgroundImageUrl = try values.decodeIfPresent(String.self, forKey: .backgroundImageUrl)
		videoType = try values.decodeIfPresent(String.self, forKey: .videoType)
		videoId = try values.decodeIfPresent(String.self, forKey: .videoId)
		videoUrl = try values.decodeIfPresent(String.self, forKey: .videoUrl)
		videoThumbnail = try values.decodeIfPresent(String.self, forKey: .videoThumbnail)
		newsKeywords = try values.decodeIfPresent(String.self, forKey: .newsKeywords)
		authors = try values.decodeIfPresent([Authors].self, forKey: .authors)
		instruments = try values.decodeIfPresent([String].self, forKey: .instruments)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		displayTimestamp = try values.decodeIfPresent(Int.self, forKey: .displayTimestamp)
		lastUpdatedTimestamp = try values.decodeIfPresent(Int.self, forKey: .lastUpdatedTimestamp)
	}

}
