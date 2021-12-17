import 'package:flutter_banking_app/utils/string.dart';

class Loan {
  int? id;
  String? loanId,
      loanProductId,
      borrowerId,
      firstPaymentDate,
      releaseDate,
      currencyId,
      appliedAmount,
      totalPayable,
      totalPaid,
      latePaymentPenalty,
      attachment,
      description,
      remarks,
      status,
      approvedDate,
      approvedUserId,
      createdUserId,
      branchId;
  
  Loan({
    this.id, 
    this.loanId,
    this.loanProductId,
    this.borrowerId,
    this.firstPaymentDate,
    this.releaseDate,
    this.currencyId,
    this.appliedAmount,
    this.totalPayable,
    this.totalPaid,
    this.latePaymentPenalty,
    this.attachment, 
    this.description,
    this.remarks, 
    this.status,
    this.approvedDate, 
    this.approvedUserId,
    this.createdUserId, 
    this.branchId
  });

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      id: map[Field.data][Field.id] as int?,
      loanId: map[Field.data]['loan_id'] as String,
      loanProductId: map[Field.data]['loan_product_id'] as String,
      borrowerId: map[Field.data]['borrower_id'] as String,
      firstPaymentDate: map[Field.data]['first_payment_date'] as String,
      releaseDate: map[Field.data]['release_date'] as String,
      currencyId : map[Field.data]['currency_id'] as String,
      appliedAmount: map[Field.data]['applied_amount'] as String,
      totalPayable: map[Field.data]['total_payable'] as String,
      totalPaid: map[Field.data]['total_paid'] as String,
      latePaymentPenalty: map[Field.data]['late_payment_penalties'] as String,
      attachment: map[Field.data]['attachment'] as String,
      description: map[Field.data]['description'] as String,
      remarks: map[Field.data]['remarks'] as String,
      status: map[Field.data]['status'] as String,
      approvedDate: map[Field.data]['approved_date'] as String,
      approvedUserId: map[Field.data]['approved_user_id'] as String,
      createdUserId: map[Field.data]['created_user_id'] as String,
      branchId: map[Field.data]['branch_id'] as String,
    );
  }
}