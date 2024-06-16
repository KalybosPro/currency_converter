<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

/// You can also get the current country of the user by calling [getCountryFromPosition].
  /// This takes the current position of the user. To have user's current position, just call [localize]
  /// Now, you need to call [currenxcontroller.currencyCode] and provide to it, the country name.
  /// From there, you are able to convert your source money with [converterController.convertCurrency]
  /// 
  /// Example:
  /// localize().then((position){
  ///   getCountryFromPosition(position).then((country){
  ///     currenxcontroller.currencyCode(country).then((toCurrency){
  ///       converterController.convertCurrency(fromCurrency,toCurrency,amount).then((newAmount){
  ///         print("New amount: $newAmount");
  ///       });
  ///     });
  ///   });
  /// });

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

You can also get the current country of the user by calling [getCountryFromPosition].
This takes the current position of the user. To have user's current position, just call [localize]
Now, you need to call [currenxcontroller.currencyCode] and provide to it, the country name.
From there, you are able to convert your source money with [converterController.convertCurrency]

# Example

```dart

localize().then((position){
  getCountryFromPosition(position).then((country){
    currenxcontroller.currencyCode(country).then((toCurrency){
      converterController.convertCurrency(fromCurrency,toCurrency,amount).then((newAmount){
        print("New amount: $newAmount");
      });
    });
  });
});

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
