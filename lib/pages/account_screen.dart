// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/models/user_model.dart';

enum MenuItem { item1, item2 }

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser;
  bool isHiddenPassword = true;
  TextEditingController firstNameTextInputController = TextEditingController();
  TextEditingController secondNameTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameTextInputController.dispose();
    secondNameTextInputController.dispose();

    super.dispose();
  }

  Future<void> rename() async {
    final navigator = Navigator.of(context);
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      'email': user?.email,
      'firstName': firstNameTextInputController.text,
      'secondName': secondNameTextInputController.text,
      'uid': user?.uid
    });
    setState(() {
      navigator.pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false);
    });
  }

  Future<void> signOut() async {
    final navigator = Navigator.of(context);
    navigator.pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false);
    FirebaseAuth.instance.signOut();
  }

  Future<void> delete() async {
    final navigator = Navigator.of(context);
    FirebaseFirestore.instance.collection('users').doc(user!.uid).delete();
    FirebaseAuth.instance.currentUser!.delete();
    navigator.pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            backgroundColor: Colors.white,
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              'Редактирование профиля',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton<MenuItem>(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onSelected: (value) {
                  if (value == MenuItem.item1) {
                    signOut();
                  } else {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .delete();
                    FirebaseAuth.instance.currentUser!.delete();
                    Navigator.pop(context);
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                      value: MenuItem.item1, child: Text('Выйти из аккаунта')),
                  PopupMenuItem(
                      value: MenuItem.item2, child: Text('Удалить аккаунт'))
                ],
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: const Center(child: CircularProgressIndicator()));
    };
    firstNameTextInputController.text = loggedInUser.firstName!;
    secondNameTextInputController.text = loggedInUser.secondName!;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Редактирование профиля',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<MenuItem>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (value) async {
              setState(() {
                if (value == MenuItem.item1) {
                  signOut();
                } else {
                  delete();
                }
              });
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                  value: MenuItem.item1, child: Text('Выйти из аккаунта')),
              PopupMenuItem(
                  value: MenuItem.item2, child: Text('Удалить аккаунт'))
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (firstName) => firstName != null && firstName.isEmpty
                    ? 'Введите Имя'
                    : null,
                controller: firstNameTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Введите имя',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (secondname) =>
                    secondname != null && secondname.isEmpty
                        ? 'Введите Фамилию'
                        : null,
                controller: secondNameTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Введите фамилию',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(0, 0, 0, 0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(53, 207, 255, 1))),
                onPressed: rename,
                child: const SizedBox(
                    height: 53,
                    child: Center(
                        child: Text(
                      'Сохранить',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
