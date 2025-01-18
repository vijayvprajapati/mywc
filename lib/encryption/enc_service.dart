// import 'dart:convert';
//
// import 'package:crypto/crypto.dart';
// import 'package:encrypt/encrypt.dart';
//
// class EncService {
//   final String aesKey;
//
//   late Key key; //32 chars
//   late IV iv; //16 chars
//
//   EncService({required this.aesKey}) {
//     // data being hashed
//     final bytes = utf8.encode(aesKey);
//
//     // Generate Key Hash using generateSHA256 Algorithm
//     final hashKey = sha256.convert(bytes);
//
//     // copy first 32 bits of hash key to key
//     key = Key.fromUtf8("$hashKey".substring(0, 32));
//
//     // copy first 16 bits of plain key to iv
//     iv = IV.fromUtf8(aesKey.substring(0, 16));
//   }
//
//   /// encrypt API parameters
//   /// [text] takes api parameters
//   /// returns [String] of api parameters with encryption
//   String encrypt(String text) {
//     final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//     final encrypted = encrypter.encrypt(text, iv: iv);
//     return encrypted.base64;
//   }
//
//   /// decrypt response
//   /// [textInput] takes as input of api response
//   /// returns [String] of api response
//   String decrypt(String textInput) {
//     final text = textInput.replaceAll('"', "");
//     final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//     final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
//     return decrypted;
//   }
// }
