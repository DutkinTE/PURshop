// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';


class PersonBody extends StatefulWidget {
  const PersonBody({super.key});

  @override
  State<PersonBody> createState() => _PersonBodyState();
}

class _PersonBodyState extends State<PersonBody> {
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
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: const Center(child: CircularProgressIndicator()));
    };
    return ListView(
        children: [
          Container(height: 100,
          decoration: BoxDecoration(
            
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 3.0
              ),
            ]
          ),  
          child: Column(
            children: [
              SizedBox(height: 50,),
          Row(
            children: [
              SizedBox(width: 50,),
              Icon(Icons.person_outline, size: 35,),
              SizedBox(width: 15,),
              Text('${loggedInUser.firstName} ${loggedInUser.secondName}', style: TextStyle(fontSize: 16, fontFamily: 'montserrat', color: Color.fromRGBO(162, 162, 162, 1)),)
            ],
          ),
            ],
          ),),
          SizedBox(height: 30,),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(width: 200,
                  child: Row(children: [SizedBox(width: 20,), Icon(Icons.menu, size: 35,),
                  SizedBox(width: 20,),
                Text('Мои Лоты', style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),],),),
                
                SizedBox(
                  child: Row(children: [Icon(Icons.navigate_next, size: 35, color: Color.fromRGBO(210, 210, 210, 1),),
                  SizedBox(width: 20,),],),),
              ],),
            ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(width: 200,
                  child: Row(children: [SizedBox(width: 22,), Image.asset('lib/assets/database.png', height: 30,),
                  SizedBox(width: 20,),
                Text('Мои ставки', style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),],),),
                
                SizedBox(
                  child: Row(children: [Icon(Icons.navigate_next, size: 35, color: Color.fromRGBO(210, 210, 210, 1)),
                  SizedBox(width: 20,),],),),
              ],),
            ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(width: 200,
                  child: Row(children: [SizedBox(width: 20,), Icon(Icons.done, size: 35,),
                  SizedBox(width: 20,),
                Text('Мои сделки', style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),],),),
                
                SizedBox(
                  child: Row(children: [Icon(Icons.navigate_next, size: 35, color: Color.fromRGBO(210, 210, 210, 1)),
                  SizedBox(width: 20,),],),),
              ],),
            ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(width: 200,
                  child: Row(children: [SizedBox(width: 20,), Icon(Icons.trending_up, size: 35,),
                  SizedBox(width: 20,),
                Text('Рейтинг', style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),],),),
                
                SizedBox(
                  child: Row(children: [Icon(Icons.navigate_next, size: 35, color: Color.fromRGBO(210, 210, 210, 1)),
                  SizedBox(width: 20,),],),),
              ],),
            ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/account', (route) => true);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                
                border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(width: 290,
                    child: Row(children: [SizedBox(width: 20,), Icon(Icons.edit_document, size: 35,),
                    SizedBox(width: 20,),
                  Text('Редактировать профиль', style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),],),),
                  
                  SizedBox(
                    child: Row(children: [Icon(Icons.navigate_next, size: 35, color: Color.fromRGBO(210, 210, 210, 1)),
                    SizedBox(width: 20,),],),),
                ],),
              ),
          ),
        ],
      )
    ;
  }
}