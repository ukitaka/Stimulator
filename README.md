# Stimulator

[![Version](https://img.shields.io/cocoapods/v/Stimulator.svg?style=flat)](http://cocoapods.org/pods/Stimulator)
[![License](https://img.shields.io/cocoapods/l/Stimulator.svg?style=flat)](http://cocoapods.org/pods/Stimulator)
[![Platform](https://img.shields.io/cocoapods/p/Stimulator.svg?style=flat)](http://cocoapods.org/pods/Stimulator)

Custom event handling based on Responder Chain.

## Usage

### Create custom event and handler protocol

```
import Stimulator

struct ShowAlertEvent : Stimulator.Event {

    typealias Responder = ShowAlertResponder

        let title: String
        let message: String

        init(_ title: String, _ message: String) {
            self.title = title
                self.message = message
        }

    func stimulate(responder: Responder) {
        responder.showAlert(event: self)
    }
}

protocol ShowAlertResponder {

    func showAlert(event: ShowAlertEvent)

}
``` 

### Generate event

Generates event in `UIResponer` subclass (e.g. `UIView`, `UIViewController`)

```
self.stimulate(event: ShowAlertEvent("title", "message"))
```

### Handle event

```
class MyViewController: UIViewController, ShowAlertResponder {

    func showAlert(event: ShowAlertEvent) {
        let alert = UIAlertController(title: event.title, message: event.message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { _ in }))
        self.show(alert, sender: nil)
    }

}
```

You can use protocol extensions to provide a default implementation.

```
extension ShowAlertResponder where Self : UIViewController {

    func showActionSheet(event: ShowActionSheetEvent) {
        let alert = UIAlertController(title: event.title, message: event.message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { _ in }))
        self.showViewController(alert, sender: nil)
    }

}
```

## Requirements

+ iOS 9.0+
+ Xcode8+

## Installation

Stimulator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Stimulator"
```

## Author

yuki.takahashi, yuki.takahashi.1126@gmail.com

## License

Stimulator is available under the MIT license. See the LICENSE file for more info.
