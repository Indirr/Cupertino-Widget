import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: CupertinoThemeData(brightness: Brightness.light),
        home: TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {
  int pilihIndex = 0;

  DateTime pilihTanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material & Cupertino"),
        backgroundColor: Color(0xFFDB7175)
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hari, tanggal dan bulan : ${DateFormat.yMd().format(pilihTanggal)}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Color(0xFFDB7175),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DatePickerDialog(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2023));
                          });
                    },
                    child: Text(
                      "Material Button",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CupertinoButton(
                      color: Color(0xFFDB7175),
                      child: Text("Date Picker",
                          style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 300,
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    backgroundColor: Color(0xFFDB7175),
                                    onDateTimeChanged: (tanggal) {
                                      print(tanggal);
                                      setState(() {
                                        pilihTanggal = tanggal;
                                      });
                                    }),
                              );
                            });
                      }),
                ],
              ),
            ],
          )),
    );
  }
}