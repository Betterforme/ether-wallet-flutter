import 'dart:typed_data';

import 'package:base58check/base58.dart';
import 'package:collection/collection.dart' show ListEquality;
import 'package:crypto/crypto.dart';
import 'package:eip55/eip55.dart';
import 'package:web3dart/crypto.dart';

import '../Constants.dart';

extension StringExtension on String {
  String toTronAddress() {
    final payload = hexToBytes(this);
    final Uint8List bytes = Uint8List(payload.length + 4);
    bytes.setRange(0, bytes.length - 4, payload);
    final List<int> checksum =
        sha256.convert(sha256.convert(payload).bytes).bytes;
    bytes.setRange(bytes.length - 4, bytes.length, checksum.getRange(0, 4));
    return const Base58Encoder(VISION_ALPHABET).convert(bytes);
  }

  String toEthAddress() {
    final List<int> bytes = const Base58Decoder(VISION_ALPHABET).convert(this);
    if (bytes.length < 5) {
      throw const FormatException(
          'Invalid Base58Check encoded string: must be at least size 5');
    }
    final checksum = sha256
        .convert(sha256.convert(bytes.sublist(0, bytes.length - 4)).bytes)
        .bytes;
    final providedChecksum = bytes.sublist(bytes.length - 4, bytes.length);
    if (!const ListEquality()
        .equals(providedChecksum, checksum.sublist(0, 4))) {
      throw const FormatException('Invalid checksum in Base58Check encoding.');
    }
    return '0x' +
        bytesToHex(bytes.sublist(0, bytes.length - 4))
            .replaceFirst('46', '0x')
            .eip155();
  }

  String eip155() {
    return toEIP55Address(
        bytesToHex(hexToBytes(this), include0x: false, forcePadLength: 40));
  }

  String shortAddress() {
    return substring(0, 10) + '...' + substring(length - 10, length);
  }
}
