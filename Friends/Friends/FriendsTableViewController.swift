//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Stephanie Bowles on 6/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

  private let friendController = FriendController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return friendController.friends.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        
        cell.pictureView.image = friendController.friends[indexPath.row].image
        cell.nameLabel.text = friendController.friends[indexPath.row].name

        return cell
    }
 

   

    

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            guard let destinationVC = segue.destination as? FriendsDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC.friend = friendController.friends[indexPath.row]
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    }

}
