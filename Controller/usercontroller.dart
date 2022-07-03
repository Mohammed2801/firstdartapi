import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../Model/baseresponsemodel.dart';
import '../Model/user_routing_model.dart';

class UserController {
  static List<UserRecord> userdata = [
    UserRecord(id: 1, name: "Mohammed", password: "Bakali", token: ""),
    UserRecord(id: 2, name: "Saad", password: "Raza", token: ""),
    UserRecord(id: 1, name: "Tanvir", password: "Khan", token: ""),
  ];

  static Future<Response> userInformation() async {
    try {
      return Response.ok(
        jsonEncode(
          BaseResponceModel(
            status: false,
            isActive: false,
            message: "name",
            data: null,
          ).toJson(),
        ),
        headers: {'Content-type': 'application/json'},
      );
    } catch (e) {
      return Response.ok(
        jsonEncode({'success': true, 'data': e.toString()}),
        headers: {'Content-type': 'application/json'},
      );
    }
  }

  static Future<Response> login(String input) async {
    try {
      BaseResponceModel res = BaseResponceModel();
      LoginInputModel inputModel = LoginInputModel.fromJson(jsonDecode(input));
      if ((inputModel.username ?? "").isEmpty &&
          (inputModel.username ?? "").isEmpty) {
        res.status = false;
        res.isActive = false;
        res.message = "Username or Password required.";
        res.data = null;
      } else if ((inputModel.username ?? "").isEmpty) {
        res.status = false;
        res.isActive = false;
        res.message = "Username or Email required.";
        res.data = null;
      } else if ((inputModel.password ?? "").isEmpty) {
        res.status = false;
        res.isActive = false;
        res.message = "Password required.";
        res.data = null;
      } else {
        //For extract id to token
        // var user = userdata
        //     .where((element) => element.name == inputModel.username)
        //     .first
        //     .id;
        // final jwt = JWT(
        //   {
        //     'id': user,
        //     'server': {
        //       'id': 'Mohammed',
        //       'loc': 'Surat',
        //     }
        //   },
        //   issuer: 'Mohammed_bakali',
        // );

        // // Sign it (default with HS256 algorithm)
        // var token = jwt.sign(SecretKey('secret passphrase'));

        // res.data = token;

        //For Extract token to ID
        // final jwt = JWT.verify(
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwic2VydmVyIjp7ImlkIjoiTW9oYW1tZWQiLCJsb2MiOiJTdXJhdCJ9LCJpYXQiOjE2NTY1MjU5NzIsImlzcyI6Ik1vaGFtbWVkX2Jha2FsaSJ9.djqZX4i5d-2Jp9hfkq7WNI0bbDA0_9_JY6fPi1BJo2E",
        //     SecretKey('secret passphrase'));

        // print('Payload: ${jwt.payload}');
      }
      return Response.ok(
        jsonEncode(
          res.toJson(),
        ),
        headers: {'Content-type': 'application/json'},
      );
    } catch (e) {
      return Response.ok(
        jsonEncode({'success': true, 'data': e.toString()}),
        headers: {'Content-type': 'application/json'},
      );
    }
  }
}

class UserRecord {
  int id = 0;
  String? name;
  String? password;
  String? token;

  UserRecord({
    this.id = 0,
    this.name,
    this.password,
    this.token,
  });
}
