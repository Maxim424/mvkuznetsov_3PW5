//
//  NewsViewModel.swift
//  mvkuznetsov_3PW5
//
//  Created by Максим Кузнецов on 07.12.2022.
//

import UIKit

struct NewsWrapper: Decodable {
    let articles: [NewsViewModel]
}

final class NewsViewModel: Decodable {

    let title: String?
    let description: String?
    let imageURL: URL?
    var imageData: Data? = nil
    var urlToImage: String? = nil
    
    init(title: String?, description: String?, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}

