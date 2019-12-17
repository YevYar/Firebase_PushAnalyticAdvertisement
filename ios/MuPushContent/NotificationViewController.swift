//
//  NotificationViewController.swift
//  MuPushContent
//
//  Created by Євгеній Яремченко on 12/16/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
      let size = view.bounds.size
      preferredContentSize = CGSize(width: size.width, height: size.height / 4.0)
    }
    
    func didReceive(_ notification: UNNotification) {
      print("===================================== FUCK!!!!!");
      print(notification.request.content);
        let content = notification.request.content;
        titleLabel.text = content.title
        subtitleLabel.text = content.subtitle
        bodyLabel.text = content.body
    }

}
