import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_app/providers/providers.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/screens/screens.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StaffProvider()),
      ],
      child: const _StaffScreen(),
    );
  }
}

class _StaffScreen extends StatelessWidget {
  const _StaffScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<StaffProvider>(context);
    return ProjectBody2Widget(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Personal'),
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
      child: FutureBuilder(
        future: provider.getData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomCircularProgressWidget();
          } else {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              children: List<Widget>.generate(
                snapshot.data!.length,
                (int i) => GridTile(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => ProfileScreen(
                          index: snapshot.data![i]['id'],
                          email: snapshot.data![i]['email'],
                          name: snapshot.data![i]['name'],
                          role: snapshot.data![i]['role'],
                          urlImage: snapshot.data![i]['avatar'],
                        ),
                      ),
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Hero(
                                tag: snapshot.data![i]['id'],
                                child: FadeInImage(
                                  placeholder: AssetImage(GifsRoutes.loading2),
                                  image: NetworkImage(
                                    snapshot.data![i]['avatar'],
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * .01),
                              child: Text(
                                snapshot.data![i]['name'],
                                maxLines: 1,
                                style: AppTypography.text14w400Background1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
