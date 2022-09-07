import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial1/bloc/mybloc_bloc.dart';
import 'package:flutter_bloc_tutorial1/mypage2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider<MyblocBloc>(
          create: (context) => MyblocBloc(),
          child: BlocConsumer<MyblocBloc, MyblocState>(
            listener: (context, state) {
              if (state is FormLoaded) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPage2(),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is FormLoading) {
                return loadingWidget();
              } else if (state is MyblocInitial) {
                return buildInitialInput();
              }
              return loadingWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget loadingWidget() {
    print('===========inside Loading State===========');
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 100,
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildInitialInput() {
    return Column(
      children: [
        SizedBox(height: 50.0),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(height: 50.0),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'City',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(height: 50.0),
        TextButton(
          onPressed: () {
            BlocProvider.of<MyblocBloc>(context).add(SubmitForm());
          },
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
