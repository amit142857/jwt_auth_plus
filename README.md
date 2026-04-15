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

## 📖 Usage

### 1. Decoding a Token
Turn a raw string into a structured model instantly. This method handles the Base64 "padding" issues (the `==` at the end of strings) automatically.

```dart
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