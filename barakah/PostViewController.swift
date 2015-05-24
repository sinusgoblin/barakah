//
//  PostViewController.swift
//  barakah
//
//  Created by Naufal on 5/21/15.
//  Copyright (c) 2015 snapsell. All rights reserved.
//

//
//  postView.swift
//  barakah
//
//  Created by $MzN$ on 5/19/15.
//  Copyright (c) 2015 snapsell. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var titleF: UITextField!
    @IBOutlet weak var priceF: UITextField!
    @IBOutlet weak var phoneNumberF: UITextField!
    @IBOutlet weak var passwordF: UITextField!
    @IBOutlet weak var descF: UITextView!
    
    var categories = ["Electronics", "Games", "Accessories", "Vehicles", "Properties"]
    
    @IBOutlet weak var imgv: UIImageView!
    var currentImage:UIImage!
    var tempImage:UIImage!
    
    
    // Need to add Categories and Region
    @IBAction func submitButton(sender: AnyObject) {
        
        var product = PFObject(className: "Post")
        let imageData = UIImagePNGRepresentation(self.imgv.image)
        
        let imageFile = PFFile(name: "image.png", data: imageData)

        product["image"] = imageFile;
        product["title"] = titleF.text;
        product["price"] = String(priceF.text);
        product["phone"] = String(phoneNumberF.text);
        product["desc"] = descF.text;
        product["password"] = passwordF.text;
        
        var date: String!;
        if let dateUpdated = product.updatedAt as NSDate? {
            var dateFormat = NSDateFormatter()
            dateFormat.dateFormat = "EEE, MMM d, h:mm a"
            date = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated)) as String
            
        }
        product.save();
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if((currentImage) != nil){
            imgv.image=currentImage;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return categories[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var next:DetailViewController = segue.destinationViewController as! DetailViewController
        if(segue.identifier == "itemV"){
            next.getTitle.text = titleF.text;
            
        }
    }
    
}
