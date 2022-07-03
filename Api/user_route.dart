import 'dart:async' show Future;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import '../Controller/usercontroller.dart';

class UserServices {
  Future<Router> get route async {
    final router = Router();

    router.post('/Login', (Request request) async {
      return await UserController.login(await request.readAsString());
    });

    router.get('/Signup/<userId|[0-9]+>', (Request request, String userId) {
      return Response.ok('User has the user-number: $userId');
    });

    router.get('/ForgotPassword', (Request request) async {
      await Future.delayed(const Duration(milliseconds: 100));
      return Response.ok('_o/');
    });

    return router;
  }
}
