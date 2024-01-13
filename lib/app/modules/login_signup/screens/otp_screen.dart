import 'package:cookhub_frontend/app/modules/add_recipe/widgets/input_widget.dart';
import 'package:cookhub_frontend/app/modules/login_signup/screens/new_password_screen.dart';
import 'package:cookhub_frontend/app/modules/login_signup/widgets/default_button.dart';
import 'package:cookhub_frontend/core/constants/colors.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/constants/strings.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _codeController = TextEditingController();
  final List<String> _codeArray = [];

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _goToNextPage(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                    TImages.otpImage,
                    width: _width * 0.8,
                  ),
                ),
                SizedBox(
                  height: _height * 0.06,
                ),
                Text(
                  Strings.otpTitle,
                  style: TTextTheme.lightTextTheme.displayLarge!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                SizedBox(
                  height: _height * 0.005,
                ),
                Text(
                  Strings.otpDescription,
                  style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                    color: ColorSelect.textColor,
                  ),
                ),
                const SizedBox(
                  height: TSizes.space_16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputWidget(
                      textStyle:
                          TTextTheme.lightTextTheme.displaySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            _codeArray.add(value),
                            FocusScope.of(context).nextFocus(),
                          },
                      },
                      width: TSizes.space_56,
                      height: TSizes.space_56,
                      inputType: TextInputType.number,
                      maxLine: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                    ),
                    InputWidget(
                      textStyle:
                          TTextTheme.lightTextTheme.displaySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            _codeArray.add(value),
                            FocusScope.of(context).nextFocus(),
                          },
                      },
                      width: TSizes.space_56,
                      height: TSizes.space_56,
                      inputType: TextInputType.number,
                      maxLine: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                    ),
                    InputWidget(
                      textStyle:
                          TTextTheme.lightTextTheme.displaySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            _codeArray.add(value),
                            FocusScope.of(context).nextFocus(),
                          },
                      },
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      width: TSizes.space_56,
                      height: TSizes.space_56,
                      inputType: TextInputType.number,
                      maxLine: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                    ),
                    InputWidget(
                      textStyle:
                          TTextTheme.lightTextTheme.displaySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            _codeArray.add(value),
                            FocusScope.of(context).nextFocus(),
                          },
                      },
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      width: TSizes.space_56,
                      height: TSizes.space_56,
                      inputType: TextInputType.number,
                      maxLine: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                    ),
                    InputWidget(
                      textStyle:
                          TTextTheme.lightTextTheme.displaySmall!.copyWith(
                        color: ColorSelect.textColor,
                      ),
                      onChanged: (value) => {
                        if (value.length == 1)
                          {
                            _codeArray.add(value),
                            FocusScope.of(context).nextFocus(),
                          },
                      },
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      width: TSizes.space_56,
                      height: TSizes.space_56,
                      inputType: TextInputType.number,
                      maxLine: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                DefaultButton(
                  btnTitle: Strings.otpBtnTitle,
                  width: double.infinity,
                  btnIcon: Container(),
                  btnBackground: ColorSelect.primaryColor,
                  btnBorder: Colors.transparent,
                  labelColor: Colors.white,
                  onClick: () {
                    for (int i = 0; i < _codeArray.length; i++) {
                      print(_codeArray[i]);
                    }
                    _goToNextPage(NewPasswordScreen());
                  },
                ),
                SizedBox(
                  height: _height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.otpDontReceiveCode,
                      style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                        letterSpacing: 0.2,
                        color: ColorSelect.textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.space_8),
                        child: Text(
                          Strings.otpResend,
                          style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
                            color: ColorSelect.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorSelect.primaryColor,
                            decorationThickness: 2,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
