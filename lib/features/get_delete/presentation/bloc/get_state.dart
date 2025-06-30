import '../../domain/entity/get_entity.dart';

abstract class GetState {}

class GetInitial extends GetState {}

class GetLoading extends GetState {}

class GetLoaded extends GetState {
  final GetEntity data;

  GetLoaded(this.data);
}

class GetError extends GetState {
  final String message;

  GetError(this.message);
}
