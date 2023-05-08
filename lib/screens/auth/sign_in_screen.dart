import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/providers/providers.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/tools/tools.dart';
import 'package:sales_app/widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
      ],
      child: const _SignInScreen(),
    );
  }
}

class _SignInScreen extends StatelessWidget {
  const _SignInScreen();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context);
    final size = MediaQuery.of(context).size;
    return ProjectBody2Widget(
      horizontalPadding: 0,
      isLoading: provider.isLoading,
      child: Stack(
        children: [
          const WaveAnimationWidget(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .1),
                  Center(
                    child: Text(
                      '¡Bienvenido!',
                      style: AppTypography.text26w400White1,
                    ),
                  ),
                  SizedBox(height: size.height * .05),
                  Text(
                    'Inicio de sesión de usuario',
                    style: AppTypography.text18w500White1,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: size.height * .02),
                  InputFieldWidget(
                    data: provider.data,
                    dataProperty: 'email',
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Correo electrónico',
                    onChanged: () => provider.checkEmptyData(),
                    validator: (value) =>
                        RegularExpressions().validateEmail(value),
                  ),
                  SizedBox(height: size.height * .03),
                  InputFieldWidget(
                    data: provider.data,
                    dataProperty: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Contraseña',
                    obscureText: provider.hiddenPassword,
                    onChanged: () => provider.checkEmptyData(),
                    suffixIcon: IconButton(
                      onPressed: () => provider.showPassword(),
                      icon: provider.hiddenPassword
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: ThemeColors.blue1,
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ThemeColors.blue1,
                            ),
                    ),
                  ),
                  SizedBox(height: size.height * .01),
                  CheckboxListTile(
                    activeColor: ThemeColors.blue1,
                    checkColor: ThemeColors.white1,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Recordar cuenta',
                      style: AppTypography.text14w400White1,
                    ),
                    value: provider.checkboxValue,
                    onChanged: (value) => provider.checkboxValue = value!,
                  ),
                  SizedBox(height: size.height * .05),
                  Center(
                    child: TextButton.icon(
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        provider.isLoading = true;
                        await Future.delayed(
                          const Duration(seconds: 3),
                        ).then(
                          (value) => Navigator.pushNamed(
                            context,
                            AppRoutes.homeScreen,
                          ),
                        );
                        provider.isLoading = false;
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Iniciar sesión'),
                    ),
                  ),
                  SizedBox(height: size.height * .1),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.signUpScreen,
                            ),
                            child: Text(
                              'Hazte miembro',
                              style: AppTypography.text13w400White1,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              '¿Contraseña olvidada?',
                              style: AppTypography.text13w400White1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
