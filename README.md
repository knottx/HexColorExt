**AppStoreManager** is a new version checking framework for iOS.

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

Can use wiith first "#" Hex Codes
```swift
let blueColor = UIColor(hex: "#0080FF")
let blueColorWithAlpha = UIColor(hex: "#0080ff80")
```

Or use without first "#" Hex Codes
```swift
let blueColor = UIColor(hex: "0080FF")
let blueColorWithAlpha = UIColor(hex: "0080ff80")
```

Generating Hex Strings from NSColor
```swift
let blueColor = UIColor(hex: "0080FF")
let hex = bludColor.toHex()  // "0080FF"

let blueColorWithAlpha = UIColor(hex: "0080ff80")
let hexWithAlpha = bludColor.toHex(alpha: true)  // "0080ff80"
```


## 📋 Requirements

* iOS 10.0+
* Xcode 11+
* Swift 5.1+
