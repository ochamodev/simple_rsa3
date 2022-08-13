import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simple_rsa3_platform_interface.dart';

/// An implementation of [SimpleRsa3Platform] that uses method channels.
class MethodChannelSimpleRsa3 extends SimpleRsa3Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simple_rsa3');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> encryptString(String txt, String publicKey) async {
    try {
      publicKey = publicKey
          .replaceAll("-----BEGIN PUBLIC KEY-----", "")
          .replaceAll("-----END PUBLIC KEY-----", "");
      final result = await methodChannel.invokeMethod<String>(
          'encrypt', {"txt": txt, "publicKey": publicKey});
      return result;
    } on PlatformException catch (e) {
      throw "Failed to get string encoded: '${e.message}'.";
    }
  }

  @override
  Future<String?> decryptString(String txt, String privateKey) async {
    try {
      privateKey = privateKey
          .replaceAll("-----BEGIN PRIVATE KEY-----", "")
          .replaceAll("-----END PRIVATE KEY-----", "");
      privateKey = privateKey
          .replaceAll("-----BEGIN RSA PRIVATE KEY-----", "")
          .replaceAll("-----END RSA PRIVATE KEY-----", "");
      final String result = await methodChannel
          .invokeMethod('decrypt', {"txt": txt, "privateKey": privateKey});
      return result;
    } on PlatformException catch (e) {
      throw "Failed decoded string: '${e.message}'.";
    }
  }

  @override
  Future<String> signString(String plainText, String privateKey) async {
    try {
      privateKey = privateKey
          .replaceAll("-----BEGIN PRIVATE KEY-----", "")
          .replaceAll("-----END PRIVATE KEY-----", "");
      privateKey = privateKey
          .replaceAll("-----BEGIN RSA PRIVATE KEY-----", "")
          .replaceAll("-----END RSA PRIVATE KEY-----", "");
      final String result = await methodChannel.invokeMethod(
          'sign', {"plainText": plainText, "privateKey": privateKey});
      return result;
    } on PlatformException catch (e) {
      throw "Failed decoded string: '${e.message}'.";
    }
  }

  @override
  Future<bool> verifyString(
      String plainText, String signature, String publicKey) async {
    try {
      publicKey = publicKey
          .replaceAll("-----BEGIN PUBLIC KEY-----", "")
          .replaceAll("-----END PUBLIC KEY-----", "");
      final bool result = await methodChannel.invokeMethod('verify', {
        "plainText": plainText,
        "signature": signature,
        "publicKey": publicKey
      });
      return result;
    } on PlatformException catch (e) {
      throw "Failed decoded string: '${e.message}'.";
    }
  }

  @override
  Future<String?> decryptStringWithPublicKey(
      String plainText, String signature, String publicKey) async {
    try {
      publicKey = publicKey
          .replaceAll("-----BEGIN PUBLIC KEY-----", "")
          .replaceAll("-----END PUBLIC KEY-----", "");
      final String result = await methodChannel.invokeMethod(
          'decryptWithPublicKey',
          {"plainText": plainText, "publicKey": publicKey});
      return result;
    } on PlatformException catch (e) {
      throw "Failed decoded string: '${e.message}'.";
    }
  }
}
