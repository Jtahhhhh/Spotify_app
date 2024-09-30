import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/config/assets/app_vectors.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/presentation/auth/pages/regicter.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../root/pages/root.dart';

class LoginPage extends StatelessWidget {
  LoginPage ({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 50
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginText(),
              const SizedBox(height: 50,),
              const SizedBox(height: 20,),
              _fullEmailField(context),
              const SizedBox(height: 20,),
              _fullPassWordField(context),
              const SizedBox(height: 20,),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SigninUseCase>().call(
                        param: SignInUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString())
                    );
                    result.fold(
                            (l){
                          var snackBar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                            (r){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context)=> const RootPage()),
                                  (route)=>false
                          );
                        }
                    );
                  },
                  title: 'Login'
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _loginText(){
    return Text(
      'Login',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullEmailField(BuildContext context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
          hintText: 'Enter email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _fullPassWordField(BuildContext context){
    return TextField(
      controller: _password,
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
            'You dont have an account?',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context)=>RegicterPage())
                );
              },
              child: Text(
                'Regíter',
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
