import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'auth/forget_pass.dart';
import 'auth/login.dart';
import 'auth/register.dart';
import 'const/theme_data.dart';
import 'inner_screens/feeds_screen.dart';
import 'inner_screens/on_sale_screen.dart';
import 'inner_screens/product_details.dart';
import 'screens/btm_bar.dart';
import 'provider/dark_theme_provider.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/viewed_recently/viewed_recenty.dart';
import 'screens/wishlist/wishlist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
          // home: const LoginScreen(),
          home: const BottomBarScreen(),
          routes: {
            OnSaleScreen.routename: (ctx) => const OnSaleScreen(),
            FeedsScreen.routename: (ctx) => const FeedsScreen(),
            ProductDetails.routename: (ctx) => const ProductDetails(),
            WishListScreen.routename: (ctx) => const WishListScreen(),
            OrderScreen.routename: (ctx) => const OrderScreen(),
            ViewedRecently.routename: (ctx) => const ViewedRecently(),
            RegisterScreen.routename: (ctx) => const RegisterScreen(),
            LoginScreen.routename: (ctx) => const LoginScreen(),
            ForgetPassowrdScreen.routename: (ctx) =>
                const ForgetPassowrdScreen(),
          },
        );
      }),
    );
  }
}
