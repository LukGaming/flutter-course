import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_free_auth/models/storage/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository<T> {
  static String apiUrl = "http://179.0.37.34:5000/api";
  Future<T> post(T request, String path) async {
    var response = await http.post(
      Uri.parse('$apiUrl/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request),
    );
    return jsonDecode(response.body);
  }

  static Future<void> setItemStorage(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getItemStorage(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString(key).toString();
    return response;
  }
  // static Future<Object> login(email, password) async {
  //   var response = await http.post(
  //     Uri.parse('${apiUrl}/autenticacao/autenticar'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "emailDoUsuario": email as String,
  //       "senhaDoUsuario": password as String,
  //     }),
  //   );
  //   return jsonDecode(response.body);
  // }

  // static Future<bool> setUserStorage(LoggedUser user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     prefs.setString('idDoUsuario', user.idDoUsuario.toString());
  //     prefs.setString('nomeDoUsuario', user.nomeDoUsuario.toString());
  //     prefs.setString('emailDoUsuario', user.emailDoUsuario.toString());
  //     prefs.setString('telefoneDoUsuario', user.telefoneDoUsuario.toString());
  //     prefs.setString(
  //         'statusValidacaoConta', user.statusValidacaoConta.toString());
  //     prefs.setString('token', user.token.toString());
  //     prefs.setString('tipoDoUsuario', user.tipoDoUsuario.toString());
  //     prefs.setString('emailTemporario', user.emailTemporario.toString());
  //     prefs.setString('dataExpiracaoToken', user.dataExpiracaoToken.toString());
  //     prefs.setString('refreshToken', user.refreshToken.toString());
  //     return true;
  //   } catch (_) {
  //     return false;
  //   }
  // }

  // static Future<LoggedUser?> getUserStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('idDoUsuario');
  //   if (token == null) return null;
  //   va r loggedUser = LoggedUser(
  //     idDoUsuario: int.parse(prefs.getString('idDoUsuario').toString()),
  //     nomeDoUsuario: prefs.getString('nomeDoUsuario').toString(),
  //     emailDoUsuario: prefs.getString('emailDoUsuario').toString(),
  //     telefoneDoUsuario: prefs.getString('telefoneDoUsuario').toString(),
  //     statusDoUsuario: prefs.getString('statusDoUsuario').toString(),
  //     statusValidacaoConta: prefs.getString('statusValidacaoConta').toString(),
  //     tipoDoUsuario: prefs.getString('tipoDoUsuario').toString(),
  //     perfilDoUsuario: prefs.getString('perfilDoUsuario').toString(),
  //     emailTemporario: prefs.getString('emailTemporario').toString(),
  //     token: prefs.getString('token').toString(),
  //     dataExpiracaoToken: prefs.getString('dataExpiracaoToken').toString(),
  //     refreshToken: prefs.getString('refreshToken').toString(),
  //   );
  //   return loggedUser;
  // }

  // static Future<void> removeUserStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('idDoUsuario');
  //   prefs.remove('nomeDoUsuario');
  //   prefs.remove('emailDoUsuario');
  //   prefs.remove('telefoneDoUsuario');
  //   prefs.remove('statusValidacaoConta');
  //   prefs.remove('token');
  //   prefs.remove('tipoDoUsuario');
  //   prefs.remove('emailTemporario');
  //   prefs.remove('dataExpiracaoToken');
  //   prefs.remove('refreshToken');
  // }  
}
