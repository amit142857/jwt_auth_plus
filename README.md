# 🛡️ JWT Auth Plus

[![pub package](https://img.shields.io/pub/v/jwt_auth_plus.svg)](https://pub.dev/packages/jwt_auth_plus)
[![likes](https://img.shields.io/pub/likes/jwt_auth_plus.svg)](https://pub.dev/packages/jwt_auth_plus/score)

A high-performance, lightweight JWT management library for Flutter. Simplify your authentication flow with robust decoding, expiration tracking, and safe Base64 handling.

---

## ✨ Features

* 🚀 **Zero Dependencies:** Pure Dart implementation for maximum speed and compatibility.
* 🛠️ **Robust Decoding:** Automatically handles missing Base64 padding to prevent crashes.
* ⏱️ **Expiry Tracking:** Built-in logic to check if tokens are expired with millisecond precision.
* 🧬 **Model-Based:** Access payload data through a clean `JWTModel` rather than messy Maps.
* 🔐 **Secure-Ready:** Designed to work perfectly alongside `flutter_secure_storage`.

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  jwt_auth_plus: ^1.0.0


🛡️ JWT Auth Plus
A high-performance, lightweight JWT management library for Flutter. Simplify your authentication flow with robust decoding, expiration tracking, and safe Base64 handling.

✨ Why JWT Auth Plus?
Most JWT decoders in the Flutter ecosystem struggle with inconsistent Base64 padding or lack a structured way to handle token expiry. JWT Auth Plus is built to be a robust, "set and forget" utility for modern Flutter applications.

🚀 Zero Dependencies: Pure Dart implementation for maximum speed and compatibility.

🛠️ Robust Decoding: Automatically handles missing Base64 padding to prevent crashes.

⏱️ Expiry Tracking: Built-in logic to check if tokens are expired with millisecond precision.

🧬 Model-Based: Access payload data through a clean JWTModel rather than messy Maps.

🔐 Secure-Ready: Designed to work perfectly alongside flutter_secure_storage.

🚀 Getting Started
Add the dependency to your pubspec.yaml:

YAML
dependencies:
  jwt_auth_plus: ^1.0.0
📖 Usage
1. Decoding a Token

Turn a raw string into a structured model instantly. This method handles the Base64 "padding" issues (the == at the end of strings) automatically.

Dart
import 'package:jwt_auth_plus/jwt_auth_plus.dart';

final String rawToken = "your.jwt.token.here";

try {
  final jwt = JWTAuthPlus.decode(rawToken);
  
  print('User ID: ${jwt.userId}');
  print('Expiration: ${jwt.exp}');
  print('Is Expired: ${jwt.isExpired}');
} catch (e) {
  print('Invalid Token: $e');
}
2. Guarding Routes

Use the simple one-liner helper to validate tokens before allowing a user to see a screen.

Dart
if (JWTAuthPlus.isValid(storedToken)) {
  // Token exists and is not expired
  navigator.pushNamed('/dashboard');
} else {
  // Token is missing, malformed, or expired
  navigator.pushNamed('/login');
}
3. API Headers

Quickly generate a standard Authorization header for your dio or http requests.

Dart
final headers = JWTAuthPlus.getHeader(myToken);
// Output: {'Authorization': 'Bearer <your_token>'}

// Or customize the prefix
final customHeader = JWTAuthPlus.getHeader(myToken, prefix: 'Token');
🧬 JWTModel Anatomy
The JWTModel class makes it easy to interact with the decoded data without manually accessing Map keys.

Property	Type	Description
userId	String?	Automatically extracts the sub claim.
exp	int?	The raw expiration timestamp.
isExpired	bool	True if current time is past the exp claim.
payload	Map	The full raw payload for custom claims.
🤝 The "Plus" Ecosystem
Enhance your Flutter development with these compatible libraries:

💎 glass_morphism_plus - For premium, high-performance Glassmorphic UI.

📳 vibration_service - For professional haptic feedback.

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.