import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person/components/custom_loading.dart';
import 'package:person/components/error.dart';
import 'package:person/components/mainpage/userinfo.dart';
import 'package:person/screens/userbloc/bloc/userbloc_bloc.dart';
import 'package:person/screens/userbloc/bloc/userbloc_repository.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final bloc = UserblocBloc(UserBlocRepository());

  @override
  void initState() {
    bloc.add(GetUserEvent());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UserblocBloc, UserblocState>(
        bloc: bloc,
        builder: (_context, state) {
          if (state is UserInitial) {
            return CustomLoading();
          } else if (state is UserblocLoaded) {
            return BlocProvider.value(
              value: bloc,
              child: UserInfo(
                tabController: _tabController,
                user: state.model,
              ),
            );
          } else if (state is UserError) {
            return BlocProvider.value(
              value: bloc,
              child: CustomError(message: state.message),
            );
          }
          return BlocProvider.value(
            value: bloc,
            child: CustomError(),
          );
        },
      ),
    );
  }
}
