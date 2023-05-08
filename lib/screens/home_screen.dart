import 'package:flutter/material.dart';
import 'package:sales_app/providers/providers.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final size = MediaQuery.of(context).size;
    return ProjectBodyWidget(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Principal'),
        actions: [
          IconButton(
            tooltip: 'Buscar',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const SideMenu(),
      horizontalPadding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Categorías',
              style: AppTypography.text20w500,
            ),
          ),
          SizedBox(
            height: size.height * .25,
            child: FutureBuilder(
              future: provider.getData(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomCircularProgressWidget();
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, int i) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .02),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColors.onBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '¡Tiene que ser tuyo!',
                                  style: AppTypography.text12w400,
                                ),
                                SizedBox(
                                  height: size.height * .15,
                                  child: FadeInImage(
                                    placeholder:
                                        AssetImage(GifsRoutes.loading2),
                                    image: NetworkImage(
                                      snapshot.data![i]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                    imageErrorBuilder: (_, __, ___) =>
                                        Image.asset(
                                      ImageRoutes.error,
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data![i]['name'],
                                  style: AppTypography.text14w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Productos',
              style: AppTypography.text20w500,
            ),
          ),
        ],
      ),
    );
  }
}
