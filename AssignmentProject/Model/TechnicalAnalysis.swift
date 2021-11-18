/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TechnicalAnalysis : Codable {
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

		case title = "title"
		case url = "url"
		case description = "description"
		case content = "content"
		case firstImageUrl = "firstImageUrl"
		case headlineImageUrl = "headlineImageUrl"
		case articleImageUrl = "articleImageUrl"
		case backgroundImageUrl = "backgroundImageUrl"
		case videoType = "videoType"
		case videoId = "videoId"
		case videoUrl = "videoUrl"
		case videoThumbnail = "videoThumbnail"
		case newsKeywords = "newsKeywords"
		case authors = "authors"
		case instruments = "instruments"
		case tags = "tags"
		case categories = "categories"
		case displayTimestamp = "displayTimestamp"
		case lastUpdatedTimestamp = "lastUpdatedTimestamp"
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