import "package:minimis/domain/repository/repository.dart";

import "package:minimis/entity/index.dart" as entity;
import "package:minimis/net/index.dart" as net;

abstract class AircraftRepository extends Repository<entity.Aircraft> {
  const AircraftRepository();

  @override
  Future<net.Response<List<entity.Aircraft>>> getList();
}
