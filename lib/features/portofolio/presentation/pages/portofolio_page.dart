import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio/core/base/screen/stateful_bloc.dart';
import 'package:portofolio/features/portofolio/data/models/hero_model.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';
import 'package:portofolio/features/portofolio/data/models/template_model.dart';
import 'package:portofolio/features/portofolio/presentation/bloc/portofolio_bloc.dart';
import 'package:portofolio/features/portofolio/presentation/templates/hero_1/hero_1_widget.dart';

class PortofolioPage extends StatefulWidget {
  static const String tag = '/id';
  const PortofolioPage({Key? key}) : super(key: key);

  @override
  _PortofolioPageState createState() => _PortofolioPageState();
}

class _PortofolioPageState extends StatefulBloc<PortofolioPage, PortofolioBloc,
    PortofolioState, PortofolioEvent> {
  String userId = "";
  @override
  void initState() {
    userId = Get.parameters["user"] ?? "";
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: createBloc(
        event: FetchPortofolioEvent(
          locale: 'locale.id',
          userId: userId,
        ),
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
            PortofolioModel? portofolio = state.portofolio;
            bool isLoading = state is PortofolioLoadingState;

            if (portofolio != null) {
              List<TemplateModel> templates = [];

              for (var element in portofolio.templates) {
                templates.add(element as TemplateModel);
              }

              return SingleChildScrollView(
                child: bodyConstraints(
                  child: Column(
                    children: templates.map((template) {
                      setLog(template.toJson(), log: "Portofolio Loaded ==>");
                      if (template.id == Hero1Widget.templateId) {
                        HeroModel hero = HeroModel.fromJson(template.meta);
                        return Hero1Widget(hero);
                      }

                      return const SizedBox();
                    }).toList(),
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pushEvent(
                        FetchPortofolioEvent(
                          locale: 'locale.id',
                          userId: 'ardianbagus2403@gmail.com',
                        ),
                      );
                    },
                    child: Text("cek"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
