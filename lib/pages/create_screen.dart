import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateTextInputController = TextEditingController();
  TextEditingController addressTextInputController = TextEditingController();
  TextEditingController peopleTextInputController = TextEditingController();
  TextEditingController descriptionTextInputController =
      TextEditingController();

  @override
  void dispose() {
    dateTextInputController.dispose();
    addressTextInputController.dispose();
    peopleTextInputController.dispose();
    descriptionTextInputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            final navigator = Navigator.of(context);
            navigator.pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Создание заказа',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                validator: (firstName) => firstName != null && firstName.isEmpty
                    ? 'Установите дату и время'
                    : null,
                controller: dateTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month_outlined),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Дата, время',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (date) =>
                    date != null && date.isEmpty
                        ? 'Введите Адрес'
                        : null,
                controller: addressTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.map_outlined),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Адрес',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (people) =>
                    people != null && people.isEmpty
                        ? 'Введите количество людей'
                        : null,
                controller: peopleTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.people_outline),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Количество людей',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                enabled: false,
                keyboardType: TextInputType.name,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Ярлыки',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                enabled: false,
                controller: descriptionTextInputController,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit_outlined),
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1)),
                  hintText: 'Описание работы',
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
                onPressed: () {},
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
