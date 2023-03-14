import 'package:flutter/material.dart';


class AddBody extends StatefulWidget {
  const AddBody({super.key});

  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  TextEditingController nameTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameTextInputController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Выставить товар на аукцион\nили продажу', style: TextStyle(fontSize: 20, fontFamily: 'montserrat', fontWeight: FontWeight.bold),)],),
              SizedBox(height: 30,),
            Row(children: [
              SizedBox(width: 35,),
              Text('Тип', style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold, fontSize: 15),)
            ],)
          ],
        ),
    );
  }
}