import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/features/home/presentation/pages/book_page.dart';
import 'package:registerapp/features/home/presentation/bloc/book_cubit.dart';
import 'package:registerapp/features/home/data/repositories/book_repository_impl.dart';
import 'package:registerapp/features/home/domain/usecases/book_usecases.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          ),
          home: BlocProvider(
            create: (_) => BookCubit(BookUseCases(BookRepositoryImpl()))..loadBooks(),
            child: const BookPage(),
          ),
        );
      },
    );
  }
}
