import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  static final String path = 'detalleproducto';

  @override
  Widget build(BuildContext context) {
    //MovieModel movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://t1.rg.ltmcdn.com/es/images/2/4/9/img_pastel_de_fresa_23942_orig.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Pastel de chocolate',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '''During development, there are times when we may need to generate random numbers, alphabets, characters with a specified length. In this article, I will walk you through how to generate random string using that ‘dart:math‘ library.''',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Precio:',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                          Text(
                            'L99.00',
                            style: TextStyle(
                                fontSize: 25.0, color: Colors.green[800]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tipo:',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.grey[800]),
                          ),
                          Text(
                            'Chocolate',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.green[800]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Mandar a carrito'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
