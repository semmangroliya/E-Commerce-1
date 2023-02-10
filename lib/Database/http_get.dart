import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'http_get_model.dart';
import 'http_get_services.dart';

class HTTPGET extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HTTPGETState();
  }
}

class HTTPGETState extends State<HTTPGET> {
  HttpServices httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "https get",
        ),
      ),
      body: FutureBuilder(
        future: httpServices.getData(),
        builder: (context, snap) {
          if (snap.hasData) {
            List<Model> dataList = snap.data as List<Model>;
            return ListView(
              children: dataList
                  .map((e) => ListTile(
                        title: Text(e.id.toString()),
                        subtitle: Text(e.name.toString()),
                        trailing: Text(e.email.toString()),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(itemHolder: dataList)));
                        },
                      ))
                  .toList(),
            );
          }
          return Center(
            child: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_ooz0q1ne.json'),
          );
        },
      ),
    );
  }
}

class Detail extends StatefulWidget {
  List itemHolder;

  Detail({required this.itemHolder});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: ListView.builder(
        itemCount: widget.itemHolder.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text(
                'Id: ${widget.itemHolder[index].id}'
                '\n\nName: ${widget.itemHolder[index].name}'
                '\n\nUser Name: ${widget.itemHolder[index].username}'
                '\n\nEmail: ${widget.itemHolder[index].email}'
                '\n\nAddress: ${widget.itemHolder[index].address.street},\n\n'
                '${widget.itemHolder[index].address.suite},\n\n'
                '${widget.itemHolder[index].address.city}-'
                '${widget.itemHolder[index].address.zipcode}'
                '\n\nGeo: (lat: ${widget.itemHolder[index].address.geo.lat},'
                'lng: ${widget.itemHolder[index].address.geo.lng})'
                '\n\nPhone: ${widget.itemHolder[index].phone}'
                '\n\nWebsite: ${widget.itemHolder[index].website}'
                '\n\nCompany Name: ${widget.itemHolder[index].company.name}'
                '\n\nCompany catchPhrase: ${widget.itemHolder[index].company.catchPhrase}'
                '\n\nCompany bs: ${widget.itemHolder[index].company.bs}\n\n',
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
