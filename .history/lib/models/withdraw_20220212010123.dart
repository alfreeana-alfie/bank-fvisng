import 'package:flutter_banking_app/utils/string.dart';

class Withdraw {
  int? id;
  String? name,
      bankName,
      branchName,
      swiftCode,
      accountHolderName,
      accountNo,
      accountHolderPhoneNo,
      currency,
      amount,
      approved,
      createdAt;

  Withdraw(
      {this.id,
      this.name,
      this.bankName,
      this.branchName,
      this.swiftCode,
      this.accountHolderName,
      this.accountNo,
      this.accountHolderPhoneNo,
      this.currency,
      this.amount,
      this.approved,
      this.createdAt});

  factory Withdraw.fromMap(Map<String, dynamic> map) {
    return Withdraw(
      id: map[Field.id] as int?,
      name: map[Field.name] as String?,
      bankName: map[Field.accountId] as String?,
      branchName: map[Field.walletId] as String?,
      swiftCode: map[Field.method] as String?,
      accountHolderName: map[Field.creditDebit] as String?,
      accountNo: map[Field.amount] as String?,
      accountHolderPhoneNo: map[Field.rateAmount] as String?,
      currency: map[Field.grandTotal] as String?,
      amount: map[Field.paymentMethod] as String?,
      approved: map[Field.createdAt] as String?,
      createdAt: map[Field.updatedBy] as String?,
    );
  }
}
