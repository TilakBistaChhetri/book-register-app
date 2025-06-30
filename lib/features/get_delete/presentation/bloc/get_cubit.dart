import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_state.dart';
import '../../domain/usecases/get_usecase.dart';

class GetCubit extends Cubit<GetState> {
  final GetUseCase getUseCase;

  GetCubit(this.getUseCase) : super(GetInitial());

  void fetchData() async {
    emit(GetLoading());
    try {
      final data = await getUseCase.execute();
      emit(GetLoaded(data));
    } catch (e) {
      emit(GetError(e.toString()));
    }
  }
}
