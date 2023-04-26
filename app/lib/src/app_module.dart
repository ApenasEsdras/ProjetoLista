import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:realm/realm.dart';

import 'home/home_module.dart';
import 'shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  //
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        // só vai funconar se o cliente pegar o item pela classe abstrata
        AutoBind.factory<ConfigurationService>(ConfigurationServiceImpl.new),
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}