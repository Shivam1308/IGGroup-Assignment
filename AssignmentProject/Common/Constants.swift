/**
*  * *****************************************************************************
*  * Filename: Constants.swift
*  * Author  : Shivam Singh
*  * Creation Date: 17/11/21
*  * *
*  * *****************************************************************************
*  * Description:
*  * This struct will contain constants
*  *                                                                             *
*  * *****************************************************************************
*/

import Foundation

public struct Constants {
    static let detailsURL: String = "https://content.dailyfx.com/api/v1/dashboard"
    static let pullToRefresh: String = "Pull to refresh"
    static let delay = 0.10
}

public struct NetworkError {
    static let alertMessage: String = "Unable to fetch the details, please try after some time."
    static let invalidURLMessage: String = "Invalid URL."
    static let invalidResponseMessage: String = "Invalid Response."
    static let parsingError: String = "Parsing Error."
}
