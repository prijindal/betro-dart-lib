import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:betro_dart_lib/betro_dart_lib.dart';

void main() {
  const MethodChannel channel = MethodChannel('betro_dart_lib');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BetroDartLib.platformVersion, '42');
  });
}
