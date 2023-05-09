import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

class DetailsProductScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const DetailsProductScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ProjectBodyWidget(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Producto - ${data['id'].toString()}'),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart_rounded),
              label: const Text('Agregar al carrito'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.my_library_add_rounded),
              label: const Text('Comprar ahora'),
            ),
          ],
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Nuevo | +100 vendidos',
                  style: AppTypography.text12w400,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.purple1,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'MÁS VENDIDO',
                    style: AppTypography.text12w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .02),
          Text(
            data['title'].toString(),
            style: AppTypography.text26w500,
          ),
          SizedBox(height: size.height * .02),
          SizedBox(
            height: size.height * .3,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data['images'].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int i) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                  child: Image.network(data['images'][i]),
                );
              },
            ),
          ),
          SizedBox(height: size.height * .02),
          Text(
            '\$ ${data['price'].toStringAsFixed(2)} MXN',
            style: AppTypography.text26w500,
          ),
          TextRichWith3Widget(
            text1: 'en ',
            text2:
                '12x \$ ${(data['price'] / 12).toStringAsFixed(2)} MXN sin interés',
            color: Colors.greenAccent,
          ),
          Text(
            'Ver los medios de pago',
            style: AppTypography.text14w400Blue1,
          ),
          SizedBox(height: size.height * .01),
          TextRichWith3Widget(
            text1: 'Categoría del producto: ',
            text2: data['categoryName'],
            color: ThemeColors.blue1,
          ),
          Center(
            child: Image.network(
              data['categoryImage'],
              height: size.height * .25,
            ),
          ),
          SizedBox(height: size.height * .03),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.delivery_dining_rounded,
                size: 35,
                color: Colors.greenAccent,
              ),
              SizedBox(width: size.width * .02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Llega gratis mañana',
                      style: AppTypography.text14w400
                          .copyWith(color: Colors.greenAccent),
                    ),
                    Text(
                      'Comprando dentro de las próximas 2 h 10 min',
                      style: AppTypography.text14w400,
                    ),
                    Text(
                      'Enviar a Av Siempre Viva 742',
                      style: AppTypography.text14w400Blue1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .03),
          Text(
            'Lo que tienes que saber de este producto',
            style: AppTypography.text18w500,
          ),
          Text(
            data['description'].toString(),
            style: AppTypography.text14w400,
          ),
          SizedBox(height: size.height * .03),
        ],
      ),
    );
  }
}
