// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class UserLogin {
//   final String gmail;
//   final String password;

//   UserLogin({required this.gmail, required this.password});

//   factory UserLogin.fromJson(Map<String, dynamic> json) {
//     return UserLogin(gmail: json['email'], password: json['password']);
//   }
// }

// // @override
// // void initState() {
// //   super.initState();
// //   getData();
// // }

// // Get API request

// Future<UserLogin> getData() async {
//   var url = "uri link is passed here";
//   final response = await http.get(Uri.parse(url));

//   try {
//     if (response.body == 200) {
//       return UserLogin.fromJson(jsonDecode(response.body));
//     }
//   } catch (e) {
//     print("Error message is: $e");
//   }
// }

// // POST API request

// Future<UserLogin> createPost(String title, String body, String userId) async {
//   Map<String, dynamic> request = {
//     'title': title,
//     'body': body,
//     'userId': userId
//   };

//   var url = "Link here ";
//   final response = await http.post(Uri.parse(url), body: request);
//   try {
//     if (response.body == 201) {
//       return UserLogin.fromJson(JsonDecoder(response.body));
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// // UPDATE API request

// Future<UserLogin> updatePost(String title, String body, String userId) async {
//   Map<String, dynamic> request = {
//     'title': title,
//     'body': body,
//     'userId': userId
//   };

//   var url = "Link here ";
//   final response = await http.put(Uri.parse(url), body: request);
//   try {
//     if (response.body == 200) {
//       return UserLogin.fromJson(JsonDecoder(response.body));
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// // DELETE API request

// Future<UserLogin?>? deletePost(String title, String body, String userId) async {
//   var url = "Link here ";
//   final response = await http.delete(Uri.parse(url));
//   try {
//     if (response.body == 201) {
//       return null;
//     }
//   } catch (e) {
//     print(e);
//   }
// }
