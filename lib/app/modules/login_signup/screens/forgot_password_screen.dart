import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/login_signup/screens/otp_screen.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                  height: _height * 0.06,
                ),
                Center(
                  child: Image.asset(
                    TImages.forgotPassImage,
                    width: _width * 0.8,
                  ),
                ),
                SizedBox(
                  height: _height * 0.06,
                ),
                Text(
                  Strings.forgotPass,
                  style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                SizedBox(
                  height: _height * 0.005,
                ),
                Text(
                  Strings.forgotDescription,
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                Text(
                  Strings.signUpEmail,
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
                  controller: _emailController,
                  width: double.infinity,
                  height: 48,
                  label: Strings.enterEmail,
                  inputType: TextInputType.text,
                  maxLine: 1,
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                DefaultButton(
                  btnTitle: Strings.sendCodeBtnTitle,
                  width: double.infinity,
                  btnIcon: Container(),
                  btnBackground: ColorSelect.primaryColor,
                  btnBorder: Colors.transparent,
                  labelColor: Colors.white,
                  onClick: () {
                    _goToNextPage(OtpScreen());
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
