import 'package:flutter/material.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/themes.dart';

class BusinessCardWidget extends StatelessWidget {
  final int index;
  final String urlImage;
  final String description;
  final Widget content;
  const BusinessCardWidget({
    super.key,
    required this.content,
    required this.description,
    required this.index,
    required this.urlImage,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: [
            ThemeColors.blue1,
            ThemeColors.purple1,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * .25,
            child: Stack(
              children: [
                Container(
                  height: size.height * .19,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    ImageRoutes.wallpaper,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: size.width * .05,
                  child: CircleAvatar(
                    backgroundColor: ThemeColors.background,
                    radius: size.width * .12,
                    child: Hero(
                      tag: index,
                      child: CircleAvatar(
                        backgroundColor: ThemeColors.background,
                        backgroundImage: NetworkImage(urlImage),
                        radius: size.width * .11,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * .05,
                  right: size.width * .05,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.purple1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        description,
                        style: AppTypography.text16w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          content,
        ],
      ),
    );
  }
}
