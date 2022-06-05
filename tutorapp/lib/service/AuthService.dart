// import 'dart:_http';
// import 'dart:convert';

// import 'package:http/http.dart';

// import '../registration/Model/userModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthServiceImpl  {
  
//   final HttpClient httpClient;
//   final SharedPreferences sharedPreferences;

//   AuthServiceImpl({
//     required this.httpClient,
    
//   });

//   @override
//   Future<User> signIn({
//     required String username,
//     required String password,
//   }) async {
//     String body = jsonEncode({
//       "userName": username,
//       "password": password,
//     });

//     Response response = await httpClient.post("/auth/signin", body);

//     if (response.statusCode == 200) {
//       var jsonDecoded = jsonDecode(response.body);
//       User userModel = User.fromJson(jsonDecoded);
//       sharedPreferences.setString("token", userModel.accessToken);
//       return userModel;
//     } else {
//       var jsonDecoded = jsonDecode(response.body);
//       print(jsonDecoded);
//       throw Exception("Error");
//     }
//   }

//   @override
//   Future<String> signUp({
//     required String username,
//     required String email,
//     required String password,
//   }) async {
//     String body = jsonEncode({
//       "userName": username,
//       "email": email,
//       "password": password,
//     });

//     Response response = await httpClient.post("/auth/signup", body);

//     if (response.statusCode == 200) {
//       dynamic jsonDecoded = jsonDecode(response.body);
//       return response.body;
//     } else {
//       print(response.body);
//       throw Exception("Error");
//     }
//   }
// }