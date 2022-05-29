import 'dart:math';

import 'package:delete_provider/models/httpprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete_Provider"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) => Image.network(
                    (value.data["avatar"] == null)
                        ? "https://graph.facebook.com/4/picture?type=square"
                        : value.data["avatar"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data["id"] == null
                      ? "ID : Belum Ada Data"
                      : "ID : ${value.data["id"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Name : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data["first_name"] == null &&
                          value.data["last_name"] == null
                      ? "Belum Ada Data"
                      : value.data["first_name"] + value.data["last_name"],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Email : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["email"] == null)
                      ? "Belum Ada Data"
                      : value.data["email"],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                dataProvider.connectAPI(
                    (1 + Random().nextInt(10)).toString(), context);
              },
              child: Text(
                "Get Data",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvider.deleteData(context);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
