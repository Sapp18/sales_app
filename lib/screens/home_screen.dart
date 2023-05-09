import 'package:flutter/material.dart';
import 'package:sales_app/providers/providers.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/screens/screens.dart';
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
              future: provider.getCategories(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomCircularProgressWidget();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
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
          FutureBuilder(
            future: provider.getProducts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomCircularProgressWidget();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (_, int i) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: size.height * .01),
                      color: ThemeColors.onBackground,
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsProductScreen(
                              data: {
                                'id': snapshot.data![i]['id'],
                                'title': snapshot.data![i]['title'],
                                'price': snapshot.data![i]['price'],
                                'description': snapshot.data![i]['description'],
                                'categoryName': snapshot.data![i]['category']
                                    ['name'],
                                'categoryImage': snapshot.data![i]['category']
                                    ['image'],
                                'images': snapshot.data![i]['images'],
                              },
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: size.height * .015,
                          horizontal: size.width * .04,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: ThemeColors.onBackground,
                          backgroundImage: NetworkImage(
                            snapshot.data![i]['category']['image'],
                          ),
                        ),
                        title: Text(
                          snapshot.data![i]['title'],
                          style: AppTypography.text18w500,
                        ),
                        subtitle: Text(
                          snapshot.data![i]['description'],
                          maxLines: 2,
                          style: AppTypography.text16w400,
                        ),
                        trailing: Text(
                          '\$${snapshot.data![i]['price'].toString()}',
                          style: AppTypography.text16w500,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
