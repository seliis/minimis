import "package:minimis/net/index.dart" as net;

abstract class DataSource<T> {
  const DataSource();

  Future<net.Response<List<T>>> getList();
}
