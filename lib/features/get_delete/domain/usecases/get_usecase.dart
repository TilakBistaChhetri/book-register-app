import '../entity/get_entity.dart';
import '../repository/get_repository.dart';

class GetUseCase {
  final GetRepository repository;

  GetUseCase(this.repository);

  Future<GetEntity> execute() async {
    return await repository.fetchGetData();
  }
}
