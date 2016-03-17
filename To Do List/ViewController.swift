//
//  ViewController.swift
//  To Do List
//
//  Created by Nithin Reddy Gaddam on 3/14/16.
//  Copyright © 2016 Nithin Reddy Gaddam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

//    @IBAction func nightMode(sender: AnyObject) {
//        view.backgroundColor = UIColor.darkGrayColor()
//        
//        //gets all subviews inside the top-level view
//        let allSubviews = view.subviews
//        
//        for eachView in allSubviews{
//            
//            if eachView is UILabel{
//                //forced downcasting eachView to UILabel
//                let myLabel = eachView as! UILabel
//                myLabel.textColor = UIColor.lightGrayColor()
//            }
//        }
//    }
    
    
    @IBAction func resetList(sender: AnyObject) {
        
        let confirm = UIAlertController(title: "Are you sure?", message: "Really reset the list?", preferredStyle: .Alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .Destructive, handler: {
        
            action in
        
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            for i in 0..<self.biWeeklyTasks.count {
                self.biWeeklyTasks[i].completed = false
            }
            self.taskTableView.reloadData()
        
        })
        
        let noAction = UIAlertAction(title: "No", style: .Default, handler: {
            
            action in
            
        })
        
        //add action to alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        //Show it
        presentViewController(confirm, animated: true, completion: nil)
        
       
        
    }

    
    @IBOutlet weak var taskTableView: UITableView!
    
    var dailyTasks = [
        Task(name: "Message girlfriend", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Call girlfriend", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Pick gf from home", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Compliment gf", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Drop gf at work", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "pick gf from work", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "kiss gf goodnight", type: .Daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Take gf shopping", type: .Weekly, completed: true, lastCompleted: nil),
        Task(name: "take gf to the movies", type: .Weekly, completed: false, lastCompleted: nil),
        Task(name: "take gf to expensive diner", type: .Weekly, completed: false, lastCompleted: nil),
        Task(name: "buy gf clothes", type: .Weekly, completed: false, lastCompleted: nil)
    ]
    
    var biWeeklyTasks = [
        Task(name: "take gf to beauty parlour", type: .BiWeekly, completed: false, lastCompleted: nil),
        Task(name: "take gf to pedicure", type: .BiWeekly, completed: false, lastCompleted: nil),
        Task(name: "cut your hair", type: .BiWeekly, completed: false, lastCompleted: nil),
        Task(name: "shave", type: .BiWeekly, completed: false, lastCompleted: nil)
    ]
    
    @IBAction func nightModeToggle(sender: AnyObject) {
        let nightMode = sender as! UISwitch
        if nightMode.on {
            view.backgroundColor = UIColor.darkGrayColor()
            
        }
        else {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clearColor()
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return biWeeklyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .Default, title: "Complete", handler: {
            //closure parameters
            action, indexPath in
            
            //find the right object and set it to completed
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.biWeeklyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            //refresh table
            tableView.reloadData()
            
            //tell the table view its done editing
            tableView.editing = false
        })
        
        let actions = [myAction]
        return actions
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            
            var currentTask: Task!
            switch indexPath.section {
            case 0:
                currentTask = dailyTasks[indexPath.row]
            case 1:
                currentTask = self.weeklyTasks[indexPath.row]
            case 2:
                currentTask = biWeeklyTasks[indexPath.row]
            default:
                break
            }
            
            cell.textLabel!.text = currentTask.name
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGrayColor()
            cell.accessoryType = .Checkmark
        } else {
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.accessoryType = .None
        }
        
        
        // background transparent
            cell.backgroundColor = UIColor.clearColor()
            return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Every Two Weeks"
        default:
            return "This should not be here"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

