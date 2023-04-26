import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  // savar os dados
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  // contrutor
  AppStore(this._configurationService) {
    init();
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  // sincronizar a data iniciando null
  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  //
  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
