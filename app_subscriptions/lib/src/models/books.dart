class Books {
  static String getAllBooks = """ 
      query getAllBooks {
        books{
          title
          author
          published
        }
      } 
    """;

  static String mutationAdd = """
    mutation {
      createBook (title: "Hola", author: "Hola", published: 2022, genres: []){
        title: title
        author: author
        published: published
        genres:genres
      }
    }
  """;
}
