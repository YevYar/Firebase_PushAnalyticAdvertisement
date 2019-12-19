//
//  NotificationViewController.swift
//  MyPushContent_4
//
//  Created by Євгеній Яремченко on 12/18/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
      let size = view.bounds.size
      preferredContentSize = CGSize(width: size.width, height: 150)
    }
  
//  override func loadView() {
//    super.loadView()
//    preferredContentSize = CGSize(width: 320, height: 150)
//  }
    
    func didReceive(_ notification: UNNotification) {
        let content = notification.request.content;
        
          titleLabel.text = content.title
          bodyLabel.text = content.body
    }

}
