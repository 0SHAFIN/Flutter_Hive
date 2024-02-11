import 'package:flutter/material.dart';
import 'package:flutter_practice/inputField.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var text = TextEditingController();
  var amount = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> listS = [];
  var box = Hive.box("Test data");
  void refreshData() {
    var data = box.keys.map((key) {
      var item = box.get(key);
      return {"key": key, "expense": item["expense"], "amount": item["amount"]};
    }).toList();
    setState(() {
      listS = data.reversed.toList();
      print("Data length: ${listS.length}");
    });
  }

  void addExpense(Map<String, dynamic> data) async {
    await box.add(data);
    refreshData();
  }

  void deleteItem(int index) {
    int tempindex = listS.length - index-1 ;
    print("Index: $index");
    box.deleteAt(tempindex);
    refreshData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: listS.length,
                  itemBuilder: (context, index) {
                    var data = listS[index];
                    return Card(
                      child: ListTile(
                        title: Text("${data["expense"]}"),
                        subtitle: Text("${data["amount"]}"),
                        trailing: IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: inputField(
                      hint: "Expense",
                      fieldController: text,
                      validator: (_) {}),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: inputField(
                      hint: "Amount",
                      fieldController: amount,
                      validator: (_) {}),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    addExpense({"expense": text.text, "amount": amount.text});
                    text.clear();
                    amount.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 59, 59, 59)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          //offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(child: Icon(Icons.add)),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
