import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:registerapp/core/routes/app_routes.gr.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/core/themes/my_assets.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    moveToOnBoard();
    super.initState();
  }

  moveToOnBoard() async {
    await Future.delayed(Duration(seconds: 1), () {
    context.router.push(LoginRouteWrapper());
  
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(child: Image.asset(MyAssets.book)),
    );
  }
}
