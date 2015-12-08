# DZImageView

[![Version](https://img.shields.io/cocoapods/v/DZImageView.svg?style=flat)](http://cocoapods.org/pods/DZImageView)
[![License](https://img.shields.io/cocoapods/l/DZImageView.svg?style=flat)](http://cocoapods.org/pods/DZImageView)
[![Platform](https://img.shields.io/cocoapods/p/DZImageView.svg?style=flat)](http://cocoapods.org/pods/DZImageView)

Image View with content mode animations. Inspired by the Objective-C version [VICMAImageView](https://github.com/vitoziv/VICMAImageView).

![DZImageView Exmaple](https://i.imgur.com/tQdH10N.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Create an Image View
```swift
let imageView = DZImageView(image: UIImage(named: "image.jpg")!, frame: CGRectMake(0, 0, 300, 300))
self.view.addSubview(imageView)
```

### Animating
```swift
imageView.animationDuration = 0.3 // Optional, Default: 0.3
imageView.animateImageViewContentModeTo(.ScaleAspectFit) // Animate content mode
imageView.animateImageViewFrameTo(CGRectMake(0, 0, 300, 300)) // Animate frame
imageView.animateImageViewTo(.ScaleAspectFit, frame: CGRectMake(0, 0, 300, 300)) // Animate both content mode and frame
```

## Requirements

* iOS 8.0
* Swift 2

## Installation

DZImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DZImageView"
```

To install DZImageView with Carthage add the following line to your `cartfile`

```
github "Fortyfox/DZImageView" ~> 0.1.1
```

## License

DZImageView is available under the MIT license. See the [LICENSE file](https://github.com/Fortyfox/DZImageView/blob/master/LICENSE) for more info.
