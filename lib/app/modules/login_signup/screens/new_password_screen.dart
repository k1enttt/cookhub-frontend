import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/login_signup/screens/signin_screen.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passController = TextEditingController();
  final _passConfirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passController.dispose();
    _passConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    void _goToNextPage(Widget screen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => screen,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.space_16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _height * 0.05,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                        TSizes.space_8,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorSelect.primaryColor,
                        size: TSizes.smallIcon,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                Text(
                  Strings.newPassTitle,
                  style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                SizedBox(
                  height: _height * 0.005,
                ),
                Text(
                  Strings.newPassDescription,
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                Text(
                  Strings.newPassInputTitle,
                  style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorSelect.textColor,
                  ),
                ),
                const SizedBox(
                  height: TSizes.space_8,
                ),
                InputWidget(
                  textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                  controller: _passController,
                  width: double.infinity,
                  height: 48,
                  label: Strings.enterPassword,
                  inputType: TextInputType.visiblePassword,
                  maxLine: 1,
                  obscureText: true,
                ),
                const SizedBox(
                  height: TSizes.space_16,
                ),
                Text(
                  Strings.passConfirmTitle,
                  style: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorSelect.textColor,
                  ),
                ),
                const SizedBox(
                  height: TSizes.space_8,
                ),
                InputWidget(
                  textStyle: TTextTheme.lightTextTheme.bodyMedium!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                  controller: _passConfirmController,
                  width: double.infinity,
                  height: 48,
                  label: Strings.enterPassConfirm,
                  inputType: TextInputType.visiblePassword,
                  maxLine: 1,
                  obscureText: true,
                ),
                SizedBox(
                  height: _height * 0.04,
                ),
                DefaultButton(
                  btnTitle: Strings.newPassResetBtnTitle,
                  width: double.infinity,
                  btnIcon: Container(),
                  btnBackground: ColorSelect.primaryColor,
                  btnBorder: Colors.transparent,
                  labelColor: Colors.white,
                  onClick: () {
                    if (_passController.text == _passConfirmController.text) {
                      print(true);
                      _goToNextPage(SignInScreen());
                    } else {
                      setState(() {
                        _passController.text = "";
                        _passConfirmController.text = "";
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
