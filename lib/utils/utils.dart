import 'package:shared_preferences/shared_preferences.dart';

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
  void saveAndGetStorageValues() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
  }

  void useAnimation() {
    // AnimationController controller;
    // Animation<Size> heightAnimation;
    // use with SingleTickerProviderMixed...
    // AnimationController(vsync: this, duration: Duration(300))
    // heightAnimation = Tween<Size>(begin: ,end:).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    //
    //heightAnimation.addListener(() => setState((){}));
    //controller.dispose()
    //heightAnimation.dispose();
    //
    // controller.forward();
    //
    // controller.reverse();
    //
    // Container( height: BoxContraints(minHeight: heightAnimation.value.height))
    //
    // You can use AnimateBuilder
    //
    // AnimatedContainerWidget
    //
    // FadeTransitionWidget
    //
    // use Hero for transitions between screens
    //
    //
    // CustomScrollView hide/show appbar
    // with slivers SliverAppBar(SliverAppBar(expandedHeight:, pinned: true, flexibleSpace: FlexibleSpaceBar(title: appBarTitle, background: ))),
    // SliverList( delegate: SliverChildLIstDelegate())
  }
}
