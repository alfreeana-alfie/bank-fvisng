String defaultUserImage =
    "https://villasearch.de/market/resources/assets/images/user.jpg";

// API SETUP(S)
class API {
  static const Map<String, String> headers = {"Accept": "application/json"};
  static const Map<String, String> headersMultiPart = {
    "Accept": "application/json",
    "Content-Type": "multipart/form-data"
  };
  

  static Uri login = Uri.parse("http://127.0.0.1:8000/api/auth/login");
  static Uri getUserDetails = Uri.parse("http://127.0.0.1:8000/api/auth/user");
  static Uri logout = Uri.parse("http://127.0.0.1:8000/api/auth/logout");
  
  static Uri sendMoney = Uri.parse("http://127.0.0.1:8000/api/send_money");

  static Uri exchangeMoney = Uri.parse("http://127.0.0.1:8000/api/exchange_money");

  static Uri wireTransfer = Uri.parse("");

  
}
