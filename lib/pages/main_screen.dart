// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/models/user_model.dart';
import 'package:hackathon/widgets/add_body.dart';
import 'package:hackathon/widgets/person_body.dart';
import 'package:hackathon/widgets/searchbody.dart';
import 'account_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  TextEditingController nameTextInputController = TextEditingController();
  TextEditingController searchTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameTextInputController.dispose();
    searchTextInputController.dispose();

    super.dispose();
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
  

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  int selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Text('Подождите')));
    };

    
    List<Widget> body_main = [
      SearchBody(),
      AddBody(),
      PersonBody()
      ];
    
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: const Center(child: CircularProgressIndicator()));
    };
    return Scaffold(
      backgroundColor: Colors.white,
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Stack(
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AccountScreen()));
                      },
                      child: Container(
                        color: const Color.fromRGBO(0, 0, 0, 0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(217, 217, 217, 1),
                                radius: 25,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${loggedInUser.firstName} ${loggedInUser.secondName}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text('Перейти в профиль')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      color: const Color.fromRGBO(187, 187, 187, 1),
                      height: 1,
                      width: 5000),
                ]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(114, 140, 101, 1),
          items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.search, color: Colors.white,),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.add, color: Colors.white),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.person_outline, color: Colors.white),
          ), label: '')
        ],
        iconSize: 30,
        
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        ),
        body: body_main[selectedIndex],);
  }
} 