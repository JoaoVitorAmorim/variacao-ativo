import 'package:bloc/bloc.dart';
import 'package:flutter_app/Repositories/repository.dart';

import '../Model/ativo.dart';

abstract class AtivoState {}

class Initial extends AtivoState {}

class Loading extends AtivoState {}

class Success extends AtivoState {
  final Ativo ativo;
  Success({required this.ativo});
}

class Error extends AtivoState {}

abstract class AtivoEvent {}

class GetInfo extends AtivoEvent {
  final String symbol;
  GetInfo({required this.symbol});
}

class AtivoBloc extends Bloc<AtivoEvent, AtivoState> {
  final repo = Repository();

  static AtivoBloc? _instance;
  static get instance => _instance ?? (_instance = AtivoBloc());
  AtivoBloc() : super(Initial()) {
    on<GetInfo>((getInfo));
  }

  void getInfo(
    GetInfo event,
    Emitter<AtivoState> emit,
  ) async {
    try {
      emit(Loading());
      final result = await repo.getAtivo(event.symbol);
      emit(Success(ativo: result));
    } catch (_) {
      emit(Error());
    }
  }
}
