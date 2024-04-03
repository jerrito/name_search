class URL {
  static const baseURL = "api.agify.io";
  //Map<String, dynamic> queryParameters = {"name": ""};

  returnUri({
        required Map<String, dynamic>? queryParameters,

  }) {
    return Uri.http(baseURL,"/",queryParameters);
  }
}
