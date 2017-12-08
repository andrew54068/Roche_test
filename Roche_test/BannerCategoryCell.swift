//
//  RocheCategoryCell2.swift
//  practice
//
//  Created by kidnapper on 15/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class BannerCategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private let cellId = "BCVCell"
    
    @IBOutlet var content: UICollectionView!
    
    var mainView: Main_VC?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    func setUpViews(){
        content.delegate = self
        content.dataSource = self
        
        
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        content.register(nib, forCellWithReuseIdentifier: cellId)
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        content.collectionViewLayout = layout
    }

    //MARK: CollectionView dataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BannerCollectionViewCell
        let image = UIImage(named: "img_bigcard")
        cell.rectangleImage.image = image
        cell.rectangleLabel.text = "AE MANAGEMENT TOOL"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    //MARK: CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("present segue to certain tab")
        collectionView.reloadData()

        if indexPath.item != 0{
            let tc = SeeAllViewController.create()
            let CongressUpdate = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CongressUpdate_VC")
            let ExpertCommentary = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertCommentary_VC")
            let Event = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Event_VC")
            let TrailFactSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrailFactSheet_VC")
            let Bookmark = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Bookmark_VC")
            
            let grayColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
            let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: grayColor ]
            let CongressUpdate_text = NSMutableAttributedString(string: "Congress Update", attributes: attrs)
            let ExpertCommentary_text = NSMutableAttributedString(string: "Expert Commentary", attributes: attrs)
            let Event_text = NSMutableAttributedString(string: "Event", attributes: attrs)
            let TrailFactSheet_text = NSMutableAttributedString(string: "Trail Fact Sheet", attributes: attrs)
            
            let bookmarkAttachment = NSTextAttachment()
            let bookmarkImage = UIImage(named: "icon_btn_bookmark_default")!.withRenderingMode(.alwaysTemplate)
            bookmarkAttachment.image = bookmarkImage
            bookmarkAttachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 16)
            
            let attrStringWithImage: NSAttributedString = NSAttributedString(attachment: bookmarkAttachment)
            let BookMarktext = NSMutableAttributedString(string: " Bookmark", attributes: attrs)
            let empty = NSMutableAttributedString(string: " ", attributes: attrs)
            empty.append(attrStringWithImage)
            empty.append(BookMarktext)
            let BookMark_text = empty
            
            tc.tabItems = [(CongressUpdate, CongressUpdate_text), (ExpertCommentary, ExpertCommentary_text), (Event, Event_text), (TrailFactSheet, TrailFactSheet_text), (Bookmark, BookMark_text)]
            
            mainView?.nav(tabPageViewController: tc)
            
            tc.displayControllerWithIndex(indexPath.item + 1, direction: .forward, animated: true)
//            tc.scrollViewDidEndDecelerating()
            
        }
        else{
            mainView?.showArticle()
        }
    }
    
    //MARK: CollectionView flowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 15, bottom: 18, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 100)
    }
    
    
    
}





