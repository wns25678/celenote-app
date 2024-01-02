// import 'package:celenote_app/screens/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValPhoneNumScreen extends StatefulWidget {
  const ValPhoneNumScreen({Key? key}) : super(key: key);

  @override
  State<ValPhoneNumScreen> createState() => _ValPhoneNumScreenState();

}

class _ValPhoneNumScreenState extends State<ValPhoneNumScreen> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(children: [
        const SizedBox(child: Image(image: AssetImage('assets/images/shadewedding.png')),),
        Column(
          children: [
            const Text('인증번호를 입력해주세요.', style: TextStyle(fontSize: 20),),
            const Text('010-2345-6789로 인증번호가 전송되었습니다.', style: TextStyle(fontSize: 15, color: Colors.grey),),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                      // NumberFormatter(),
                      ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '인증번호',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    onSaved: (value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '인증번호를 입력해주세요.';
                      }
                      return null;
                    },
                    ), // TextFormField
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  )
                  ],
                ),
              ),
          ],
        ),
      ]
      ),
    ),
    );
  }
}