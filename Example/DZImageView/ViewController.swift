//
//  ViewController.swift
//  DZImageView
//
//  Created by Melvin Beemer on 12/04/2015.
//  Copyright (c) 2015 Melvin Beemer. All rights reserved.
//

import UIKit
import DZImageView

class ViewController: UIViewController {
    
    @IBOutlet weak var imageContainerView: UIView!
    
    var imageView: DZImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        imageView = DZImageView(image: UIImage(named: "1.jpg")!, frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, imageContainerView.frame.size.height))
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateToAspectFitButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.ScaleAspectFit)
    }
    
    @IBAction func updateToAspectFillButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.ScaleAspectFill)
    }
    
    @IBAction func updateToScaleToFillButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.ScaleToFill)
    }
    
    @IBAction func updateToRedrawButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Redraw)
    }
    
    @IBAction func updateToCenterButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Center)
    }
    
    @IBAction func updateToTopButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Top)
    }
    
    @IBAction func updateToBottomButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Bottom)
    }
    
    @IBAction func updateToLeftButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Left)
    }
    
    @IBAction func updateToRightButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentMode(.Right)
    }
}

