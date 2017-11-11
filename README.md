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
![HYParentalGate Example](https://s22.postimg.org/3rq8shbcx/Parental_Gate.png)

## Usage
``` swift
import HYParentalGate

HYParentalGate.sharedGate.show(successHandler: {
// User proved that he or she is an adult.
// Code was entered correctly.
// Basically here you just navigate to the next screen
}
```
There is no failure block since we could not come up with the idea where it may be used :) If dialog was dismissed you just stay where you've been before.

Also here is an example of how to use localized version of the _HYParentlGate_:
```swift
import HYParentalGate

let parentalGate = HYParentalGate.sharedGate
parentalGate.languageCode = "uk"
parentalGate.show(successHandler: {
// Code was entered correctly. Handle this properly.
})
```

## License
HYParentalGate is available under the MIT license. See the LICENSE file for more info.
