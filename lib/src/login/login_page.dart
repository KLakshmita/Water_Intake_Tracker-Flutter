import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder_app/src/global_blocs/auth/auth.dart';
import 'package:water_reminder_app/src/widgets/buttons/anonymous_sign_in_button.dart';
import 'package:water_reminder_app/src/widgets/buttons/google_sign_in_button.dart';
import 'package:water_reminder_app/src/widgets/popups/information_popup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TapGestureRecognizer _termsOfServiceRecognizer;
  TapGestureRecognizer _privacyPolicyRecognizer;

  @override
  void initState() {
    super.initState();

    _privacyPolicyRecognizer = TapGestureRecognizer()..onTap = _openPrivacyPolicy;
    _termsOfServiceRecognizer = TapGestureRecognizer()..onTap = _openTermsOfService;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final auth = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 100, width: double.infinity),
            appIcon(),
            smallTextSpace,
            title(textTheme),
            smallTextSpace,
            subTitle(textTheme),
            /* Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/w1.jpeg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
             ),*/
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                //  GoogleSignInButton(
             //       onPressed: auth.signInWithGoogle,
             //     ),
                  AnonymousSignInButton(),
                ],
              ),
            ),
            termsOfServiceText(context),
            smallTextSpace,
          ],
        ),
      ),
    );
  }

  RichText termsOfServiceText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
    //    text: 'By creating an account, you are agreeeing to our\n',
        style: Theme.of(context).textTheme.body1,
        children: <TextSpan>[
          TextSpan(
      //      text: 'Terms of Service ',
            recognizer: _termsOfServiceRecognizer,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
        //    text: 'and',
          ),
          TextSpan(
          //  text: ' Privacy Policy!',
            recognizer: _privacyPolicyRecognizer,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget get smallTextSpace => SizedBox(height: 8);

  Widget appIcon() {
    return Container(
        height: 150.0,
        width: 150.0,
        
        child: Padding(
          
            padding: EdgeInsets.all(15),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 10,
              child: new Image.asset('assets/sign_in_icon.png'),
            )),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],),
          shape: BoxShape.circle,
          border: new Border.all(
            color: Colors.indigo,
            width: 2.0,
          ),
        )
        );
  //  return Image.asset(
  //    'assets/sign_in_icon.png',
  //    width: 125,
  //    height: 125,
  //  );
  }

  Text title(TextTheme textTheme) {
    return Text(
      'Water reminder',
      style:  TextStyle(color: Color(0xFFFFFFFF), fontSize: 25,fontWeight: FontWeight.w400),
    );
  }

  Text subTitle(TextTheme textTheme) {
    return Text(
      'We help you drink enough water',
      style:  TextStyle(color: Color(0xFFFFFFFF), fontSize: 19, ),
    );
  }

  void _openTermsOfService() {
    showDialog(
      context: context,
      builder: (context) {
        return InformationPopup(
          title: 'Terms of Service',
          description: 'You agree bla bla bla',
        );
      },
    );
  }

  void _openPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) {
        return InformationPopup(
          title: 'Privacy Policy',
         // description: 'You agree bla bla bla',
        );
      },
    );
  }

  //@override
  //void dispose() {
  //  _termsOfServiceRecognizer.dispose();
  //  _privacyPolicyRecognizer.dispose();
  //  super.dispose();
  //}
}
