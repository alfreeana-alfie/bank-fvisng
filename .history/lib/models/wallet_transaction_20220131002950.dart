import 'package:flutter_banking_app/utils/string.dart';

class WalletTransaction {
  int? id;
  String? userId, walletId, accountId, method, creditDebit, amount, createdAt, updatedBy;

  WalletTransaction(
      {this.id,
      this.userId,
      this.accountId,
      this.walletId,
      this.creditDebit,
      this.method,
      this.amount,
      this.createdAt, 
      this.updatedBy});

  factory WalletTransaction.fromMap(Map<String, dynamic> map) {
    return WalletTransaction(
      id: map[Field.id] as int?,
      userId: map[Field.userId] as String?,
      accountId: map[Field.accountId] as String?,
      method: map[Field.method] as String?,
      creditDebit: map[Field.creditDebit] as String?,
      amount: map[Field.amount] as String?,
      createdAt: map[Field.createdAt] as String?,
      updatedBy: map[Field.updatedBy] as String?,
    );
  }
}