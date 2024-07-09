void main() async {
  int time = 3;
  print(await getOrder(time: time, yourOrder: returnYourOrder(time: time),));
  
  print("=================");
  one().then((_) => two()).then((_) => three()).then((_) => four()).catchError((e) {
    print("got error: $e");
    return 42;
  }).then((value) => print("Value is $value"));
}

Future<String> getOrder ({required int time, required Future<String> yourOrder}) async {
  print("Loading your orders.....");
  var order;
  for(int i = 1; i <= time; i++){
    if( i == 1 ) {
      await Future.delayed(Duration(seconds: 1), () {
        print( "You have been waiting for ${i} second");
      });
    } else {
      await Future.delayed(Duration(seconds: 1), () {
        print("You have been waiting for ${i} seconds");
      });
    }
  }
  order = returnYourOrder(time: 1);
 return "Your order is ${await order}";
}


Future<String> returnYourOrder ({required int time}) {
  return Future.delayed(Duration(seconds: time), (){
    return "Hot Large Latte";
  });
}


Future<String> one (){
  return Future.value("from one");
}
Future<String> two (){
  return Future.error("error from two");
}
Future<String> three (){
  return Future.value("from three");
}
Future<String> four (){
  return Future.value("from four");
}

