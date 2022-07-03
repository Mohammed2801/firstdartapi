import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../Api/user_route.dart';

void main(List<String> arguments) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(arguments);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    exitCode = 64;
    return;
  }

  var server =
      await shelf_io.serve(await ServiceRoute().route, 'localhost', 9898);
  print("Server Started");
  print('Serving at http://${server.address.host}:${server.port}');
  ServiceRoute();
}

class ServiceRoute {
  Future<Router> get route async {
    final router = Router();

    router.mount("/Users", await UserServices().route);

    return router;
  }
}
