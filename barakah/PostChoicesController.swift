//
//  PostChoicesController.swift
//  barakah
//
//  Created by Naufal on 5/21/15.
//  Copyright (c) 2015 snapsell. All rights reserved.
//

import UIKit

class PostChoicesController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    var imagePicked: UIImageView!
    
    @IBAction func chooseGallery(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicked = UIImageView()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        imagePicked!.image = image
        self.performSegueWithIdentifier("next", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "next" {
            var postView:PostViewController = segue.destinationViewController as! PostViewController
            postView.currentImage = imagePicked.image
        
        }
    }

}
