import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_project/src/presentation/bloc/name_bloc.dart';
import 'package:trial_project/src/presentation/pages/name_page.dart';

import './src/locator.dart' as di;

void main() async {
  di.getDependencies();

  runApp(
    BlocProvider(
    create: (context) => NameBloc(getName:di.locator()),
    child:const MaterialApp(home: NamePage()),
  ));
}
