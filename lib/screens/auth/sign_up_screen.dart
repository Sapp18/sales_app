import 'package:flutter/material.dart';
import 'package:sales_app/providers/providers.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/tools/tools.dart';
import 'package:sales_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ],
      child: const _SignUpScreen(),
    );
  }
}

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    final size = MediaQuery.of(context).size;
    return ProjectBodyWidget(
      horizontalPadding: 0,
      isLoading: provider.isLoading,
      appBar: AppBar(
        backgroundColor: ThemeColors.blue1,
        title: const Text(
          '¡Hazte miembro!',
        ),
        centerTitle: true,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipBehavior: Clip.hardEdge,
            clipper: CardClipPath(),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.blue1.withOpacity(.5),
                    ThemeColors.blue1.withOpacity(1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Por favor, ingresa tus datos para crear tu cuenta.',
                  style: AppTypography.text14w400White1,
                ),
                SizedBox(height: size.height * .04),
                InputFieldWidget(
                  data: provider.data,
                  dataProperty: 'name',
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Nombre(s)',
                  onChanged: () => provider.checkEmptyData(),
                  validator: (value) =>
                      RegularExpressions().validateEmail(value),
                ),
                SizedBox(height: size.height * .02),
                InputFieldWidget(
                  data: provider.data,
                  dataProperty: 'surname',
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Primer apellido',
                  onChanged: () => provider.checkEmptyData(),
                  validator: (value) =>
                      RegularExpressions().validateEmail(value),
                ),
                SizedBox(height: size.height * .02),
                InputFieldWidget(
                  data: provider.data,
                  dataProperty: 'second_surname',
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Segundo apellido (opcional)',
                  onChanged: () => provider.checkEmptyData(),
                  validator: (value) =>
                      RegularExpressions().validateEmail(value),
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
                SizedBox(height: size.height * .02),
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
                SizedBox(height: size.height * .05),
                TextButton.icon(
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
                  icon: const Icon(Icons.person_add_alt_1),
                  label: const Text('Crear cuenta'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: DividerWidget(),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.signInScreen,
                  ),
                  child: Text(
                    'Iniciar sesión',
                    style: AppTypography.text14w400White1,
                  ),
                ),
                SizedBox(height: size.height * .03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
