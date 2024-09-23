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
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildMenuButton(
                context, 'Apa Itu Komputer?', MateriScreen(title: 'Apa Itu Komputer?')),
            SizedBox(height: 16),
            buildMenuButton(context, 'Cara Menggunakan Komputer',
                MateriScreen(title: 'Cara Menggunakan Komputer')),
            SizedBox(height: 16),
            buildMenuButton(context, 'Hardware', MateriScreen(title: 'Hardware')),
            SizedBox(height: 16),
            buildMenuButton(context, 'Software', MateriScreen(title: 'Software')),
            SizedBox(height: 16),
            buildMenuButton(context, 'Virus', MateriScreen(title: 'Virus')),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context, String title, Widget screen) {
    return MaterialButton(
      color: Colors.blue[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      minWidth: double.infinity,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
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
        child: ListView(
          children: <Widget>[
            Text(
              _getMateriContent(title),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizScreen(title: title); // Go to corresponding quiz
                }));
              },
              child: Text('Mulai Kuis'),
            ),
          ],
        ),
      ),
    );
  }

  String _getMateriContent(String title) {
    switch (title) {
      case 'Apa Itu Komputer?':
        return '''
Pengertian Komputer:
Komputer adalah perangkat elektronik yang dapat menerima data, memprosesnya sesuai dengan program yang diberikan, dan menghasilkan output berupa informasi. Komputer bekerja dengan prinsip logika dan aritmatika, yang membuatnya mampu menyelesaikan berbagai tugas dengan akurat dan cepat.
''';

      case 'Cara Menggunakan Komputer':
        return '''
Bagaimana Menggunakan Komputer:
• Menyalakan Komputer: Tekan tombol power pada CPU dan monitor, tunggu hingga sistem operasi (seperti Windows atau macOS) muncul di layar.
• Penggunaan Dasar: Setelah komputer menyala, pengguna dapat menjalankan berbagai program sesuai kebutuhan seperti aplikasi perkantoran, browser untuk internet, atau aplikasi media.
• Shutdown: Setelah selesai menggunakan, pastikan untuk mematikan komputer dengan benar melalui menu "Start" dan pilih "Shutdown" untuk mencegah kerusakan data.
''';

      case 'Hardware':
        return '''
Komponen Hardware:
Hardware merupakan komponen fisik komputer yang bisa dilihat dan disentuh. Beberapa komponen hardware utama adalah:
• CPU (Central Processing Unit): Otak dari komputer yang melakukan semua pengolahan data.
• Motherboard: Papan sirkuit utama yang menghubungkan semua komponen komputer.
• RAM (Random Access Memory): Memori sementara yang digunakan komputer untuk menyimpan data saat sedang dioperasikan.
• Hard Drive (HDD/SSD): Tempat penyimpanan data yang permanen seperti dokumen, program, dan sistem operasi.
• Monitor: Perangkat output yang menampilkan informasi secara visual.
• Keyboard & Mouse: Perangkat input yang digunakan untuk memasukkan perintah ke komputer.
''';

      case 'Software':
        return '''
Komponen Software:
Software adalah program atau aplikasi yang diinstal di dalam komputer untuk menjalankan berbagai fungsi. Beberapa kategori software adalah:
• Sistem Operasi: Perangkat lunak dasar yang mengelola semua hardware dan software di komputer (contoh: Windows, Linux, macOS).
• Aplikasi Perkantoran: Seperti Microsoft Office (Word, Excel, PowerPoint) untuk pengolahan data kantor.
• Browser: Untuk mengakses internet (contoh: Google Chrome, Mozilla Firefox).
• Antivirus: Untuk melindungi komputer dari serangan malware dan virus.
''';

      case 'Virus':
        return '''
Virus Komputer:
Virus komputer adalah program berbahaya yang dapat merusak atau mengganggu kinerja komputer. Virus ini bisa menyebar dari satu komputer ke komputer lain melalui file, email, atau internet. Beberapa jenis virus yang umum antara lain:
• Trojan Horse: Bersembunyi di balik program yang tampak normal dan dapat mencuri data atau mengontrol sistem komputer.
• Worms: Virus yang menyebar melalui jaringan tanpa bantuan pengguna.
• Ransomware: Memblokir akses ke komputer atau file dan meminta tebusan untuk mengembalikannya.
''';

      default:
        return 'Materi belum tersedia.';
    }
  }
}

class QuizScreen extends StatelessWidget {
  final String title;

  QuizScreen({required this.title});

  final Map<String, List<Question>> quizQuestions = {
    'Apa Itu Komputer?': [
      Question('Apa pengertian dari komputer?', {
        'A. Alat komunikasi untuk bertukar informasi secara cepat': false,
        'B. Perangkat elektronik yang dapat memproses data menjadi informasi': true,
        'C. Alat untuk mencetak dokumen dan gambar': false,
        'D. Alat untuk memutar musik dan video': false,
      }),
    ],
    'Cara Menggunakan Komputer': [
      Question('Langkah pertama yang harus dilakukan untuk menyalakan komputer adalah?', {
        'A. Membuka aplikasi': false,
        'B. Menekan tombol power pada CPU': true,
        'C. Memasang keyboard dan mouse': false,
        'D. Menghubungkan komputer ke internet': false,
      }),
    ],
    'Hardware': [
      Question('Manakah yang termasuk komponen hardware?', {
        'A. Sistem Operasi': false,
        'B. Microsoft Word': false,
        'C. CPU': true,
        'D. Google Chrome': false,
      }),
    ],
    'Software': [
      Question('Yang merupakan contoh software adalah?', {
        'A. RAM': false,
        'B. Hard Drive': false,
        'C. Windows 10': true,
        'D. Monitor': false,
      }),
    ],
    'Virus': [
      Question('Apa yang dimaksud dengan virus komputer?', {
        'A. Perangkat keras yang rusak': false,
        'B. Program berbahaya yang dapat merusak atau mengganggu komputer': true,
        'C. Program untuk mempercepat kinerja komputer': false,
        'D. Perangkat lunak yang digunakan untuk membuat dokumen': false,
      }),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final questions = quizQuestions[title] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis: $title'),
      ),
      body: questions.isEmpty
          ? Center(child: Text('Tidak ada kuis tersedia untuk materi ini.'))
          : QuizWidget(questions: questions),
    );
  }
}

class QuizWidget extends StatefulWidget {
  final List<Question> questions;

  QuizWidget({required this.questions});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, bool> answers = {};

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pertanyaan ${currentQuestionIndex + 1}/${widget.questions.length}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(currentQuestion.question),
          ...currentQuestion.options.keys.map((option) {
            return RadioListTile<bool>(
              title: Text(option),
              value: currentQuestion.options[option]!,
              groupValue: answers[currentQuestionIndex],
              onChanged: (value) {
                setState(() {
                  answers[currentQuestionIndex] = value!;
                  if (value) score++;
                });
              },
            );
          }).toList(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: currentQuestionIndex + 1 < widget.questions.length
                ? () {
                    setState(() {
                      currentQuestionIndex++;
                    });
                  }
                : () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Kuis Selesai!'),
                              content: Text('Skor Anda: $score'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Tutup'))
                              ],
                            ));
                  },
            child: Text(currentQuestionIndex + 1 < widget.questions.length
                ? 'Pertanyaan Selanjutnya'
                : 'Selesai'),
          )
        ],
      ),
    );
  }
}

class Question {
  final String question;
  final Map<String, bool> options;

  Question(this.question, this.options);
}
