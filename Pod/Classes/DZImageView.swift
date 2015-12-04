//
//  DZImageView.swift
//  Pods
//
//  Created by Melvin Beemer on 12/4/15.
//
//

import UIKit

public class DZImageView: UIView {
    
    // Public vars
    public var animationDuration: NSTimeInterval = 0.3
    
    // Internal and private vars
    var image: UIImage!
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(image: UIImage, frame: CGRect) {
        self.init(frame: frame)
        
        commonInit()
        
        self.image = image
        self.imageView.image = image
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.ScaleAspectFill
        
        if imageView == nil {
            imageView = UIImageView(frame: self.frame)
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            self.addSubview(imageView)
        }
    }
    
    private func updateView() {
        if self.bounds.size.width == 0 || self.bounds.size.height == 0 || image.size.width == 0 || image.size.height == 0 {
            return
        }
        
        switch self.contentMode {
        case .ScaleAspectFit:
            updateViewToAspectFit()
            break
        case .ScaleAspectFill:
            updateViewToAspectFill()
            break
        case .ScaleToFill:
            updateViewToScaleToFill()
            break
        case .Center:
            updateViewToCenter()
            break
        case .Bottom:
            updateViewToBottom()
            break
        case .BottomLeft:
            updateViewToBottomLeft()
            break
        case .BottomRight:
            updateViewToBottomRight()
            break
        case .Left:
            updateViewToLeft()
            break
        case .Right:
            updateViewToRight()
            break
        case .Top:
            updateViewToTop()
            break
        case .TopLeft:
            updateViewToTopLeft()
            break
        case .TopRight:
            updateViewToTopRight()
            break
        case .Redraw:
            updateViewToScaleToFill()
            break
        }
    }
    
    private func updateViewToAspectFit() {
        guard let image = imageView.image else { return }
        var imageSize = CGSizeMake(image.size.width / image.scale, image.size.height / image.scale)
        
        let widthRatio = imageSize.width / self.bounds.size.width
        let heightRatio = imageSize.height / self.bounds.size.height
        let imageScaleRatio = max(widthRatio, heightRatio)
        
        imageSize = CGSizeMake(imageSize.width / imageScaleRatio, imageSize.height / imageScaleRatio)
        
        imageView.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height)
        centerImageViewToSuperView()
    }
    
    private func updateViewToAspectFill() {
        var imageSize = CGSizeMake(imageView.image!.size.width / imageView.image!.scale, imageView.image!.size.height / imageView.image!.scale)
        
        let widthRatio = imageSize.width / self.bounds.size.width
        let heightRatio = imageSize.height / self.bounds.size.height
        let imageScaleRatio = min(widthRatio, heightRatio)
        
        imageSize = CGSizeMake(imageSize.width / imageScaleRatio, imageSize.height / imageScaleRatio)
        
        imageView.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height)
        centerImageViewToSuperView()
    }
    
    private func updateViewToScaleToFill() {
        imageView.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        centerImageViewToSuperView()
    }
    
    private func updateViewToCenter() {
        fitImageViewSizeToImageSize()
        centerImageViewToSuperView()
    }
    
    private func updateViewToBottom() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - image.size.height / 2)
    }
    
    private func updateViewToBottomLeft() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(image.size.width / 2, self.bounds.size.height - image.size.height / 2)
    }
    
    private func updateViewToBottomRight() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(self.bounds.size.width - image.size.width / 2, self.bounds.size.height - image.size.height / 2)
    }
    
    private func updateViewToLeft() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(image.size.width / 2, self.bounds.size.height / 2)
    }
    
    private func updateViewToRight() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(self.bounds.size.width - image.size.width / 2, self.bounds.size.height / 2)
    }
    
    private func updateViewToTop() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(self.bounds.size.width / 2, image.size.height / 2)
    }
    
    private func updateViewToTopLeft() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(image.size.width / 2, image.size.height / 2)
    }
    
    private func updateViewToTopRight() {
        fitImageViewSizeToImageSize()
        imageView.center = CGPointMake(self.bounds.size.width - image.size.width / 2, image.size.height / 2)
    }
    
    // MARK: - Helper Methods
    private func fitImageViewSizeToImageSize() {
        guard let image = imageView.image else { return }
        let imageSize = CGSizeMake(image.size.width / image.scale, image.size.height / image.scale)
        
        imageView.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height)
    }
    
    private func centerImageViewToSuperView() {
        imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
    }
}

public extension DZImageView {
    
    public func animateImageView(contentMode: UIViewContentMode, frame: CGRect) {
        UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: { () -> Void in
            self.frame = frame
            self.contentMode = contentMode
            self.updateView()
            }, completion: nil)
    }
    
    public func animateImageViewContentMode(contentMode: UIViewContentMode) {
        UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: { () -> Void in
            self.contentMode = contentMode
            self.updateView()
            }, completion: nil)
    }
    
    public func animateImageViewFrame(frame: CGRect) {
        UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: { () -> Void in
            self.frame = frame
            self.updateView()
            }, completion: nil)
    }
    
    public func presentationImageSize() -> CGSize {
        return imageView.bounds.size
    }
    
}
