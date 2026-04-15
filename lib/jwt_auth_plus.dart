/// A professional JWT authentication and management library for Flutter.
// ignore: unnecessary_library_name
library jwt_auth_plus;

import 'dart:convert';

/// A model representing the decoded JWT payload.
class JWTModel {
  /// The raw payload Map extracted from the token.
  final Map<String, dynamic> payload;

  /// Creates a [JWTModel] from a payload map.
  JWTModel(this.payload);

  /// Helper to get the expiration time (exp claim).
  int? get exp => payload['exp'] is int ? payload['exp'] : null;

  /// Helper to get the user ID (sub claim).
  String? get userId => payload['sub']?.toString();

  /// Checks if the token is currently expired based on the 'exp' claim.
  bool get isExpired {
    if (exp == null) return false;
    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp! * 1000);
    return DateTime.now().isAfter(expiryDate);
  }

  /// Access dynamic data from the payload.
  dynamic operator [](String key) => payload[key];
}

/// The main service for handling JWT operations in your application.
class JWTAuthPlus {
  /// Private constructor to prevent instantiation.
  JWTAuthPlus._();

  /// Decodes a JWT [token] and returns a [JWTModel].
  ///
  /// Throws a [FormatException] if the token is invalid.
  static JWTModel decode(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw const FormatException('Invalid JWT token format');
      }

      final payloadPart = parts[1];
      // Fix base64 padding
      String normalized = base64Url.normalize(payloadPart);
      final String resp = utf8.decode(base64Url.decode(normalized));
      final Map<String, dynamic> payload = json.decode(resp);

      return JWTModel(payload);
    } catch (e) {
      throw FormatException('Error decoding JWT: $e');
    }
  }

  /// A helper to quickly check if a token is valid and not expired.
  static bool isValid(String? token) {
    if (token == null || token.isEmpty) return false;
    try {
      return !decode(token).isExpired;
    } catch (_) {
      return false;
    }
  }

  /// Generates a standard Authorization header map.
  static Map<String, String> getHeader(
    String token, {
    String prefix = 'Bearer',
  }) {
    return {'Authorization': '$prefix $token'};
  }
}
