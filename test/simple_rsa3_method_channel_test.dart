import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_rsa3/simple_rsa3_method_channel.dart';

void main() {
  MethodChannelSimpleRsa3 platform = MethodChannelSimpleRsa3();
  const MethodChannel channel = MethodChannel('simple_rsa3');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
