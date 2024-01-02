class ResponseModel {
 final bool _issuccess;
 final  String _message;
  ResponseModel(this._issuccess, this._message);
  //we want to use is two uotside the model so m=we made thim privet and made a geter
  String get message => _message;
  bool get isSuccess => _issuccess;
}
