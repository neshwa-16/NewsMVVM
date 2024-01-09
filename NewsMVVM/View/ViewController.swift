//
//  ViewController.swift
//  NewsMVVM
//
//  Created by Neshwa on 29/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newstable: UITableView!
    let viewModel = NoticeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newstable.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        newstable.dataSource = self
        newstable.delegate = self
        viewModel.getNews {
            DispatchQueue.main.async {
                self.newstable.reloadData()
            }
        }
        
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        if let article = viewModel.newsForRow(for: indexPath) {
            cell.configureData(with: article)
        }
        return cell
    }
    
    
}
