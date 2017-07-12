# PCAiOSLib
## Introduction 

The PCAiOSLib Cocoapod is an easy way to use the PCA Predict or Addressy type-ahead search technology within an iOS  application. 

## Quick Start

A View Controller of type PCALookupViewController can be initilized with a license key, and then presented to the user. This will display a form with the type-ahread seach technology: 

```swift
@IBAction func lookupAddressPressed(_ sender: Any) {
  let viewController = PCALookupViewController(licenseKey: "0000-0000-0000-0000");
  viewController.addressDelegate = self;
  self.present(viewController, animated: true, completion: nil);
}
```
    
On close of this form, func didRecieveAddress can be used, to retrieve the address response of type RetrieveResponseItem.

## Example

A working example of how to implement this Cocoapod is [available here](https://github.com/PCAPredict/PCAiOSLib_ExampleImplementation). Please note you will need to register with either [PCA Predict](http://www.pcapredict.com "PCA Predict") or [Addressy](https://www.addressy.com "Addressy") for a license key.
