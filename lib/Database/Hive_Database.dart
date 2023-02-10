import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HIVE extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HIVEStat();
  }
}

class HIVEStat extends State<HIVE> {
  Box? friendBox;
  var id = TextEditingController();
  var name = TextEditingController();
  var rollno = TextEditingController();
  var number = TextEditingController();

  @override
  void initState() {
    friendBox = Hive.box('Friends');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hive Database',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: friendBox!.listenable(),
              builder: (context, Box friend, child) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final key = friend.keys.toList()[index];
                      final value = friend.get(key);

                      return ListTile(
                        title: Text(
                          value,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        subtitle: Text(
                          key,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: friend.keys.toList().length);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                'Add value',
                                style: GoogleFonts.rubik(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'ID',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  controller: id,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'NAME',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  controller: name,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                friendBox!.put(id.text, name.text);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Submit',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                'Update value',
                                style: GoogleFonts.rubik(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'ID',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  controller: id,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'NAME',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  controller: name,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                friendBox!.put(id.text, name.text);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Submit',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                'Delete value',
                                style: GoogleFonts.rubik(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'ID',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  controller: id,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                friendBox!.delete(id.text);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Submit',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Delete',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
