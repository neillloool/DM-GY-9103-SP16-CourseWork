//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Neill Chua on 3/6/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController, UITextFieldDelegate,
UINavigationControllerDelegate, UIImagePickerControllerDelegate
    {
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBOutlet var serialNumberFIeld: UITextField!
    @IBOutlet var nameField: CustomTextField!
    @IBOutlet var serialNumberField: CustomTextField!
    @IBOutlet var valueField: CustomTextField!
    @IBOutlet var imageView: UIImageView!

    @IBOutlet var deletePicture: UIBarButtonItem!
  
    var item: Item! {
        didSet {
        navigationItem.title = item.name
        }
    }
    var imageStore: ImageStore!
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        let crossHairPNG = "crosshair.svg.png"
        let imageCrossHair = UIImage(named: crossHairPNG)
        let crossHairImageView = UIImageView(image: imageCrossHair)
        // Use a smaller frame or the crosshairs will be too big
        crossHairImageView.frame = CGRectMake(0, 0, 50.0, 50.0)
        let tempView = imagePicker.view
        crossHairImageView.center = tempView.center
        tempView.didAddSubview(crossHairImageView)
        
        
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
            //  Add the Camera overlay
            tempView.frame = (imagePicker.cameraOverlayView?.frame)!
            imagePicker.cameraOverlayView = crossHairImageView
            

        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        // Place image picker on the screen
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    

    func imagePickerController(picker: UIImagePickerController,
         didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        
        // Get picked image from info dictionary
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forKey:item.itemKey)
        
        // Put that image onto the screen in our image view
        imageView.image = image
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    }()

    
    override func viewWillAppear(animated: Bool){
        
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberFIeld.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        valueField.keyboardType = UIKeyboardType.NumberPad
        
        // Get the item key
        let key = item.itemKey
        
        // If there is an associated image with the item ...
        if let imageToDisplay = imageStore.imageForKey(key) {
            // ... display it on the image view
            imageView.image = imageToDisplay
        }
    
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberFIeld.text
        
        if let valueText = valueField.text,
            let value = numberFormatter.numberFromString(valueText) {
            item.valueInDollars = value.integerValue
        }
        else {
            item.valueInDollars = 0
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func deletePicture(sender: AnyObject) {
        let title = "Delete \(item.name) Image"
        let message = "Are you sure you want to delete this image?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action) -> Void in
            self.imageStore.deleteImageForKey(self.item.itemKey)
            self.imageView.image = nil
        })
        
        ac.addAction(deleteAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
}

