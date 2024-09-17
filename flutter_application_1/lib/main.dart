import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(EduFlareX());

class EduFlareX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduFlareX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MenuScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.book, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'EduFlareX',
              style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EduFlareX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MateriScreen(title: 'Apa Itu Komputer?')));
              },
              child: Text('Apa Itu Komputer?'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MateriScreen(title: 'Cara Menggunakan Komputer')));
              },
              child: Text('Cara Menggunakan Komputer'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MateriScreen(title: 'Hardware')));
              },
              child: Text('Hardware'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MateriScreen(title: 'Software')));
              },
              child: Text('Software'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MateriScreen(title: 'Virus')));
              },
              child: Text('Virus'),
            ),
          ],
        ),
      ),
    );
  }
}

class MateriScreen extends StatelessWidget {
  final String title;

  MateriScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ini adalah materi tentang $title',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Contoh materi terkait:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1. Pengertian komputer\n2. Bagaimana menggunakan komputer\n3. Komponen hardware\n4. Komponen software\n5. Virus komputer',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 100; // Simulasi skor
  String correctAnswer = "Hardware";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Salah satu komponen sistem komputer yang bersifat fisik, dapat dilihat dan disentuh adalah...',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Logika jawaban benar atau salah
                  if (correctAnswer == 'Hardware') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen(score: score)));
                  }
                });
              },
              child: Text('Software'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (correctAnswer == 'Hardware') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen(score: score)));
                  }
                });
              },
              child: Text('Hardware'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  final int score;

  ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skor Anda'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Skor Anda: $score',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Jawaban yang benar adalah "Hardware"',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}