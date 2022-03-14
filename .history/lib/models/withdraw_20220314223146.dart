import 'package:flutter_banking_app/utils/string.dart';

class Withdraw {
  int? id;
  String? transactionCode, name,
      bankName,
      branchName,
      swiftCode,
      accountHolderName,
      accountNo,
      accountHolderPhoneNo,
      currency,
      amount,
      approved,
      purpose,
      createdAt;

  Withdraw(
      {this.id,
      this.transactionCode,
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
      transactionCode: map[Field.transactionCode] as String?,
      name: map[Field.name] as String?,
      bankName: map[Field.bankName] as String?,
      branchName: map[Field.branchName] as String?,
      swiftCode: map[Field.swiftCode] as String?,
      accountHolderName: map[Field.accountHolderName] as String?,
      accountNo: map[Field.accountNo] as String?,
      accountHolderPhoneNo: map[Field.accountHolderPhoneNo] as String?,
      currency: map[Field.currency] as String?,
      amount: map[Field.amount] as String?,
      approved: map[Field.approved] as String?,
      createdAt: map[Field.createdAt] as String?,
    );
  }
}