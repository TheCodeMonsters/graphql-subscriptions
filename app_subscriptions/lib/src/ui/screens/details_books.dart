import 'package:flutter/material.dart';

class DetailsBooks extends StatefulWidget {
  const DetailsBooks({
    Key? key,
    required this.title,
    required this.author,
    required this.published,
    required this.id,
  }) : super(key: key);

  final String title;
  final String author;
  final String published;
  final int id;

  @override
  State<DetailsBooks> createState() => _DetailsBooksState();
}

class _DetailsBooksState extends State<DetailsBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Details Books',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Text(
              'This is a book',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
