import 'package:flutter/material.dart';
import 'package:water_reminder_app/services/firestore/firestore_user_service.dart';
import 'package:water_reminder_app/src/root_page.dart';
import 'package:water_reminder_app/src/widgets/buttons/custom_wide_flat_button.dart';
import 'package:water_reminder_app/src/widgets/popups/custom_amount_onboarding_popup.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int selectedAmount = 2500;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100, width: double.infinity),
            appIcon(),
            smallTextSpace,
            title(textTheme),
            smallTextSpace,
            subTitle(textTheme),
           // Padding( padding: EdgeInsets.only(top: 75),),
     
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                       Text(
      'Set your water goal',
      style:  TextStyle(color: Color(0xFFFFFFFF), fontSize: 25,fontWeight: FontWeight.w400),
    ),
    Padding( padding: EdgeInsets.only(top: 25),),
                  RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                    onPressed: () async {
                      int amount = await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return CustomAmountOnboardingPopup();
                        },
                      );
                      setState(() => selectedAmount = amount);
                    },
                    child: Text(
                      '$selectedAmount ml',
                       style:  TextStyle(color: Color(0xFF03A9F4), fontSize: 35, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            CustomWideFlatButton(
              backgroundColor: Colors.blue.shade300,
              foregroundColor: Colors.blue.shade900,
              isRoundedAtBottom: false,
              text: 'Start',
              onPressed: () async {
                await FirestoreUserService.updateTotalWater(selectedAmount);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => RootPage(),
                  ),
                );
              },
            ),
          ],
        ),
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
    // Image.asset(
    //  'assets/sign_in_icon.png',
   //   width: 125,
   //   height: 125,
      
   // );
  }

  Text title(TextTheme textTheme) {
    
    return Text(
      'We help you drink water',
       style:  TextStyle(color: Color(0xFFFFFFFF), fontSize: 25, ),
    );
    
  }

  Text subTitle(TextTheme textTheme) {
    return Text(
      'Set your daily water intake goal',
     style:  TextStyle(color: Color(0xFFFFFFFF), fontSize: 19, ),
    );
  }
}
