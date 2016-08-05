//
//  TableViewController.swift
//  SectionIndex
//
//  Created by HuuLuong on 8/2/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayData: NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKey: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor()
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        
        arrayData = NSMutableArray()
        
        for i in 0...60 {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
            print(person.fullName)
        }
        
        for element in arrayData {
            let person = element as! Person
            var firstLetter: String = (person.firstName as NSString!).substringToIndex(1)
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            var arrayForLetter: NSMutableArray!
            
            if (dictContacts.valueForKey(firstLetter) != nil) {
                arrayForLetter = dictContacts.valueForKey((firstLetter)) as! NSMutableArray
                arrayForLetter.addObject(person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
                
            } else {
                arrayForLetter = NSMutableArray(object: person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
            
            
        }
        
//        print(dictContacts)
        
        arrayKey = dictContacts.allKeys as! [String]
        arrayKey = arrayKey.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
        
        
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrayKey.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        return (sectionPersons!.count)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
       
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        
        cell?.textLabel!.text = person.fullName
        cell?.detailTextLabel?.text = person.phoneNumber
    
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC = DetailVC()
        
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        
        detailVC.person = person
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
