import 'package:flutter/material.dart';
import 'package:hive_app/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(MaterialApp(home: HomeWidget()));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste SharedPreferences"),
      ),
      body: CampoTexto(),
    );
  }
}

class CampoTexto extends StatelessWidget {
  TextEditingController host = TextEditingController();
  TextEditingController api = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "host"),
            controller: host,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "api"),
            controller: api,
          ),
          BotaoSalvarWidget(
            texto: "Salvar SharedPreferences",
            onPressed: () async {
              hiveSetConfig(host.text, api.text);
            },
          ),
          BotaoSalvarWidget(
              texto: "Pegar SharedPreferences",
              onPressed: () async {
                final config = await hiveGetConfig();
                print(config);
              })
        ],
      ),
    );
  }
}

class BotaoSalvarWidget extends StatelessWidget {
  const BotaoSalvarWidget(
      {Key? key, required this.onPressed, required this.texto})
      : super(key: key);
  final String texto;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: onPressed, child: Text(texto)),
    );
  }
}
