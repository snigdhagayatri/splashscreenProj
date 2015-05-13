//
//  JoinCourseViewController.swift
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

import Foundation
import UIKit

class JoinCourseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var bookmark: UIButton!
    
    @IBOutlet var joinCourse: UIButton!
    
    @IBAction func joinCourseAction(sender: AnyObject) {
        if(NSUserDefaults.standardUserDefaults().boolForKey("isLoggedIn")) {
            self.performSegueWithIdentifier("enrolSegue", sender: self)
        }
        else {
            let alert = UIAlertView()
            alert.title = "Login Error"
            alert.message = "You must be logged in to enroll for the course"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    @IBAction func bookmark(sender: UIButton) {
        let alert = UIAlertView()
        alert.title = "Bookmark"
        alert.message = "Your course is saved"
        alert.addButtonWithTitle("Ok")
        alert.show()

        
    }
    
}
