import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(child: 
    Scaffold(
      appBar: AppBar(),
      body: Container(
        child: InkWell(
          onTap: (){
            context.pushNamed('input_phone_number');
          },
        child: Container(
        color: const Color.fromARGB(255, 205, 146, 216),
        child: const Text("회원가입으로 이동"),
        ),
        )
      ),
    )
    ))
    ;
  }
}
