// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:typed_data';

import 'package:base58check/base58.dart';
import 'package:base58check/base58check.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:etherwallet/Constants.dart';
import 'package:etherwallet/ext/String.dart';
import 'package:etherwallet/service/address_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web3dart/crypto.dart';

import 'configuration_service_mock.dart';

void main() {
  test('should return private key from mnemonic', () async {
    // final config = ConfigServiceMock();
    // final addressService = AddressService(config);
    //
    // final privateKey = await addressService.getPrivateKey(
    //     'loan absorb orange crouch mixed position sweet law ghost habit upgrade toss');
    // expect(privateKey,
    //     '02e41a913e0d109672c9122c96f0715ef62746aabe186a8160bca314acaa3178');
    // final first = sha256.convert(hexToBytes('0x46c26b24cfdf845b198207c3d2202cb0a7799c1690')).bytes;
    // final second = sha256.convert(first).bytes;
    // final third = <int>[];
    // third.addAll(first);
    // third.addAll(second.sublist(0,4));
    // // print(const Base58CheckEncoder(VISION_ALPHABET).convert(Base58CheckPayload(0,third)));
    // // print(const Base58CheckEncoder(VISION_ALPHABET).convert(Base58CheckPayload(0,first)));
    // // print(Base58Encoder(VISION_ALPHABET).convert(third));
    // print(const Base58CheckEncoder(VISION_ALPHABET).convert(Base58CheckPayload(0,hexToBytes('0x46c26b24cfdf845b198207c3d2202cb0a7799c1690'))));
    // final payload = hexToBytes('0x46c26b24cfdf845b198207c3d2202cb0a7799c1690');
    // Uint8List bytes = new Uint8List(payload.length  + 4);
    // bytes.setRange(0, bytes.length - 4, payload);
    // List<int> checksum = _hash(hexToBytes('0x46c26b24cfdf845b198207c3d2202cb0a7799c1690'));
    // bytes.setRange(bytes.length - 4, bytes.length, checksum.getRange(0, 4));
    // print(Base58Encoder(VISION_ALPHABET).convert(bytes));
    print("0x46c26b24cfdf845b198207c3d2202cb0a7799c1690".toTronAddress());
    print("VUPDNJGbczJ6oBZN5wrBPnjCbeYS82UpSW".toEthAddress());
  });
}
