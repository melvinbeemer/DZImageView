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
        imageView.animateImageViewContentModeTo(.ScaleAspectFit)
    }
    
    @IBAction func updateToAspectFillButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.ScaleAspectFill)
    }
    
    @IBAction func updateToScaleToFillButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.ScaleToFill)
    }
    
    @IBAction func updateToRedrawButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Redraw)
    }
    
    @IBAction func updateToCenterButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Center)
    }
    
    @IBAction func updateToTopButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Top)
    }
    
    @IBAction func updateToBottomButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Bottom)
    }
    
    @IBAction func updateToLeftButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Left)
    }
    
    @IBAction func updateToRightButtonTouched(sender: AnyObject) {
        imageView.animateImageViewContentModeTo(.Right)
    }
}

