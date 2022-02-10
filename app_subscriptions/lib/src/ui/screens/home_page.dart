import 'package:app_subscriptions/src/models/books.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

                return ListTile(
                  title: Text(book['title']),
                  subtitle: Text(book['author']),
                  trailing: Text(book['published'].toString()),
                );
              },
            );
          }),
    );
  }
}
