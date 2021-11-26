import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'portofolio_event.dart';
part 'portofolio_state.dart';

class PortofolioBloc extends Bloc<PortofolioEvent, PortofolioState> {
  PortofolioBloc() : super(PortofolioInitial()) {
    on<PortofolioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
