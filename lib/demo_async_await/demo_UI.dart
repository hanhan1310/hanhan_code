import 'package:flutter/material.dart';

class DemoUIasyncAwait extends StatefulWidget {
  const DemoUIasyncAwait({super.key});

  @override
  State<DemoUIasyncAwait> createState() => _DemoUIasyncAwaitState();
}

class _DemoUIasyncAwaitState extends State<DemoUIasyncAwait> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                  border: Border.all(width: 3),
                ),
                child: Center(
                  child: Text(
                    "Press",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: delayed(3),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("?");
                  } else {
                    if (snapshot.hasData){
                      return Container(
                          height: 20,
                        width: 20,
                        color: Colors.red,
                        );
                    }else {
                      return Text("khong co");
                    }
                  }
                },),
          ],
        ),
      ),
    );
  }

  Future delayed(int seconds) async {
    await Future.delayed(
      Duration(seconds: seconds),
    );
    return seconds;
  }
}
