//
//  ViewController.swift
//  PhotoUploader
//
//  Created by SDT2 on 2015. 10. 29..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let manager = NetworkManager.sharedManager
        manager.upload(image)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func takePicture(sender: AnyObject) {
        let p = UIImagePickerController()
        p.delegate = self
        self.presentViewController(p, animated: true, completion: nil)
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

