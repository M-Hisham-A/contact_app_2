// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

import '../model.dart';

@immutable
class UserState {
  List<Model> users;

  UserState(this.users);

  @override
  List<Object?> get props => [];
}
