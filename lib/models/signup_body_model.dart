class SignUpBody {
  String name;
  String phone;
  String password;
  String email;
  SignUpBody({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
  });
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['f_name'] = name;
    data['phon'] = phone;
    data['email'] = email;
    data['password'] =password;

    return data;
  }
}
