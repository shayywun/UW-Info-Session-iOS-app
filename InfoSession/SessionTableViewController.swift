//
//  SessionTableViewController.swift
//  InfoSession
//
//  Created by Seun Makinde on 2015-12-09.
//  Copyright © 2015 Seun Makinde. All rights reserved.
//

import UIKit

class SessionTableViewController: UITableViewController,  NSURLConnectionDelegate {
    
    //MARK: Properties
    
    @IBOutlet var sessionTable: UITableView!
    
    var sessions = [Session]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSessions();
    }

    func loadSessions(){
        self.sessions = [Session]();
        let postEndpoint: String = "https://api.uwaterloo.ca/v2/resources/infosessions.json?key=1b4bdb492aa366991d6db1117b6f9abe"
        guard let url = NSURL(string: postEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard error == nil else {
                print("error calling GET on /posts/1")
                print(error)
                return
            }
            // parse the result as JSON, since that's what the API provides
            let post: NSDictionary
            do {
                post = try NSJSONSerialization.JSONObjectWithData(responseData,
                    options: []) as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            // now we have the post, let's just print it to prove we can access it
            var temp:[String: String]
            for item in post["data"] as! [AnyObject]{
                
                temp=["companyName": item["employer"] as! String,
                    "date":item["date"] as! String,
                    "startTime":item["start_time"] as! String,
                    "endTime":item["end_time"] as! String,
                    "location":item["location"] as! String,
                    "website":item["website"] as! String,
                    "audience":item["audience"]as! String,
                    "programs":item["programs"]as! String
                ];
                if(temp["companyName"] != nil && temp["companyName"] != "No info sessions" && temp["companyName"]?.uppercaseString.rangeOfString("CANCELLED")==nil && temp["companyName"] != "New Year's Day" && temp["companyName"] != "Lectures begin"){
                    let session1 = Session(info: temp)
                    if((session1) != nil)
                    {
                        self.sessions.append(session1!)
                    }
                }
                
            }
            self.sessionTable.reloadData();
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sessions.count
    }
 

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let session = self.sessions[indexPath.row];
        let cellIdentifier = "SessionTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SessionTableViewCell
        
        // Configure the cell...
        cell.companyLabel.text = session.companyName;
//        print(session.date)
        cell.dateLabel.text = session.date + " | " + session.startTime + " - " + session.endTime;
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        var detailVC = segue.destinationViewController as! SessionViewController;
    
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            detailVC.selectedSession = self.sessions[indexPath.row];
        }
        
    }
    



}
