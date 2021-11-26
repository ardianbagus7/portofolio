import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/base/bloc/base_bloc.dart';
import 'package:portofolio/core/base/bloc/event_bloc.dart';
import 'package:portofolio/core/base/bloc/state_bloc.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';
import 'package:portofolio/features/portofolio/domain/usecases/fetch_portofolio.dart';

part 'portofolio_event.dart';
part 'portofolio_state.dart';

@injectable
class PortofolioBloc extends BaseBloc<PortofolioEvent, PortofolioState> {
  final FetchPortofolioUseCase fetchPortofolio;
  PortofolioBloc(this.fetchPortofolio) : super(PortofolioInitialState()) {
    on<FetchPortofolioEvent>((event, emit) => _fetchPortofolio(event, emit));
  }

  void _fetchPortofolio(
      FetchPortofolioEvent event, Emitter<PortofolioState> emit) async {
    emit(PortofolioLoadingState(state.portofolio));

    final _data = await fetchPortofolio.call(Params(
      locale: event.locale,
      userId: event.userId,
    ));

    _data.fold(
      (l) {
        if (l is DocumentNotExistFailure) {
          emit(PortofolioNotExistState(
            state.portofolio,
            message: l.message,
          ));
        } else {
          emit(PortofolioFailureState(
            state.portofolio,
            message: l.message,
          ));
        }
      },
      (r) => emit(PortofolioLoadedState(r)),
    );
  }
}
