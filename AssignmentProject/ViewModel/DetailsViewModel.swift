/**
*  * *****************************************************************************
*  * Filename: DetailsViewModel.swift
*  * Author  : Shivam Singh
*  * Creation Date: 17/11/21
*  * *
*  * *****************************************************************************
*  * Description:
*  * DetailsViewModel class will fetch details and notify the view via binding(closure)
*  *                                                                             *
*  * *****************************************************************************
*/

import Foundation

class DetailsViewModel {
    // MARK: - Initialization
    init(model: NewsModel? = nil) {
        if let inputModel = model {
            arrDetails = inputModel
        }
    }
    var arrDetails = NewsModel()

    var navigationTitle: String {
        return "News"
    }
}

extension DetailsViewModel {
    func fetchDetails(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        WebserviceManager.shared.getDetails(urlString: Constants.detailsURL, completionBlock: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let data) :
                let decoder = JSONDecoder()
                do {
                    self.arrDetails = try decoder.decode(NewsModel.self, from: data)
                    completion(.success(try decoder.decode(NewsModel.self, from: data)))
                } catch {
                    completion(.failure(WebserviceError.parsingError(NetworkError.parsingError)))
                }
            }
        })
    }
    
    func fetchImageData(urlString: String, completion: @escaping(Data, Error?) -> Void) {
        WebserviceManager.shared.getImageData(urlString: urlString, completionBlock: { result in
            switch result {
            case .failure(let error):
                completion(Data(), error)
            case .success(let data) :
                completion(data, nil)
            }
        })
    }
}
