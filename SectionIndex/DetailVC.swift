//
//  DetailVC.swift
//  SectionIndex
//
//  Created by HuuLuong on 8/3/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var person = Person()
    var labelName = UILabel()
    var labelMobile = UILabel()
    var labelPhoneNumber = UILabel()
    var img_phone = UIImageView()
    var img_message = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.whiteColor()
        
        //Show Label Name
        self.labelName.frame = CGRectMake(30, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.lastName + " " + person.firstName
        self.view.addSubview(self.labelName)
        
        //Show Label "Mobile"
        self.labelMobile.frame = CGRectMake(30, 180, 100, 50)
        self.labelMobile.font = UIFont.boldSystemFontOfSize(20)
        self.labelMobile.text = "Mobile: "
        self.view.addSubview(self.labelMobile)
        
        //Show Phone Number
        self.labelPhoneNumber.frame = CGRectMake(102, 180, 200, 50)
        self.labelPhoneNumber.font = UIFont.boldSystemFontOfSize(20)
        self.labelPhoneNumber.text = person.phoneNumber
        self.view.addSubview(self.labelPhoneNumber)
        
        //Show Phone Icon
        self.img_phone.frame = CGRectMake(30, 235, 50, 50)
        self.img_phone.image = UIImage(named: "phone icon")
        self.view.addSubview(self.img_phone)
        
        //Show Message Icon
        self.img_message.frame = CGRectMake(82, 235, 50, 50)
        self.img_message.image = UIImage(named: "message icon")
        self.view.addSubview(self.img_message)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
