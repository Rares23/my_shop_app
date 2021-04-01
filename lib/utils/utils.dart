class Utils {
  // create future example
  Future<String> futureTest() {
    return Future(() {
      return 'Hello';
    }).then((value) => null).catchError((error) => throw error);
  }

  Future<String> asyncTest() async {
    await futureTest();
  }

  //THIS SHOULD GO IN STATEFULL WIDGETS
  void forInitState() {
    Future.delayed(Duration.zero).then((_) {
      //use providers context here
    });
  }

  //YOU CAN USE FutureBuilde in widgets
  void futureBuilderTest() {
    // return FutureBuilder();
  }

  //Used for transformations
  void transform() {
    // Matrix4; this class is used to transform widgets
  }

  void useDOtDot() {
    //Matrix4.rotate()..transform(); this .. it returns the result of rotate, cascade operator
  }

  void customCatch() {
    // try {} on XXXExcetpoion catch (error) {} catch(error) {}
  }

  // Using Storage for saving settings and user data
  void saveAndGetStorageValues() {}
}
