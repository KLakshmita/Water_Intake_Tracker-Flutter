import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder_app/src/global_blocs/auth/auth.dart';

class AnonymousSignInButton extends StatelessWidget {
  const AnonymousSignInButton({
    
    Key key,
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // backgroundColor: Colors.grey[900];
    final auth = Provider.of<Auth>(context);
    return ButtonTheme(
      minWidth: 224,
      height: 48,
      child: RaisedButton(
        onPressed: auth.signInAnonymously,
         color: Colors.white,
        child: Text('Lets Start' ,   style:  TextStyle(color: Color(0xFF03A9F4), fontSize: 25, fontWeight: FontWeight.w400),),
      ),
    );
  }
}
