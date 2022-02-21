import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'ui/screens/home_page.dart';

final HttpLink httpLink = HttpLink(
  'http://localhost:8080/',
);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Books',
        home: HomePage(title: 'Books'),
      ),
    );
  }
}
