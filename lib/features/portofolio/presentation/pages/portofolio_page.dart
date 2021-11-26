import 'package:flutter/material.dart';
import 'package:portofolio/core/base/screen/stateful_bloc.dart';
import 'package:portofolio/features/portofolio/presentation/bloc/portofolio_bloc.dart';

class PortofolioPage extends StatefulWidget {
  static const String tag = '/';
  const PortofolioPage({Key? key}) : super(key: key);

  @override
  _PortofolioPageState createState() => _PortofolioPageState();
}

class _PortofolioPageState extends StatefulBloc<PortofolioPage, PortofolioBloc,
    PortofolioState, PortofolioEvent> {
  @override
  void initState() {
    setLog("test");
    super.initState();
  }

  @override
  Widget body() {
    return createBloc(
      child: blocConsumer(
        listener: (context, state) {
          setLog(state.toString());
          if (state is PortofolioLoadingState) {
            loading();
          } else {
            closeLoading();
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pushEvent(
                    context,
                    FetchPortofolioEvent(
                      locale: 'locale.id',
                      userId: 'ardianbagus2403@gmail.com',
                    ),
                  );
                },
                child: Text("cek"),
              ),
            ],
          );
        },
      ),
    );
  }
}
