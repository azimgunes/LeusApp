//
//  FeedViewController.swift
//  LeusApp
//
//  Created by Azim Güneş on 14.03.2023.
//

import UIKit
import Firebase
import SDWebImage


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SDWebImageManagerDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    
    var userMailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var imageArray = [String]()
    var documentIdArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SDWebImageManager.shared.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        /*SDWebImageManager.shared().loadImage(with: URL(string: self.imageArray[indexPath.row), options: SDWebImageOptions.highPriority, progress: nil, completed: nil)*/
        
        getDataFromFirestore()
        
        overrideUserInterfaceStyle = .light         // Do any additional setup after loading the view.
    }
    
    func getDataFromFirestore () {
        let firestoreDatabase = Firestore.firestore();firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.imageArray.removeAll(keepingCapacity: false)
                    self.userMailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userMailArray.append(postedBy)
                        }
                        if let postComment = document.get("PostComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.imageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

                                                                               
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewFeedViewCell
        cell.userMailLabel.text = userMailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = userCommentArray[indexPath.row]
        let transformer = SDImageResizingTransformer(size: CGSize(width: 350, height: 211), scaleMode: .aspectFit   )
        cell.userImageView.sd_setImage(with: URL(string: self.imageArray[indexPath.row]), placeholderImage: UIImage(named: "newtr.png"), options: SDWebImageOptions.refreshCached, context: [.imageTransformer: transformer])
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userMailArray.count
    }
    
    
}


/*cell.userImageView.sd_setImage(with: URL(string: self.imageArray[indexPath.row]), placeholderImage: nil, context: [.imageTransformer: transformer])*/
