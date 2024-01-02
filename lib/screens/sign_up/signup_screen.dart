import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class InputPhoneNumScreen extends StatefulWidget {
  const InputPhoneNumScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneNumScreen> createState() => _InputPhoneNumScreenState();

}


class _InputPhoneNumScreenState extends State<InputPhoneNumScreen> {
  final _formKey = GlobalKey<FormState>();
  final _myController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _myController.addListener(_printLatestValue);
  }
  
  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }
  
  void _printLatestValue() {
    print("Second text field: ${_myController.text}");
  }
  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return 
    GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
    
      child: Column(children: [
      const SizedBox(height: 500, width: 420, child: Image(image: AssetImage('assets/images/shadewedding.png')
              ),),
      const Column(
        children: [
          Text('휴대폰 번호를 입력해주세요', style: TextStyle(fontSize: 20),),
          Text('본인 인증을 위해 필요합니다.', style: TextStyle(fontSize: 15, color: Colors.grey)),
        ],
      ),
      Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (text) {
              print("First text field: $text");
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
              // NumberFormatter(),
            ],
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: '010-1234-1234',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            onSaved: (value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '전화번호를 입력해주세요.';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('전송되었습니다.')));
                  context.pushNamed('validate_phone_number');
                }
              },
              child: const Center(child: Text('인증번호 받기'))
            ),
          ),
        ],
      ),
    )
    ],
    )
    ))
    ;    
  }
}
