import 'package:mobiarmy_flutter/features/authentication/domain/account_credentials.dart';

abstract interface class AccountStorage {
  Future<AccountCredentials?> load();
  Future<void> save(AccountCredentials credentials);
}

class InMemoryAccountStorage implements AccountStorage {
  AccountCredentials? _credentials;

  @override
  Future<AccountCredentials?> load() async => _credentials;

  @override
  Future<void> save(AccountCredentials credentials) async {
    _credentials = credentials;
  }
}
