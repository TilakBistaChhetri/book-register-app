import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/core/themes/app_style.dart';
import 'package:registerapp/core/widgets/custom_text_form_field.dart';
import 'package:registerapp/core/widgets/primary_button.dart';

import 'package:registerapp/features/auth/data/data_sources/login_remote_data_sources.dart';
import 'package:registerapp/features/auth/data/repository/login_repository_impl.dart';
import 'package:registerapp/features/auth/domain/usecases/login_usecases.dart';
import 'package:registerapp/features/auth/presentation/bloc/login_cubit.dart';
import 'package:registerapp/features/auth/presentation/bloc/login_state.dart';
import 'package:registerapp/features/get_delete/presentation/pages/get_page.dart';

@RoutePage()
class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final loginRemoteDataSource = LoginRemoteDataSourceImpl(dio);
    final repository = LoginRepositoryImpl(loginRemoteDataSource);
    final usecase = LoginUseCase(repository);

    return BlocProvider(
      create: (_) => LoginCubit(usecase),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Login',
          style: AppStyles.text20PxBold.copyWith(color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is LoginSuccess) {
              //context.pushRoute(const UserProfileRoute());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GetPage()));
             
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                CustomTextFormField(
                  controller: usernameController,
                  label: 'Username',
                ),

                SizedBox(height: 10.h),

                CustomTextFormField(
                  controller: passwordController,
                  label: 'Password',
                ),
                SizedBox(height: 20.h),
                PrimaryButton(
                  title: 'Login',
                  onPressed: () {
                    final username = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    context.read<LoginCubit>().login(username, password);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
