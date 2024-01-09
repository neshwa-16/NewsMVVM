//
//  APIService.swift
//  NewsMVVM
//
//  Created by Neshwa on 29/12/23.
//

import Foundation
import Alamofire

class APIService {
    
    func fetchNews(completion: @escaping(Result<NoticeModel, Error>) -> Void) {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=11049b561eaf462e98160b5c1008f6ce")
            .validate()
            .responseDecodable(of: NoticeModel.self) { response in
                switch response.result {
                case .success(let news):
                    completion(.success(news))
                    print("news data: \(news)")
                case .failure(let error):
                    completion(.failure(error))
                    print("error: \(error)")
                }
            }
    }
    
}
