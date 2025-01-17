// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Wallet extends Wallet {
  @override
  final NetworkType network;
  @override
  final String? address;
  @override
  final String? privateKey;
  @override
  final String? mnemonic;
  @override
  final String name;
  @override
  final BigInt tokenBalance;
  @override
  final BigInt ethBalance;
  @override
  final bool loading;
  @override
  final BuiltList<String>? errors;

  factory _$Wallet([void Function(WalletBuilder)? updates]) =>
      (new WalletBuilder()..update(updates))._build();

  _$Wallet._(
      {required this.network,
      this.address,
      this.privateKey,
      this.mnemonic,
      required this.name,
      required this.tokenBalance,
      required this.ethBalance,
      required this.loading,
      this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(network, r'Wallet', 'network');
    BuiltValueNullFieldError.checkNotNull(name, r'Wallet', 'name');
    BuiltValueNullFieldError.checkNotNull(
        tokenBalance, r'Wallet', 'tokenBalance');
    BuiltValueNullFieldError.checkNotNull(ethBalance, r'Wallet', 'ethBalance');
    BuiltValueNullFieldError.checkNotNull(loading, r'Wallet', 'loading');
  }

  @override
  Wallet rebuild(void Function(WalletBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletBuilder toBuilder() => new WalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Wallet &&
        network == other.network &&
        address == other.address &&
        privateKey == other.privateKey &&
        mnemonic == other.mnemonic &&
        name == other.name &&
        tokenBalance == other.tokenBalance &&
        ethBalance == other.ethBalance &&
        loading == other.loading &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, network.hashCode), address.hashCode),
                                privateKey.hashCode),
                            mnemonic.hashCode),
                        name.hashCode),
                    tokenBalance.hashCode),
                ethBalance.hashCode),
            loading.hashCode),
        errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Wallet')
          ..add('network', network)
          ..add('address', address)
          ..add('privateKey', privateKey)
          ..add('mnemonic', mnemonic)
          ..add('name', name)
          ..add('tokenBalance', tokenBalance)
          ..add('ethBalance', ethBalance)
          ..add('loading', loading)
          ..add('errors', errors))
        .toString();
  }
}

class WalletBuilder implements Builder<Wallet, WalletBuilder> {
  _$Wallet? _$v;

  NetworkType? _network;
  NetworkType? get network => _$this._network;
  set network(NetworkType? network) => _$this._network = network;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _privateKey;
  String? get privateKey => _$this._privateKey;
  set privateKey(String? privateKey) => _$this._privateKey = privateKey;

  String? _mnemonic;
  String? get mnemonic => _$this._mnemonic;
  set mnemonic(String? mnemonic) => _$this._mnemonic = mnemonic;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  BigInt? _tokenBalance;
  BigInt? get tokenBalance => _$this._tokenBalance;
  set tokenBalance(BigInt? tokenBalance) => _$this._tokenBalance = tokenBalance;

  BigInt? _ethBalance;
  BigInt? get ethBalance => _$this._ethBalance;
  set ethBalance(BigInt? ethBalance) => _$this._ethBalance = ethBalance;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(ListBuilder<String>? errors) => _$this._errors = errors;

  WalletBuilder();

  WalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _network = $v.network;
      _address = $v.address;
      _privateKey = $v.privateKey;
      _mnemonic = $v.mnemonic;
      _name = $v.name;
      _tokenBalance = $v.tokenBalance;
      _ethBalance = $v.ethBalance;
      _loading = $v.loading;
      _errors = $v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Wallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Wallet;
  }

  @override
  void update(void Function(WalletBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Wallet build() => _build();

  _$Wallet _build() {
    _$Wallet _$result;
    try {
      _$result = _$v ??
          new _$Wallet._(
              network: BuiltValueNullFieldError.checkNotNull(
                  network, r'Wallet', 'network'),
              address: address,
              privateKey: privateKey,
              mnemonic: mnemonic,
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Wallet', 'name'),
              tokenBalance: BuiltValueNullFieldError.checkNotNull(
                  tokenBalance, r'Wallet', 'tokenBalance'),
              ethBalance: BuiltValueNullFieldError.checkNotNull(
                  ethBalance, r'Wallet', 'ethBalance'),
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'Wallet', 'loading'),
              errors: _errors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Wallet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
