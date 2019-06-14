//
//  Controller.swift
//  Friends
//
//  Created by Stephanie Bowles on 6/14/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit


class FriendController {
    var friends = [Friend]()
    
    init() {
        friends.append(Friend(name: "Hodor", image: UIImage(named: "Picture")!))
    }
}
