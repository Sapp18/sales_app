import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  final int index;
  final String? email;
  final String? name;
  final String? role;
  final String? urlImage;
  const ProfileScreen({
    Key? key,
    required this.index,
    this.email,
    this.name,
    this.role,
    this.urlImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ProjectBodyWidget(
      horizontalPadding: 0,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal - $index'),
      ),
      child: Column(
        children: [
          _PersonInfo(
            index: index,
            fullName: name ?? '',
            birthday: '22 - Abril - 1969',
            position: role,
            profileImg: urlImage,
          ),
          SizedBox(height: size.height * .015),
          _ContactInfo(
            phoneNumber: '+52 12 3456 7890',
            email: email ?? '',
          ),
          SizedBox(height: size.height * .015),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final String? phoneNumber;
  final String email;
  const _ContactInfo({this.phoneNumber = '', required this.email});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: ThemeColors.onBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * .02),
          phoneNumber == ''
              ? Container()
              : ListTile(
                  title: Text(
                    'Número telefónico:',
                    style: AppTypography.text16w500,
                  ),
                  subtitle: Text(
                    phoneNumber!,
                    style: AppTypography.text14w500,
                  ),
                  trailing: IconButton(
                    onPressed: () => Clipboard.setData(
                      ClipboardData(text: phoneNumber!),
                    ).then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Número telefónico copiado en portapapeles.',
                          ),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.copy_rounded,
                    ),
                  ),
                ),
          ListTile(
            title: Text(
              'Correo electrónico:',
              style: AppTypography.text16w500,
            ),
            subtitle: Text(
              email,
              style: AppTypography.text14w500,
            ),
            trailing: IconButton(
              onPressed: () => Clipboard.setData(
                ClipboardData(text: email),
              ).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Correo electrónico copiado en portapapeles.',
                    ),
                  ),
                ),
              ),
              icon: const Icon(
                Icons.copy_rounded,
              ),
            ),
          ),
          SizedBox(height: size.height * .02),
        ],
      ),
    );
  }
}

class _PersonInfo extends StatelessWidget {
  final int index;
  final String fullName;
  final String? birthday;
  final String? position;
  final String? profileImg;
  const _PersonInfo({
    required this.fullName,
    required this.index,
    this.birthday = '',
    this.position = '',
    this.profileImg = '',
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: ThemeColors.onBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * .35,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * .25,
                  width: double.infinity,
                  child: Image.asset(
                    ImageRoutes.wallpaper,
                    fit: BoxFit.cover,
                  ),
                ),
                profileImg == ''
                    ? Container()
                    : Positioned(
                        bottom: 0,
                        left: size.width * .05,
                        child: CircleAvatar(
                          backgroundColor: ThemeColors.background,
                          radius: size.height * .10,
                          child: Hero(
                            tag: index,
                            child: CircleAvatar(
                              backgroundColor: ThemeColors.background,
                              backgroundImage: NetworkImage(
                                profileImg!,
                              ),
                              radius: size.height * .09,
                            ),
                          ),
                        ),
                      ),
                position == ''
                    ? Container()
                    : Positioned(
                        bottom: size.height * .08,
                        right: size.width * .05,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeColors.purple1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              position!,
                              style: AppTypography.text16w500,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              fullName,
              style: AppTypography.text18w500,
            ),
            subtitle: Text(
              birthday!,
              style: AppTypography.text14w500,
            ),
          ),
        ],
      ),
    );
  }
}
