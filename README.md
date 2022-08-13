# Notice
This package is a fork of the original simple_rsa package, all the credit is to their original authors.
There was also simple_rsa2 which was a fork I maintained when I used to work at DevelSystems, but since
the development of that one staled. I decided to fork it again, and bring this library back from the dead :).

# Simple RSA Encryption
Flutter plugin to encrypt, decrypt (RSA/ECB/PCSK1), verify and sign string with a public and a private key

Support for ANDROID and iOS(thanks to adlanarifzr)

## Installation

To use the plugin, add `simple_rsa3` as a
[dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Usage

First, initialize private and public key. Preferably in BASE64 format.

```
final publicKey = '...';
final privateKey = '...';
```

After that, you can encrypt or decrypt text

```
let simple_rsa3 = SimpleRsa3();
let plainText = 'something';
final encryptedText = await simple_rsa3.encryptString(plainText, utf8.decode(base64.decode(publicKey))) ?? '';
final decryptedText = await simple_rsa3.decryptString(encryptedText, utf8.decode(base64.decode(privateKey))) ?? '';

// Test
print(plainText == decryptedText ? 'true' : 'false');
```

Or you might want to sign and verify text

```
let simple_rsa3 = SimpleRsa3();
let plainText = 'something';
final signedText = await simple_rsa3.encryptString(plainText, utf8.decode(base64.decode(privateKey))) ?? '';
final verified = await simple_rsa3.verifyString(plainText, signedText, utf8.decode(base64.decode(publicKey))) ?? '';

// Test
print(verified ? 'true' : 'false');
```

### Contributions
[Adlan Arif Zakaria (adlanarifzr)](https://github.com/adlanarifzr) iOS compatibility, sign and verify method.
