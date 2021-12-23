import 'package:flutter_banking_app/utils/string.dart';

class PaymentRequest {
  String? currencyName,
      amount,
      status,
      description,
      senderName,
      receiverName,
      transactionId,
      branchId, 
      createdAt;

  PaymentRequest(
      {
      this.currencyName,
      this.amount,
      this.status,
      this.description,
      this.senderId,
      this.senderName,
      this.receiverName,
      this.transactionId,
      this.branchId,
      this.createdAt});

  factory PaymentRequest.fromMap(Map<String, dynamic> map) {
    return PaymentRequest(
      currencyName: [Field.currencyName] as String?,
      amount: [Field.amount] as String?,
      status: [Field.status] as int?,
      description: [Field.description] as String?,
      senderId: [Field.senderId] as String?,
      senderName: [Field.senderName] as String?,
      receiverName: [Field.receiverName] as String?,
      transactionId: [Field.transactionId] as String?,
      branchId: [Field.branchId] as int?,
      createdAt: [Field.createdAt] as String?,
    );
  }
}