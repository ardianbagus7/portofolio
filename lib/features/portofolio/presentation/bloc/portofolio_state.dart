part of 'portofolio_bloc.dart';

abstract class PortofolioState extends StateBloc {
  final PortofolioModel? portofolio;

  PortofolioState(this.portofolio);

  @override
  List<Object?> get props => [portofolio];
}

class PortofolioInitialState extends PortofolioState {
  PortofolioInitialState() : super(null);
}

class PortofolioLoadingState extends PortofolioState {
  final PortofolioModel? portofolioState;
  PortofolioLoadingState(this.portofolioState) : super(portofolioState);
}

class PortofolioLoadedState extends PortofolioState {
  final PortofolioModel? portofolioState;
  PortofolioLoadedState(this.portofolioState) : super(portofolioState);
}

class PortofolioFailureState extends PortofolioState {
  final String message;
  final PortofolioModel? portofolioState;
  PortofolioFailureState(this.portofolioState, {this.message = ""})
      : super(portofolioState);
}
