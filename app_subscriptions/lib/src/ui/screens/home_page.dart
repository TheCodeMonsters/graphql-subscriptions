import 'package:app_subscriptions/src/models/books.dart';
import 'package:app_subscriptions/src/ui/screens/details_books.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Query(
          options: QueryOptions(document: gql(Books.getAllBooks)),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            List books = result.data?['books'];

            // print(books)

            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text(book['title']),
                    subtitle: Text(
                      book['genres'].toString() + " " + book['author'],
                    ),
                    trailing: Text(book['published'].toString()),
                    leading: const Icon(
                      Icons.book,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsBooks(
                            title: book['title'],
                            author: book['author'],
                            published: book['published'],
                            id: book['id'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
