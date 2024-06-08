import "package:minimis/domain/index.dart" as domain;
import "package:minimis/entity/index.dart" as entity;
import "package:minimis/net/index.dart" as net;

final class AircraftDataSource extends domain.DataSource<entity.Aircraft> {
  const AircraftDataSource();

  @override
  Future<net.Response<List<entity.Aircraft>>> getList() async {
    return await net.HTTP.getList<entity.Aircraft>("aircrafts", entity.Aircraft.fromJson);
  }
}
