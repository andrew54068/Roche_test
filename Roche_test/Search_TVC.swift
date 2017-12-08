//
//  Search_TVC.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Search_TVC: UITableViewController{
    
    private let cellId = "searchResult_TVCell"
    
    var result_title: [[String]]?
    var result_subtitle: [[String]]?
    var catagory: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchResult_TVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        setupTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        tableView.reloadData()
    }
    
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.contentInset = UIEdgeInsetsMake(109, 0, 0, 0)
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 109, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor.cyan
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = result_title, let number = catagory{
            return array[number].count
        }

        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchResult_TVCell
        if let array_title = result_title, let array_subtitle = result_subtitle, let number = catagory{
            cell.title.text = array_title[number][indexPath.item]
            cell.subtitle.text = array_subtitle[number][indexPath.item]
            cell.backgroundColor = UIColor.red
        }else{
            cell.title.text = "please check internet please check internet please check internet please check internet"
            cell.subtitle.text = "please check internet please check internet please check internet please check internet please check internet"
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 
//    }
}
