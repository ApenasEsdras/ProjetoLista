import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

import 'shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // seta pagina q o app deve iniciar
    Modular.setInitialRoute('/home/');
    // busca atraves do <watch> a mudanca de estados
    final appStore = context.watch<AppStore>(
      // filtro que cria uma lista reativa de themaModos
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode.value,
      theme: lightTheme,
      darkTheme: dartTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}