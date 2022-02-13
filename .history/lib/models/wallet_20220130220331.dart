import 'package:flutter_banking_app/utils/string.dart';

class Wallet {
  int? id;
  String? userId, accountId, amount, description;

  Wallet(
      {this.id,
      this.userId,
      this.accountId,
      this.amount, 
      this.description});

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map[Field.id] as int?,
      userId: map[Field.userId] as String?,
      accountId: map[Field.accountId] as String?,
      description: map[Field.description] as String?,
      amount: map[Field.amount] as String?,
    );
  }

  Wallet.fromJSON(Map<String, dynamic> json)
      : id = json[Field.id][Field.id],
        userId = json[Field.id][Field.userId],
        accountId = json[Field.id][Field.accountId],
        description = json[Field.id][Field.description],
        amount = json[Field.id][Field.amount];
}