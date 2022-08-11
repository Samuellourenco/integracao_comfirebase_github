import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController mensagem = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference ref;
  @override
  void initState() {
    ref = database.ref();
    ref.onValue.listen((event) {
      if (event.snapshot.value == null) {
        return;
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: mensagem,
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: (() async {
              await ref.child('user').push().set(
                {"name": mensagem.text, "idade": 2},
              );
            }),
            //  Expanded(
            //  child: ListView.builder(itemBuilder: ((context, index) {
            //  return Container();
            //
          ),
        ],
      ),
    );
  }
}
