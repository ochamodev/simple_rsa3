import 'simple_rsa3_platform_interface.dart';

class SimpleRsa3 {
  Future<String?> getPlatformVersion() {
    return SimpleRsa3Platform.instance.getPlatformVersion();
  }

  Future<String?> encryptString(String txt, String publicKey) {
    return SimpleRsa3Platform.instance.encryptString(txt, publicKey);
  }

  Future<String?> decryptString(String txt, String privateKey) {
    return SimpleRsa3Platform.instance.decryptString(txt, privateKey);
  }

  Future<String?> signString(String plainText, String privateKey) {
    return SimpleRsa3Platform.instance.signString(plainText, privateKey);
  }

  Future<bool?> verifyString(
      String plainText, String signature, String publicKey) {
    return SimpleRsa3Platform.instance
        .verifyString(plainText, signature, publicKey);
  }

  Future<String?> decryptStringWithPublicKey(
      String plainText, String signature, String publicKey) {
    return SimpleRsa3Platform.instance
        .decryptStringWithPublicKey(plainText, signature, publicKey);
  }
}
