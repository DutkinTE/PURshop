// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  TextEditingController searchTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    searchTextInputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: const Center(child: CircularProgressIndicator()));
    };
    return ListView(children: <Widget>[
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
                        suffixIcon: Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.black,
                        ),
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
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.navigate_next,
                                size: 35,
                              ),
                            ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.navigate_next,
                      size: 35,
                    ),
                  )
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
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          height: 101,
                          width: 114,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Image.network(snapshot.requireData.docs[0]['image']);
                              },
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  snapshot.requireData.docs[0]['name'],
                                  style: TextStyle(
                                      fontFamily: 'montserrat', fontSize: 12),
                                );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  "${snapshot.requireData.docs[0]['price']} руб",
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 185,
                    width: 153,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          height: 101,
                          width: 114,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Image.network(snapshot.requireData.docs[1]['image']);
                              },
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  snapshot.requireData.docs[1]['name'],
                                  style: TextStyle(
                                      fontFamily: 'montserrat', fontSize: 12),
                                );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('slots')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  "${snapshot.requireData.docs[1]['price']} руб",
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.navigate_next,
                      size: 35,
                    ),
                  )
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
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          height: 101,
                          width: 114,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Image.network(snapshot.requireData.docs[0]['image']);
                              },
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  snapshot.requireData.docs[0]['name'],
                                  style: TextStyle(
                                      fontFamily: 'montserrat', fontSize: 12),
                                );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  "${snapshot.requireData.docs[0]['price']} руб",
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 185,
                    width: 153,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(210, 210, 210, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          height: 101,
                          width: 114,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Image.network(snapshot.requireData.docs[1]['image']);
                              },
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  snapshot.requireData.docs[1]['name'],
                                  style: TextStyle(
                                      fontFamily: 'montserrat', fontSize: 12),
                                );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('goods')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Text(
                                  "${snapshot.requireData.docs[1]['price']} руб",
                                  style: TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    ]);
  }
}
