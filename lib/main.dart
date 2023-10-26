import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  List<int> primeNumbers = [];

  void allPrimeNumbers(int value) {
    primeNumbers.clear();
    for (var i = 2; i <= value; i++) {
      var isPrime = true;
      for (var j = 2; j < i; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        primeNumbers.add(i);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  int? value = int.tryParse(_controller.text);
                  if (value != null) {
                    allPrimeNumbers(value);
                  }
                },
                child: Text('Check the prime numbers'),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: primeNumbers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${primeNumbers[index]}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Column(
                  children: [
                    ButtonBar(
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.github),
                          onPressed: () async {
                            const url = 'https://github.com/kn00pers';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          color: Colors.deepPurpleAccent.shade700,
                          iconSize: 35.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}