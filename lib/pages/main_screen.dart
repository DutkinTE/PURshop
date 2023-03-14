// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/models/user_model.dart';
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

  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body_main = [
      ListView(children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 50, bottom: 50),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(210, 210, 210, 1),
                  ),
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: searchTextInputController,
                        autocorrect: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(210, 210, 210, 1)),
                              borderRadius: BorderRadius.circular(10)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(210, 210, 210, 1)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(210, 210, 210, 1)),
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          suffixIcon: Icon(Icons.search, size: 35, color: Colors.black,),
                          
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(210, 210, 210, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'montserrat'),
                          hintText: 'Поиск',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 51.0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Поиск в категории: все категории',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'montserrat',
                                  color: Color.fromRGBO(60, 60, 60, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2, left: 10),
                              child: GestureDetector(onTap: (){},child: Icon(Icons.navigate_next, size: 35,),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Новинки',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserrat'),
                    ),
                    GestureDetector(onTap: (){},child: Icon(Icons.navigate_next, size: 35,),)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[0]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[0]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[1]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[1]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[2]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[2]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[3]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('slots').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[3]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Товары по фиксированной цене',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserrat'),
                    ),
                    GestureDetector(onTap: (){},child: Icon(Icons.navigate_next, size: 35,),)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[0]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[0]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[1]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[1]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[2]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[2]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 185,
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        SizedBox(height: 17,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          height: 101,
                          width: 114,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text(snapshot.requireData.docs[3]['name'], style: TextStyle(fontFamily: 'montserrat', fontSize: 12),);
                            },)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('goods').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              return Text("${snapshot.requireData.docs[3]['price']} руб", style: TextStyle(fontFamily: 'montserrat', fontSize: 13, fontWeight: FontWeight.bold),);
                            },),
                            SizedBox(width: 20,)
                        ],)
                      ],),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
      ListView(
        children: [
          SizedBox(
            height: 50,
            child: Center(child: Text('Создание лота')),
          ),
          Form(
            key: formKey,
            child: Container(
              color: Colors.grey,
              height: 50,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Лот'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ],
              )),
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
                child: Row(
              children: [
                Text('Название'),
              ],
            )),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (Name) =>
                Name != null && Name.isEmpty ? 'Введите название' : null,
            controller: nameTextInputController,
            autocorrect: false,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
              hintText: 'Что продаем?',
            ),
          )
        ],
      ),
      ListView(
        children: [
          Row(
            children: [
              Image.asset(
                'lib/assets/user.png',
              ),
              Text('${loggedInUser.firstName} ${loggedInUser.secondName}')
            ],
          )
        ],
      )
    ];
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Text('Подождите')));
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
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  icon: Icon(Icons.search, size: 30,)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  icon: Icon(Icons.add, size: 30)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  icon: Icon(Icons.person_outline, size: 30)),
            ],
          ),
        ),
        body: body_main[index]);
  }
}
