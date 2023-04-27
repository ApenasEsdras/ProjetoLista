import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // faz apenas a leitura das modificacoes da pagina appStore
    final appStore = context.read<AppStore>();
    // retorno
    final syncDate = context.select(() => appStore.syncDate);

    // coloar texto automatico na data
    var syncDateText = 'Nunca';
    // para isso funcionar precisamos do pacote ( flutter pub add intl)
    if (syncDate != null) {
      // contruindo modelo de formatacao = hora e data
      final format = DateFormat('dd/MM/yyy ás hh:mm');
      // inserindo
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          // essa bix está aq pq o rom não seta width e isso buga,
          //dai temso q addc um width.
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                Text(
                  // chamada da data
                  syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
