import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'cubit/app_bloc.dart';
import 'model.dart';

class Overview extends StatelessWidget {
  final Model details;
  final Function select;

  Overview(this.details, this.select);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {select(context, details.id)},
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(80, 10, 181, 161),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 10, 181, 161), blurRadius: 8)
              ]),
          padding: const EdgeInsets.fromLTRB(10, 20, 20, 30),
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.network(
                        "https://images.squarespace-cdn.com/content/v1/602608c3ee61023a4aafd9ae/1613108613475-8NZKUOTPUDZWHL7HTQK6/Bitmoji.png"),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${details.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "${details.email}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<UserBloc>(context)
                              .deleteUser(this.details.id as int);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            primary: Colors.black45),
                        child: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 10, 181, 161),
                        )),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
