import 'package:evently_app/home/widget/custom_elevated_bottom.dart';
import 'package:evently_app/home/widget/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.bold16Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.05),
              Center(child: Image.asset(AppAssets.logo, height: height * 0.2)),
              SizedBox(height: height * 0.04),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.name,
                      prifixIcon: Image.asset(AppAssets.iconEmail),
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.email,
                      prifixIcon: Image.asset(AppAssets.iconEmail),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter email';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(text);
                        if (!emailValid) {
                          return 'please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.password,
                      prifixIcon: Image.asset(AppAssets.iconPass),
                      suffixIcon: Image.asset(AppAssets.iconshowPass),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.re_password,
                      prifixIcon: Image.asset(AppAssets.iconPass),
                      suffixIcon: Image.asset(AppAssets.iconshowPass),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: repasswordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 're_password does not match password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    SizedBox(height: height * 0.02),
                    CustomElevatedBottom(
                      onPressed: register,
                      text: AppLocalizations.of(context)!.create_account,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.already_have_account}?',
                          style: AppStyles.bold16Black,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: AppStyles.bold16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(AppRoutes.homeRouteName, (route) => false);
    }
  }
}
