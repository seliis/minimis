import "package:minimis/domain/index.dart" as domain;
import "package:minimis/entity/index.dart" as entity;
import "package:minimis/net/index.dart" as net;

final class AircraftRepositoryImpl extends domain.AircraftRepository {
  const AircraftRepositoryImpl({
    required this.dataSource,
  });

  final domain.DataSource<entity.Aircraft> dataSource;

  @override
  Future<net.Response<List<entity.Aircraft>>> getList() {
    return dataSource.getList();
  }
}
