import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/config/assets/app_vectors.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import 'login.dart';

class RegicterPage extends StatelessWidget {
  const RegicterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ?  Colors.black:Colors.white ,
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _fullNameField(context),
            const SizedBox(height: 20,),
            _fullEmailField(context),
            const SizedBox(height: 20,),
            _fullPassWordField(context),
            const SizedBox(height: 20,),
            BasicAppButton(
                onPressed: (){},
                title: 'Create Account'
            )
          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Full Name'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _fullEmailField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: 'Enter email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _fullPassWordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signinText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context)=>LoginPage())
                );
              },
              child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.blue
                ),
              )
          )
        ],
      ),
    );
  }
}
