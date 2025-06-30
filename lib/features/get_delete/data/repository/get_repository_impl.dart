import 'package:registerapp/features/get_delete/data/data_sources/get_remote_data_sources.dart';
import 'package:registerapp/features/get_delete/domain/entity/get_entity.dart';
import 'package:registerapp/features/get_delete/domain/repository/get_repository.dart';

class GetRepositoryImpl implements GetRepository {
  final GetRemoteDataSource remoteDataSource;

  GetRepositoryImpl(this.remoteDataSource);

  @override
  Future<GetEntity> fetchGetData() async {
    return await remoteDataSource.fetchGetData();
  }
}
