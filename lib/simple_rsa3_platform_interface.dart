import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simple_rsa3_method_channel.dart';

abstract class SimpleRsa3Platform extends PlatformInterface {
  /// Constructs a SimpleRsa3Platform.
  SimpleRsa3Platform() : super(token: _token);

  static final Object _token = Object();

  static SimpleRsa3Platform _instance = MethodChannelSimpleRsa3();

  /// The default instance of [SimpleRsa3Platform] to use.
  ///
  /// Defaults to [MethodChannelSimpleRsa3].
  static SimpleRsa3Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimpleRsa3Platform] when
  /// they register themselves.
  static set instance(SimpleRsa3Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> encryptString(String txt, String publicKey);

  Future<String?> decryptString(String txt, String privateKey);

  Future<String?> signString(String plainText, String privateKey);

  Future<bool?> verifyString(
      String plainText, String signature, String publicKey);

  Future<String?> decryptStringWithPublicKey(
      String plainText, String signature, String publicKey);
}
