import 'package:finger_game/models/orderlist.dart';
import 'package:finger_game/models/product.dart';
import 'package:finger_game/models/sampleproducts.dart';
import 'package:finger_game/pages/homePage.dart';
import 'package:finger_game/provider/cartprovider.dart';
import 'package:finger_game/provider/localeprovider.dart';
import 'package:finger_game/provider/orderlistprovider.dart';
import 'package:finger_game/provider/productprovider.dart';
import 'package:finger_game/provider/translateprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:finger_game/l10n/app_localizations.dart';

// Generated localization import


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive initialization
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(OrderListAdapter());
  await Hive.openBox<Product>('cartbox');
  await Hive.openBox<OrderList>('orderbox');
  var box = await Hive.openBox<Product>('products');
 // await box.clear();

  // Add sample products ONLY if box is empty
  if (box.isEmpty) {
    for (var p in sampleproducts) {
      await box.put(p.id, p);}}

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context)=>Localeprovider()),
        ChangeNotifierProvider(create: (context)=>Orderlistprovider()),
        ChangeNotifierProvider(create: (context)=>Productprovider()),
        ChangeNotifierProvider(create: (context)=>TranslateProvider())
       
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 

  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 915),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (context, child) {
      return Consumer<Localeprovider>(builder: (context, value, child) => 
       MaterialApp(
        debugShowCheckedModeBanner: false,
       
      locale: value.locale,
      supportedLocales:AppLocalizations.supportedLocales,
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      
      
      
        home: Homepage(),
        
      ),
    );
  });
  }
}
