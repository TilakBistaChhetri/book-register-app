// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:registerapp/core/themes/app_colors.dart';
// import 'package:registerapp/features/home/presentation/pages/book_page.dart';
// import 'package:registerapp/features/home/presentation/bloc/book_cubit.dart';
// import 'package:registerapp/features/home/data/repositories/book_repository_impl.dart';
// import 'package:registerapp/features/home/domain/usecases/book_usecases.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
//           ),
//           home: BlocProvider(
//             create: (_) => BookCubit(BookUseCases(BookRepositoryImpl()))..loadBooks(),
//             child: const BookPage(),
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:registerapp/core/routes/app_routes.dart'; // Import your router
// import 'package:registerapp/core/themes/app_colors.dart';

// final _appRouter = AppRouter();  // Initialize the router

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(
//               seedColor: AppColors.primaryColor,
//             ),
//           ),
//           routerConfig: _appRouter.config(),  // Set the router config here
//         );
//       },
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registerapp/core/routes/app_routes.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/features/get_delete/data/data_sources/get_remote_data_sources.dart';
import 'package:registerapp/features/get_delete/data/repository/get_repository_impl.dart';
import 'package:registerapp/features/get_delete/domain/usecases/get_usecase.dart';
import 'package:registerapp/features/get_delete/presentation/bloc/get_cubit.dart';

final _appRouter = AppRouter();

void main() {
  final dio = Dio();

  final remoteDataSource = GetRemoteDataSource(dio);

  final repository = GetRepositoryImpl(remoteDataSource);

  final getUseCase = GetUseCase(repository);

  runApp(
    BlocProvider(create: (_) => GetCubit(getUseCase), child: const MyApp()),
  );
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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
            ),
          ),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
