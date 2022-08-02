import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../const/consts.dart';
import '../services/utils.dart';
import '../widgets/auth_button.dart';
import '../widgets/back_widget.dart';
import '../widgets/text_widget.dart';

class ForgetPassowrdScreen extends StatefulWidget {
  static const routename = '/ForgetPassowrdScreen';
  const ForgetPassowrdScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassowrdScreen> createState() => _ForgetPassowrdScreenState();
}

class _ForgetPassowrdScreenState extends State<ForgetPassowrdScreen> {
  final _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  void _forgetPassFCT() async {}

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            autoplay: true,
            itemCount: Consts.authImagesPaths.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                Consts.authImagesPaths[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                const BackWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'Forget password',
                  textSize: 30,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Email address',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthButton(
                  fct: () {
                    _forgetPassFCT();
                  },
                  buttonText: "Reset now",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
