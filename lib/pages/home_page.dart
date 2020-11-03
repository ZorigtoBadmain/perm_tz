import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_tz/bloc/user_bloc.dart';
import 'package:perm_tz/services/user_repository.dart';
import 'package:perm_tz/widgets/action_buttons.dart';
import 'package:perm_tz/widgets/user_list.dart';

    class HomePage extends StatelessWidget {

      final userRepository = UsersRepository();
        @override
        Widget build(BuildContext context) {
            return BlocProvider<UserBloc>(
                create: (context) => UserBloc(userRepository: userRepository),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('User list'),
                  centerTitle: true,
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ActionButtons(),
                    Expanded(child: UserList(),)
                  ],
                ),
              ),
            );

  }
    }