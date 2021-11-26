part of 'portofolio_bloc.dart';

abstract class PortofolioEvent extends EventBloc {
  @override
  List<Object> get props => [];
}

class FetchPortofolioEvent extends PortofolioEvent {
  final String userId;
  final String locale;

  FetchPortofolioEvent({
    required this.userId,
    required this.locale,
  });
}
