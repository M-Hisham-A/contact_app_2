// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:detailmanagement/cubit/app_bloc.dart';
import 'package:detailmanagement/cubit/app_state.dart';
import 'package:detailmanagement/detailover.dart';
import 'package:detailmanagement/repository/repository.dart';

import 'complete.dart';
import 'model.dart';
import 'new_tran.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late List<Model> details;
  late List<Model> sDetail = [];
  late String search = "";
  void Display(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CompleteDetail(index);
    }));
  }

  void searchF(String val) {
    setState(() {
      search = val;
    });
  }

  void _addNewContact(
      String enteredname,
      String enteruser,
      String enteredemail,
      String enterstreet,
      String entercity,
      String enterzip,
      String enteredphone,
      String enteredwebsite,
      String enteredcompany) {
    Model new_user = Model(
        id: -1,
        name: enteredname,
        user: enteruser,
        email: enteredemail,
        acity: entercity,
        astreet: enterstreet,
        azip: enterzip,
        number: enteredphone,
        website: enteredwebsite,
        company: enteredcompany);

    BlocProvider.of<UserBloc>(context).addUser(new_user);
  }

  void _startAddNewContact(BuildContext ctx) {
    print("started");
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
              addTx: _addNewContact,
              name: "",
              user: "",
              email: "",
              phone: "",
              astreet: "",
              acity: "",
              azip: "",
              website: "",
              company: ""),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  String Intial = "Id";
  List<String> Items = ["Id", "Name", "Email", "Company"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(UserRepository()),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 70,
            title: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tek Detail",
                      style: TextStyle(
                          fontFamily: 'sans sheriff',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 10, 181, 161)),
                    ),
                    DropdownButton(
                        value: Intial,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromARGB(255, 10, 181, 161),
                        ),
                        items: Items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 181, 161),
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Intial = newValue!;
                          });
                        }),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ElevatedButton(
                        onPressed: () => _startAddNewContact(context),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(2),
                            primary: Color.fromARGB(255, 10, 181, 161)),
                        child: Text(
                          "+",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            backgroundColor: Colors.black,
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: ((context, state) {
              details = state.users;
              sDetail = [];
              print(details);
              for (int i = 0; i < details.length; i++) {
                String s1, s2;
                s1 = search.toLowerCase();
                s2 = details[i].name.toLowerCase();

                if (s2.contains(s1)) {
                  sDetail.add(details[i]);
                }
              }
              switch (Intial) {
                case "Name":
                  sDetail.sort(((a, b) => (a.name).compareTo(b.name)));
                  break;
                case "Id":
                  sDetail.sort(((a, b) => (a.id).compareTo(b.id)));
                  break;
                case "Email":
                  sDetail.sort(((a, b) => (a.email).compareTo(b.email)));
                  break;
                case "Company":
                  sDetail.sort(((a, b) => (a.company).compareTo(b.company)));
                  break;
              }

              return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 70,
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Card(
                          color: Colors.black,
                          child: TextField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 181, 161),
                            ),
                            cursorColor: Color.fromARGB(255, 10, 181, 161),
                            onChanged: searchF,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 10, 181, 161),
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 10, 181, 161),
                                  ),
                                ),
                                labelText: "Search... ",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 10, 181, 161),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 5, 10, 10)),
                          ),
                        ),
                      ),
                      ...sDetail
                          .map((e) => Overview(
                              Model(
                                  id: e.id,
                                  name: e.name,
                                  user: e.user,
                                  email: e.email,
                                  number: e.number,
                                  website: e.website,
                                  company: e.company,
                                  astreet: e.astreet,
                                  acity: e.acity,
                                  azip: e.azip),
                              Display))
                          .toList(),
                      Center(
                        child: sDetail.isEmpty
                            ? Text(
                                "No Match Found !!",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 10, 181, 161),
                                  fontSize: 18,
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          _startAddNewContact(context),
                                      style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(2),
                                          primary: Color.fromARGB(
                                              255, 10, 181, 161)),
                                      child: Text(
                                        "+",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                          fontSize: 36,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ]),
                  ));
            }),
          ),
        ),
      ),
    );
  }
}
