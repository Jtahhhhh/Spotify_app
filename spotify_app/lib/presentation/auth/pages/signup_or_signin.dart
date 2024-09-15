import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/config/assets/app_images.dart';
import 'package:spotify_app/core/config/assets/app_vectors.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
                AppVectors.bottomPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBg
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child:  GestureDetector(
              onTap: (){

              },
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10
                  ),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30
                    ) ,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff30393c).withOpacity(0.5)
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new
                    )
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo
                  ),
                  SizedBox(height: 55,),
                  Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 21,),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xff797979)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 21,),
                  Row(
                    children: [
                      Expanded(
                          flex:1,
                          child: BasicAppButton(
                            title: 'Register',
                            onPressed: (){},
                          )
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: (){},
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: context.isDarkMode ? Colors.white : Colors.black
                              ),
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
