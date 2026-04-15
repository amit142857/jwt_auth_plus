# **🛡️ JWT Auth Plus**

A high-performance, lightweight JWT management library for Flutter. Simplify your authentication flow with robust decoding, expiration tracking, and safe Base64 handling.

## **✨ Features**

* 🚀 **Zero Dependencies:** Pure Dart implementation for maximum speed and compatibility.  
* 🛠️ **Robust Decoding:** Automatically handles missing Base64 padding to prevent crashes.  
* ⏱️ **Expiry Tracking:** Built-in logic to check if tokens are expired with millisecond precision.  
* 🧬 **Model-Based:** Access payload data through a clean JWTModel rather than messy Maps.  
* 🔐 **Secure-Ready:** Designed to work perfectly alongside flutter\_secure\_storage.

## **🚀 Getting Started**

Add the dependency to your pubspec.yaml:  
dependencies:  
  jwt\_auth\_plus: ^1.0.0

## **📖 Usage**

### **1\. Decoding a Token**

Turn a raw string into a structured model instantly. This method handles the Base64 "padding" issues (the \== at the end of strings) automatically.  
import 'package:jwt\_auth\_plus/jwt\_auth\_plus.dart';

final String rawToken \= "your.jwt.token.here";

try {  
  final jwt \= JWTAuthPlus.decode(rawToken);  
    
  print('User ID: ${jwt.userId}');  
  print('Expiration: ${jwt.exp}');  
  print('Is Expired: ${jwt.isExpired}');  
} catch (e) {  
  print('Invalid Token: $e');  
}

### **2\. Guarding Routes**

Use the simple one-liner helper to validate tokens before allowing a user to see a screen.  
if (JWTAuthPlus.isValid(storedToken)) {  
  // Token exists and is not expired  
  navigator.pushNamed('/dashboard');  
} else {  
  // Token is missing, malformed, or expired  
  navigator.pushNamed('/login');  
}

### **3\. API Headers**

Quickly generate a standard Authorization header for your dio or http requests.  
final headers \= JWTAuthPlus.getHeader(myToken);  
// Output: {'Authorization': 'Bearer \<your\_token\>'}

// Or customize the prefix  
final customHeader \= JWTAuthPlus.getHeader(myToken, prefix: 'Token');

## **🧬 JWTModel Anatomy**

The JWTModel class makes it easy to interact with the decoded data without manually accessing Map keys.

| Property | Type | Description |
| :---- | :---- | :---- |
| **userId** | String? | Automatically extracts the sub claim from the payload. |
| **exp** | int? | The raw expiration timestamp from the payload. |
| **isExpired** | bool | Returns true if the current time is past the exp claim. |
| **payload** | Map | The full raw decoded payload for custom claims. |

## **🤝 The Plus Ecosystem**

Enhance your Flutter development with these compatible libraries:

* 💎 [**glass\_morphism\_plus**](https://pub.dev/packages/glass_morphism_plus) \- For premium, high-performance Glassmorphic UI.  
* 📳 [**vibration\_service**](https://www.google.com/search?q=https://pub.dev/packages/vibration_service) \- For professional haptic feedback.

## **📝 License**

This project is licensed under the MIT License \- see the LICENSE file for details.