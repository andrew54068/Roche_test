//
//  SearchBarVIew.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class SearchBarView: UIView{
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var cancel: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        searchBar.searchBarStyle = .prominent
        
        
        
//        let searchTextField = searchBar.value(forKey: "searchField") as? UITextField
//        searchTextField?.tintColor = UIColor.red
        
        
        
//        let imageRef =
//        let grayColor = UIImage(
//        searchBar.setSearchFieldBackgroundImage(<#T##backgroundImage: UIImage?##UIImage?#>, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        searchBar.backgroundColor = UIColor.white
//        searchBar.tintColor = UIColor.red
        
        let searchField = searchBar.value(forKey: "searchField") as? UITextField
        searchField?.backgroundColor = UIColor(red: 247/255, green: 249/255, blue: 250/255, alpha: 1)
        searchBar.barTintColor = UIColor.white
        
    }
    
}





