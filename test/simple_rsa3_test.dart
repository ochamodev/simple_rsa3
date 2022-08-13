import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:simple_rsa3/simple_rsa3_method_channel.dart';
import 'package:simple_rsa3/simple_rsa3_platform_interface.dart';

class MockSimpleRsa3Platform
    with MockPlatformInterfaceMixin
    implements SimpleRsa3Platform {
  @override
  Future<String?> decryptString(String txt, String privateKey) async {
    return "hello world";
  }

  @override
  Future<String?> decryptStringWithPublicKey(
      String plainText, String signature, String publicKey) async {
    return "hello world";
  }

  @override
  Future<String?> encryptString(String txt, String publicKey) async {
    return "hello world";
  }

  @override
  Future<String?> getPlatformVersion() async {
    return "42";
  }

  @override
  Future<String?> signString(String plainText, String privateKey) async {
    return "hello world";
  }

  @override
  Future<bool?> verifyString(
      String plainText, String signature, String publicKey) async {
    return true;
  }
}

void main() {
  final SimpleRsa3Platform initialPlatform = SimpleRsa3Platform.instance;

  test('$MethodChannelSimpleRsa3 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimpleRsa3>());
  });
}
