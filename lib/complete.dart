import 'package:flutter/material.dart';
import 'each.dart';
import 'address.dart';
import 'package:flutter_bloc/flutter_bloc.dart ';
import 'cubit/app_bloc.dart';
import 'model.dart';
import 'new_tran.dart';
import 'cubit/app_state.dart';

class CompleteDetail extends StatefulWidget {
  final int id;
  CompleteDetail(this.id);

  @override
  State<CompleteDetail> createState() => _CompleteDetailState();
}

class _CompleteDetailState extends State<CompleteDetail> {
  late List<Model> Detail;
  late int index;
  void _modifyContact(
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
        id: widget.id,
        name: enteredname,
        user: enteruser,
        email: enteredemail,
        astreet: enterstreet,
        acity: entercity,
        azip: enterzip,
        number: enteredphone,
        website: enteredwebsite,
        company: enteredcompany);

    BlocProvider.of<UserBloc>(context).modifyUser(widget.id, new_user);
  }

  void _startmodifyContact(
      BuildContext ctx,
      String name,
      String user,
      String email,
      String phone,
      String astreet,
      String acity,
      String azip,
      String website,
      String company) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewContact(
              addTx: _modifyContact,
              name: name,
              user: user,
              email: email,
              phone: phone,
              astreet: astreet,
              acity: acity,
              azip: azip,
              website: website,
              company: company),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TekDetail",
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ElevatedButton(
                      onPressed: () => _startmodifyContact(
                          context,
                          Detail[index].name,
                          Detail[index].user,
                          Detail[index].email,
                          Detail[index].number,
                          Detail[index].astreet,
                          Detail[index].acity,
                          Detail[index].azip,
                          Detail[index].website,
                          Detail[index].company),
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(2),
                          primary: Color.fromARGB(255, 10, 181, 161)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        Detail = state.users;
        int _index = -1;
        index = 0;
        for (Model x in state.users) {
          if (x.id == widget.id) {
            _index = index;
            break;
          }
          index++;
        }
        index = _index;
        Map<String, String> address = {
          "street": Detail[index].astreet,
          "city": Detail[index].acity,
          "zipcode": Detail[index].azip
        };
        print(Detail);

        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Each('ID', "${Detail[index].id}"),
                Each('Name', Detail[index].name),
                Each('UserName', Detail[index].user),
                Each('Email', Detail[index].email),
                Each('Phone Number', Detail[index].number),
                Each('Website', Detail[index].website),
                Each("Company", Detail[index].company),
                Address("Address", address),
              ],
            ),
          ),
        );
      }),
    );
  }
}
