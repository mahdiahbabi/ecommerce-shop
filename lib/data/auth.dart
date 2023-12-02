

class  Auth {
  final String accessToken;
  final String refreshToken;

  Auth(this.accessToken, this.refreshToken);
  Auth.fromjson(Map<String , dynamic> element):
  accessToken = element['access_token'],
  refreshToken = element['refresh_token'];
}