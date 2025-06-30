import '../entity/get_entity.dart';

abstract class GetRepository {
  Future<GetEntity> fetchGetData();
}
