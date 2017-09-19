//
//  TodoTableViewCell.swift
//  RealmTest
//
//  Created by Seoksoon Jang on 2017. 9. 20..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
  @IBOutlet var jobListLabel: UILabel!
  @IBOutlet var isDone: UISwitch!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
