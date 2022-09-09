import 'dart:convert';

import 'package:real_free_auth/models/requests/user_register_request.dart';
import 'package:http/http.dart' as http;
import 'package:real_free_auth/models/storage/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static String apiUrl = "http://179.0.37.34:5000/api";
  static Future<Object> registerUser(UserRegisterRequest userRequest) async {
    var response = await http.post(
      Uri.parse('$apiUrl/usuario'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "nomeDoUsuario": userRequest.nomeDoUsuario as String,
        "emailDoUsuario": userRequest.emailDoUsuario as String,
        "telefoneDoUsuario": userRequest.telefoneDoUsuario as String,
        "senhaDoUsuario": userRequest.senhaDoUsuario as String,
        "responseServer": userRequest.responseServer as String,
        "telefoneDoUsuarioEWhatsapp":
            userRequest.telefoneDoUsuarioEWhatsapp as bool,
        "ddiTelefoneDoUsuario": userRequest.ddiTelefoneDoUsuario as String,
        "paisDDIDoTelefoneDoUsuario":
            userRequest.paisDDIDoTelefoneDoUsuario as String
      }),
    );
    final finalResponse = jsonDecode(response.body);
    Map<String, dynamic> result = {};
    result["result"] = finalResponse["sucesso"];
    result["message"] = finalResponse["mensagem"];
    return result;
  }

  static Future<Object> login(email, password) async {
    var response = await http.post(
      Uri.parse('${apiUrl}/autenticacao/autenticar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "emailDoUsuario": email as String,
        "senhaDoUsuario": password as String,
      }),
    );
    return jsonDecode(response.body);
  }

  static Future<bool> setUserStorage(LoggedUser user) async {
    Map<String, dynamic> userList = Map();
    userList["name"] = user.nomeDoUsuario;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString('token', user.token);
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<LoggedUser?> getUserStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userRetrieved = prefs.getString("user");

    if (userRetrieved == null) {
      return null;
    }

    Map<String, dynamic> user = Map();
    print(jsonDecode(prefs.getString("token").toString()));
    return LoggedUser.fromJson(jsonDecode(prefs.getString("token").toString()));
  }
}
