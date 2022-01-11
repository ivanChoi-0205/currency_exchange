import 'package:flutter/material.dart';

/*
实现“提示”功能一样，像 Text Widget 构造方法的 decoration
数传入一个 InputDecoration 对象。

然而，你并不想一开始就显示错误信息。相反，当用户输入了无效的信息后，
更新状态并传入一个新的 InputDecoration 对象。
*/
class InputValidation extends StatefulWidget {
  // InputValidation({Key key}) : super(key: key);

  @override
  _InputValidationState createState() => _InputValidationState();
}

class _InputValidationState extends State<InputValidation> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: This is not an email';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: InputDecoration(
            hintText: 'This is a hint',
            errorText: _getErrorText(),
          ),
        ),
      ),
    );
  }

  String? _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}
