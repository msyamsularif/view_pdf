import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:example_view_pdf/scale.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromURL(
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : PDFViewer(document: _pdf),
      ),
    );
  }
}
