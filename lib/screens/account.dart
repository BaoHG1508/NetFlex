// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/constants/Navigator.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountScreen extends StatelessWidget {

  AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              height: 230,
              decoration: BoxDecoration(
                gradient: appGradient,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: 'Tài khoản'.text.bold.size(35).white.make(),
              ),
              top: 30,
            ),
            Positioned(
              child: Container(
                height: 820,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),

                //USER NAME AND EMAIL
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.heightBox,
                    'Tên tài khoản'
                        .text
                        .fontFamily("Inter")
                        .semiBold
                        .size(17)
                        .make(),
                    10.heightBox,
                    //USER NAME GOES HERE
                    authController.userName.toString()
                        .text
                        .size(15)
                        .make(),
                    Divider(
                      color: Color(0xffB5B3B3),
                    ),
                    20.heightBox,
                    'Email'.text.fontFamily("Inter").semiBold.size(17).make(),
                    10.heightBox,
                    // USER EMAIL GOES HERE
                    authController.email
                        .text
                        .size(15)
                        .make(),
                    Divider(
                      color: Color(0xffB5B3B3),
                    ),
                    90.heightBox,
                    //Đăng xuất
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kApp_color, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: (){
                            authController.signOut();
                            Navigator.pushNamed(context, SiteNavigation.LOGIN);
                          },
                          child: 'Đăng xuất'
                              .text
                              .color(kApp_color)
                              .make())
                          .centered()
                          .pSymmetric(h: 50),
                    ),
                  ],
                ).pSymmetric(h: 40),
              ),
              top: 200,
            ),

            //AVATAR
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/floradb-bdef1.appspot.com/o/user_avatar%2Fdefaultavatarblue.png?alt=media&token=28a1c3ec-8ff7-4376-b5ed-d8076fa41042'),
                ),
              ),
              bottom: 280,
            ),
          ],
        ),
      ),
    );
  }
}