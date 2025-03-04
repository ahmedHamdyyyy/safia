abstract class DatabaseService {
  /// Adds data to the given path in the database
  ///
  /// path is the path in the database where the data should be stored
  /// data is the data to be stored in the database
  ///
  /// Returns a Future that resolves when the data has been added to the
  /// database
  ///
  /// If the data cannot be added to the database, the returned Future will
  /// complete with an error
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> userData,
      String? docId});

  /// Gets data from the given path in the database at the given docId

  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? queryData,
  });
  Future<bool> checkIfDataExists({required String path, required String docId});
  Future<void> addProductToBasket(String productId);
}
