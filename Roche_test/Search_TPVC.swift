//
//  Search_TPVC.swift
//  practice
//
//  Created by kidnapper on 04/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Search_TPVC: TabPageViewController, UISearchBarDelegate{
    
    var searchBarView: SearchBarView?
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        
    }
    
    func navigationBarSetup(){
        navigationController?.navigationBar.backgroundColor = UIColor.white

        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search"
        searchBar.barTintColor = UIColor.white
        let searchField = searchBar.value(forKey: "searchField") as? UITextField
        searchField?.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        searchField?.becomeFirstResponder()
        
        let attributes = [NSForegroundColorAttributeName: UIColor(red: 0, green: 102/255, blue: 204/255, alpha: 1)]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
