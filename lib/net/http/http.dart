import "dart:convert";

import "package:http/http.dart" as http;

import "package:minimis/net/index.dart" as net;

final class HTTP {
  static const base = "127.0.0.1";
  static const port = 8080;

  static String get api => "http://$base:$port/api";

  static Future<net.Response<List<T>>> getList<T>(String path, Function mapper) async {
    return await http.get(Uri.parse("$api/$path")).then((response) {
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List<dynamic>;
        return net.Response.success(body.map((e) => mapper(e)).cast<T>().toList());
      } else {
        return net.Response.failure(response.reasonPhrase ?? "unknown error");
      }
    });
  }
}
