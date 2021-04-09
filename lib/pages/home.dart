import 'package:bakeryapp/pages/detalle_producto.dart';
import 'package:bakeryapp/pages/login.dart';
import 'package:bakeryapp/provider/firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const path = 'home';
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bakery'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://aws.glamour.mx/prod/designs/v1/assets/620x355/160318.jpg'),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        """https://api.culture.pl/sites/default/files/styles/1920_auto/public/2019-12/piekarnia_ag1.jpg?itok=YiLObxo-""",
                      ),
                    )),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.path);
                },
                leading: Icon(Icons.person),
                title: Text('Inicio de sesion'),
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: FirestoreService().obtenerPasteles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(DetalleProducto.path);
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            height: 300,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data[i]["pictureUrl"],
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(snapshot.data[i]["nombre"]),
                          Text(snapshot.data[i]["precio"].toString()),
                        ],
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
