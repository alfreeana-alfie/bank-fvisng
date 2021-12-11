String defaultUserImage =
    "https://villasearch.de/market/resources/assets/images/user.jpg";

class API {
  // API SETUP(S)
  static const Map<String, String> headers = {"Accept": "application/json"};
  static const Map<String, String> headersMultiPart = {
    "Accept": "application/json",
    "Content-Type": "multipart/form-data"
  };

  static Uri loginUrl = Uri.parse("http://127.0.0.1:8001/api/auth/login");
  static Uri getUser = Uri.parse("http://127.0.0.1:8001/api/auth/login");
  
  Uri registerUrl =
      Uri.parse("https://villasearch.de/market/public/api/user/regsiter");
  Uri forgotPasswordUrl =
      Uri.parse("https://villasearch.de/market/public/api/user/forgot");
  Uri registerSellerUrl =
      Uri.parse("https://villasearch.de/market/public/api/user/seller/store");
  Uri getUserDetailsUrl =
      Uri.parse("https://villasearch.de/market/public/api/user/show/");
}
