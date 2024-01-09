//
//  NewsTableViewCell.swift
//  NewsMVVM
//
//  Created by Neshwa on 29/12/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDesc: UITextView!
    @IBOutlet weak var newsURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureData(with data: ArticleModel) {
        newsTitle.text = data.title
        newsDesc.text = data.description
        newsURL.text = data.url
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
