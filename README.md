# HYParentalGate

## Description

Applications made for kids very often contain screens that are designed for adults, e.g. in app purchases, feedback forms, etc. Apple requires those screens to be protected by __Parental Gate__.

From AppStore review guidelines:
> 24.3 Apps in the Kids Category must get parental permission or use a parental gate before allowing the user to link out of the app or engage in commerce

_HYParentalGate_ is created using Swift 4. It works on all the iPhones, iPods and iPads starting from iOS 8.0. Right now _HYParentalGate_ only supports landscape device modes. Portrait mode support will be added soon.

_HYParentalGate_ is localized into 2 languages:
- English - default
- Ukrainian

__20__ more languages are going to be added very soon.

## Screenshot
![HYParentalGate Example](https://raw.githubusercontent.com/RomanN2/HYParentalGate/master/.github/Screenshot.jpeg)

## Usage
``` swift
import HYParentalGate

HYParentalGate.sharedGate.show(successHandler: {
// User proved that he or she is an adult.
// Code was entered correctly.
// Basically here you just navigate to the next screen
}
```

Also here is an example of how to use localized version of the _HYParentlGate_:
```swift
import HYParentalGate

func showParentalGate() {
    HYParentalGate.sharedGate.show(successHandler: {
        print("parental gate passed")
    }, cancelHandler: {
        print("parental gate dismissed")
    })
}
```

## License
HYParentalGate is available under the MIT license. See the LICENSE file for more info.
