**HexColorExt** is an extension for handling color in Swift.

## 📲 Installation

`HexColorExt` is available on [CocoaPods](https://cocoapods.org/pods/HexColorExt):

```ruby
pod 'HexColorExt'
```

## 📝 How
### Code Implementation
```swift
import HexColorExt
```
### Generating UIColors
Wiith first "#" Hex Codes
```swift
let orangeColor = UIColor(hex: "#f60")  // short hex
let blueColor = UIColor(hex: "#0080FF")
let blueColorWithAlpha = UIColor(hex: "#0080ff80")
```

Without first "#" Hex Codes
```swift
let orangeColor = UIColor(hex: "f60")  // short hex
let blueColor = UIColor(hex: "0080FF")
let blueColorWithAlpha = UIColor(hex: "0080ff80")
```

With Alpha Component
```swift
let orangeColor = UIColor(hex: "f60").withAlpha(0.8)
let blueColor = UIColor(hex: "0080FF").withAlpha(0.6)
```

### Generating Hex Strings from UIColor
```swift
let blueColor = UIColor(hex: "0080FF")
let hex = blueColor.toHex()  // "0080FF"

let blueColorWithAlpha = UIColor(hex: "0080ff80")
let hexWithAlpha = blueColor.toHex(alpha: true)  // "0080ff80"
```

### Generating UIImage from UIColor
```swift
let blueImage:UIImage = UIColor(hex: "0080FF").image()
```

## 📋 Requirements

* iOS 10.0+
* Xcode 11+
* Swift 5.1+
