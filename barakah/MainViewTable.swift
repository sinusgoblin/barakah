//
//  MainViewTable.swift
//  barakah
//
//  Created by Naufal on 5/18/15.
//  Copyright (c) 2015 snapsell. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MainViewTable: PFQueryTableViewController {
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.parseClassName = "product"
        self.textKey = "createdAt"
        self.pullToRefreshEnabled = true
        self.objectsPerPage = 5
        self.paginationEnabled = true
    
    }
    
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "product")
        query.orderByDescending("createdAt")
        
        
        return query
    }
    
    @IBAction func postAction(sender: AnyObject) {
        self.performSegueWithIdentifier("postSegue", sender: self)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomTableViewCell!
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CustomCell")
        }
        
        if let dateUpdated = object?.updatedAt as NSDate? {
        var dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "EEE, MMM d, h:mm a"
        cell.date.text = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated)) as String
            
        }
        
        if let titleName = object?["title"] as? String {
            cell.title.text = titleName
        }
        
        var phoneNumber = object?["phone"] as? Int;
        
        var desc = object?["desc"] as? String;
        
        var password = object?["password"] as? String
        
        if let priceTitle = object?["price"] as? Int {
            cell.price.text = String(priceTitle)

        }
        
        var initialThumbnail = UIImage(named: "AppIcon")
        cell.customImage.image = initialThumbnail
        if let picture = object?["image"] as? PFFile {
            cell.customImage.file = picture
            cell.customImage.loadInBackground()
        }
        
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
//        var nav = segue.destinationViewController as! UINavigationController
//        var detailScene = nav.topViewController as! DetailViewController
        if (segue.identifier == "detailSegue"){
            
            var detailScene = segue.destinationViewController as! DetailViewController
            
            // Pass the selected object to the destination view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let row = Int(indexPath.row)
                detailScene.currentObject = objects?[row] as? PFObject
            }
        
        } else if (segue.identifier == "postSegue") {
             var postScene = segue.destinationViewController as! PostChoicesController
        
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        loadObjects()
        tableView.reloadData()
    }

   
}
