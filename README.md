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

📖 Usage
1. Decoding a Token
Turn a raw string into a structured model instantly. This method handles Base64 padding issues automatically.
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
Use a simple helper to validate tokens before navigation.
if (JWTAuthPlus.isValid(storedToken)) {
  navigator.pushNamed('/dashboard');
} else {
  navigator.pushNamed('/login');
}
3. API Headers
Generate Authorization headers بسهولة.
final headers = JWTAuthPlus.getHeader(myToken);

// {'Authorization': 'Bearer <your_token>'}

final customHeader = JWTAuthPlus.getHeader(
  myToken,
  prefix: 'Token',
);
🧬 JWTModel Anatomy
Property	Type	Description
userId	String?	Automatically extracts the sub claim
exp	int?	Raw expiration timestamp
isExpired	bool	True if current time is past exp
payload	Map	Full raw payload for custom claims
🤝 The "Plus" Ecosystem
Enhance your Flutter development with compatible libraries:
💎 glass_morphism_plus – Premium glassmorphic UI
📳 vibration_service – Professional haptic feedback
📝 License
This project is licensed under the MIT License.

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  jwt_auth_plus: ^1.0.0