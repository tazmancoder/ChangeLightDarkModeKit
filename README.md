# ChangeLightDarkModeKit

<p>
    <img src="https://img.shields.io/badge/iOS-17.0+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.0-ff69b4.svg" />
</p>

----

> This package contains all the code to be able to a view to your Settings
view that will allow you to switch between light and dark mode. You can also
allow the system to be in control.

> This view should be used inside of a form. That is the initial intent. Doing
so will require no padding adding. It will present as it should. If you choose to
put this view inside a VStack then you will need to add padding like in the example
below.

----

## Features

### Views
-   ChangeLightDarkModeView

#### Example

```swift
// This is an example of using this in a form
var body: some View {
    Form {
        ChangeLightDarkModeView(toggleTintColor: .purple)
    }
}

// Example outside a form view
var body: some View {
    VStack {
        ChangeLightDarkModeView(toggleTintColor: .purple)
            .padding(2.5)
    }
}
```

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (**preferred**)

### Dependency For Another Swift Package
To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:
`.package(url: "https://github.com/tazmancoder/ViewModifierKit.git", .upToNextMinor(from: "1.0.0"))`

### Xcode project
To install this into your Xcode project, follow the instructions below:

1. Goto your project folder, tap Package Dependencies, under Packages click the plus button
2. Enter this in searchbar - `https://github.com/tazmancoder/ChangeLightDarkModeKit.git`. 
3. Set `Dependency Rule` to `Up to Next Major Version`
4. Tap `Add Package` button.

Thats it this package will then be installed and ready to use.

> Note: The package requires iOS v13.0+ or macOS v10.15+




