class Books {
  static String getAllBooks = """ 
      query getAllBooks {
        books{
          title
          author
          published
          genres
        }
      } 
    """;

  static String mutationAdd = """
    mutation addBook(\$title: String!, \$author: String!, \$published: Int!) {
        insert_books(objects: 
              {
                title: \$title, 
                author: \$author, 
                published: \$published
              }){
                affected_rows
              } 
        }
    }
  """;

  static String mutationDelete = """
      mutation deleteBook(\$id: ID!) {
        delete_Book(where: {id: {_eq: \$id}}) {
          affected_rows
        }
      }
  """;
}
