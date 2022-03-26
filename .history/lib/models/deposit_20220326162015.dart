import 'package:flutter_banking_app/utils/string.dart';

class Deposit {
  int? id;
  String? userName,
      name,
      amount,
      fee,
      drCr,
      type,
      method,
      receiverName,
      fromAcc,
      toAcc,
      // note,
      status,
      transactionCode,
      createdAt,
      bank,
      note,
      accountNo,
      assignTo,
      attachment;

  Deposit(
      {this.id,
      this.userName,
      this.name,
      this.amount,
      this.fee,
      this.drCr,
      this.type,
      this.method,
      this.receiverName,
      this.fromAcc,
      this.toAcc,
      // this.status,
      // this.note,
      this.transactionCode,
      this.createdAt,
      this.bank,
      this.note,
      this.accountNo,
      this.assignTo,
      this.attachment});

  factory Deposit.fromMap(Map<String, dynamic> map) {
    return Deposit(
      id: map[Field.id] as int?,
      userName: map[Field.userName] as String?,
      // receiverName: map[Field.receiverName] as String?,
      fromAcc: map[Field.fromAcc] as String?,
      toAcc: map[Field.toAcc] as String?,
      name: map[Field.name] as String?,
      amount: map[Field.amount] as String?,
      fee: map[Field.fee] as String?,
      drCr: map[Field.drCr] as String?,
      type: map[Field.type] as String?,
      method: map[Field.method] as String?,
      // status: map[Field.status] as String?,
      // note: map[Field.note] as String?,
      transactionCode: map[Field.transactionCode] as String?,
      createdAt: map[Field.createdAt] as String?,
      bank: map[Field.otherBankId] as String?,
      note: map[Field.note] as String?,
      accountNo: map[Field.accountNo] as String?,
      assignTo: map[Field.assignTo] as String?,
      attachment: map[Field.attachment] as String?,
    );
  }
}
