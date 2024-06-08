import "package:minimis/net/index.dart" as net;

abstract class Repository<T> {
  const Repository();

  Future<net.Response<List<T>>> getList();
}
