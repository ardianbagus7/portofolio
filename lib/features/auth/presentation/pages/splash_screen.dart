import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portofolio/core/base/screen/stateful_bloc.dart';
import 'package:portofolio/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../injectable.dart';

class SplashScreen extends StatefulWidget {
  static const String tag = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState
    extends StatefulBloc<SplashScreen, AuthBloc, AuthState, AuthEvent> {
  @override
  void initState() {
    setLog("test");
    super.initState();
  }

  @override
  Widget body() {
    return blocConsumer(
      listener: (context, state) {
        setLog(state.toString());
        if (state is AuthLoadingState) {
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
                pushEvent(context, SilentSignInWithGoogleEvent());
              },
              child: Text("cek"),
            ),
            ElevatedButton(
              onPressed: () {
                pushEvent(context, SignInWithGoogleEvent());
              },
              child: Text("cek"),
            ),
            ElevatedButton(
              onPressed: () {
                pushEvent(context, SignoutEvent());
              },
              child: Text("cek"),
            ),
          ],
        );
      },
    );
  }
}

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.theme.backgroundColor,
//       body: BlocProvider<AuthBloc>(
//         create: (context) => getIt<AuthBloc>(),
//         child: BlocConsumer<AuthBloc, AuthState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment:MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<AuthBloc>().add(const SigninWithGoogle());
//                     },
//                     child: Text("cek"),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
