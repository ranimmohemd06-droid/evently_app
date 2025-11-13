import 'package:evently_app/auth/login/login_navigator.dart';
import 'package:evently_app/auth/login/login_view_model.dart';
import 'package:evently_app/home/widget/custom_elevated_bottom.dart';
import 'package:evently_app/home/widget/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginViewModel viewModel = LoginViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.05),
                  Center(
                    child: Image.asset(AppAssets.logo, height: height * 0.2),
                  ),
                  SizedBox(height: height * 0.04),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          hintText: AppLocalizations.of(context)!.email,
                          prifixIcon: Image.asset(AppAssets.iconEmail),
                          keyboardType: TextInputType.emailAddress,
                          controller: viewModel.emailController,
                          validator: (text) {
                            if (text == null || text
                                .trim()
                                .isEmpty) {
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
                          controller: viewModel.passwordController,
                          validator: (text) {
                            if (text == null || text
                                .trim()
                                .isEmpty) {
                              return 'please enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '${AppLocalizations.of(context)!
                                  .forget_password}?',
                              style: AppStyles.bold16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        CustomElevatedBottom(
                          onPressed: viewModel.login,
                          text: AppLocalizations.of(context)!.login,
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.do_not_have_an_account,
                              style: AppStyles.bold16Black,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.registerRouteName);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.create_account,
                                style: AppStyles.bold16Primary.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.primaryLight,
                                thickness: 2,
                                indent: width * 0.04,
                                endIndent: width * 0.04,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.or,
                              style: AppStyles.medium16primary,
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.primaryLight,
                                thickness: 2,
                                indent: width * 0.04,
                                endIndent: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedBottom(
                          onPressed: () {},
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.primaryLight,
                          hasIcon: true,
                          ChildIconWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.iconGoogle),
                              SizedBox(width: width * 0.04),
                              Text(
                                AppLocalizations.of(context)!.login_with_google,
                                style: AppStyles.medium20primary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void login() async {
  // if (formKey.currentState?.validate() == true) {
  //viewModel.login();
  //}
  //}

  @override
  void hideMyLoading() {
    DialogUtils.hideLoading(context: context);
  }

  @override
  void showMyLoading({required String message}) {
    DialogUtils.showLoading(context: context, message: message);
  }

  @override
  void showMyMessage({required String message}) {
    DialogUtils.showMessage(context: context, message: message,
        posActionName: 'ok');
  }
}