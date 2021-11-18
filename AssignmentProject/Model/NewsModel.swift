/**
 *  * *****************************************************************************
 *  * Filename: NewsModel.swift
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
struct NewsModel : Codable {
    var breakingNews : [DescriptionModel]?
    var topNews : [DescriptionModel]?
    var dailyBriefings : DailyBriefings?
    var technicalAnalysis : [DescriptionModel]?
    var specialReport : [DescriptionModel]?

	enum CodingKeys: String, CodingKey {
		case breakingNews
		case topNews
		case dailyBriefings
		case technicalAnalysis
		case specialReport
	}

    var allCases: [String] {
        return ["Breaking News",
                "Top News",
                "Daily Briefings",
                "Eu",
                "Asia",
                "US",
                "Technical Analysis",
                "Special Report"]
    }

    init() {}

	init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            breakingNews = try values.decodeIfPresent([DescriptionModel].self, forKey: .breakingNews)
        } catch {
            print("Error reading JSON file: \(error.localizedDescription)")
        }
            topNews = try values.decodeIfPresent([DescriptionModel].self, forKey: .topNews)
            dailyBriefings = try values.decodeIfPresent(DailyBriefings.self, forKey: .dailyBriefings)
            technicalAnalysis = try values.decodeIfPresent([DescriptionModel].self, forKey: .technicalAnalysis)
            specialReport = try values.decodeIfPresent([DescriptionModel].self, forKey: .specialReport)

	}
}
