//
//  NoticeViewModel.swift
//  NewsMVVM
//
//  Created by Neshwa on 29/12/23.
//

import Foundation
import UIKit

struct ArticleModel {
    let title: String?
    let description: String?
    let url: String?
}

class NoticeViewModel {
    
    private var apiService = APIService()
    var news : NoticeModel = NoticeModel(status: "", totalResults: 0, articles: [])
    
    func getNews(completion: @escaping () -> Void) {
        apiService.fetchNews { result in
            
            switch result {
            case .success(let news):
                print("news data \(news)")
                self.news = news
                completion()
                
            case .failure(let error):
                print("error \(error)")
            }
        }
        
    }
    
    func numberOfRows() -> Int {
        return news.articles.count
    }
    
    func newsForRow(for indexPath: IndexPath) -> ArticleModel? {
        let noticeForIndex = news.articles[indexPath.row]
        return ArticleModel(title: noticeForIndex.title, description: noticeForIndex.description, url: noticeForIndex.url)
    }
}
