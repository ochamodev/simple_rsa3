#import "SimpleRsa3Plugin.h"
#if __has_include(<simple_rsa3/simple_rsa3-Swift.h>)
#import <simple_rsa3/simple_rsa3-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "simple_rsa3-Swift.h"
#endif

@implementation SimpleRsa3Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimpleRsa3Plugin registerWithRegistrar:registrar];
}
@end
