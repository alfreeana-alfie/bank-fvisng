class Token {
  String token;

  Token(this.token);

  Token.fromJSON(Map<String, dynamic> json) : token = json['access_token'];
}

class  {
  String token;

  Message(this.token);

  Message.fromJSON(Map<String, dynamic> json) : token = json['access_token'];
}
