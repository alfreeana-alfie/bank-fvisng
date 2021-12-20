String defaultUserImage =
    'https://villasearch.de/market/resources/assets/images/user.jpg';

// Header Settings
const Map<String, String> headers = {'Accept': 'application/json'};
const Map<String, String> headersMultiPart = {
  'Accept': 'application/json',
  'Content-Type': 'multipart/form-data'
};

String android = 'http://10.0.2.2:8000/api';
String iod = 'http://127.0.0.1:8000/api/';

// API SETUP(S)
class API {
  // User authorizations
  static Uri login = Uri.parse('$android/auth/login');
  static Uri getUserDetails = Uri.parse('$android/auth/user');
  static Uri logout = Uri.parse('$android/auth/logout');

  // Send Money
  static Uri sendMoney = Uri.parse('$android/send_money');
  static Uri listOfSendMoney =
      Uri.parse('$android/list_of_send_money');
  static Uri userSendMoneyList =
      Uri.parse('$android/user_send_money_list/');

  // Exchange Money
  static Uri exchangeMoney =
      Uri.parse('$android/exchange_money');
  static Uri listOfExchangeMoney =
      Uri.parse('$android/list_of_exchange_money');
  static Uri userExchangeMoneyList = Uri.parse('');

  // Wire Transfer
  static Uri wireTransfer =
      Uri.parse('$android/wire_transfer');
  static Uri listOfWireTransfer =
      Uri.parse('$android/list_of_wire_transfer');
  static Uri userWireTransferList = Uri.parse('');

  // Payment Request
  static Uri paymentRequest =
      Uri.parse('$android/payment_request');
  static Uri listOfPaymentRequest =
      Uri.parse('$android/list_of_payment_request');
  static Uri userPaymentRequestList =
      Uri.parse('$android/user_payment_request_list/');

  // Loan Request
  static Uri loanRequest = Uri.parse('$android/loan_request');
  static Uri listOfLoanRequest =
      Uri.parse('$android/list_of_loan_request');
  static Uri userLoanRequestList =
      Uri.parse('$android/user_loan_request_list/');

  // Fixed Deposit
  static Uri fixedDeposit =
      Uri.parse('$android/fixed_deposit');
  static Uri listOfFixedDeposit =
      Uri.parse('$android/list_of_fixed_deposit');
  static Uri userFixedDepositList =
      Uri.parse('$android/user_fixed_deposit_list/');

  // Drop Down List(s)
  static Uri listOfCurrency =
      Uri.parse('$android/list_of_currency');
  static Uri listofFdrPlans =
      Uri.parse('$android/list_of_fdr_plans');
  static Uri listofUsers = Uri.parse('$android/users');
}



class AdminAPI {
  // Deposit
  static Uri listOfDeposit = Uri.parse('$android/create_deposit');
  static Uri createDeposit =
      Uri.parse('$android/list_of_deposit');

  // Users
  static Uri listOfUser = Uri.parse('$android/users');
  static Uri createUser = Uri.parse('$android/create_user');

  // Wire Transfer
  static Uri listOfWireTransfer =
      Uri.parse('$android/list_of_wire_transfer');
  static Uri createWireTransfer =
      Uri.parse('$android/wire_transfer');
  static Uri updateWireTransferStatus =
      Uri.parse('$android/update_status/');

  // Loan Product
  static Uri listOfLoanProduct =
      Uri.parse('$android/list_of_loan_request');
  static Uri createLoanProduct =
      Uri.parse('$android/loan_product');
  static Uri updateLoanProductStatus =
      Uri.parse('$android/user_loan_request_list/');

  // FDR Packages
  static Uri listOfFdrPackage =
      Uri.parse('$android/list_of_fdr_plans');
  static Uri createFdrPackage = Uri.parse('$android/fdr_plan');
  static Uri updateFdrPackageStatus =
      Uri.parse('$android/fdr_update_status/');

  // Branch
  static Uri listOfBranch =
      Uri.parse('$android/list_of_branches');
  static Uri createBranch = Uri.parse('$android/branch');

  // Other Banks
  static Uri listOfOtherBank =
      Uri.parse('$android/list_of_other_banks');
  static Uri createOtherBank =
      Uri.parse('$android/other_bank');
  static Uri updateOtherBankStatus = Uri.parse('$android/update_other_bank/');

  // Currency
  static Uri listOfCurrency = Uri.parse('$android/list_of_currency');
  static Uri createCurrency = Uri.parse('$android/currency');
  static Uri updateCurrencyStatus =
      Uri.parse('$android/update_currency_status/');
}
