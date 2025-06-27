import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/core/themes/app_style.dart';
import '../bloc/book_cubit.dart';
import '../bloc/book_state.dart';
import 'book_form_page.dart';

@RoutePage()
class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookCubit>().loadBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Book Register App',
          style: AppStyles.text20PxBold.copyWith(color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            final books = state.books;
            if (books.isEmpty) {
              return const Center(child: Text("No books added yet."));
            }
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (_, i) {
                final book = books[i];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.12),
                        blurRadius: 4.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        book.name,
                        style: AppStyles.text20PxBold.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Book ID: ${book.id}',
                        style: AppStyles.text15PxRegular,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Author Name: ${book.author}',
                        style: AppStyles.text15PxRegular,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Price: ${book.price}',
                        style: AppStyles.text15PxRegular,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Publication Date: ${book.publicationDate}',
                        style: AppStyles.text15PxRegular,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<BookCubit>(),
                                    child: BookFormPage(book: book),
                                  ),
                                ),
                              );
                              if (result == true) {
                                context.read<BookCubit>().loadBooks(); 
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<BookCubit>().deleteBook(book.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is BookError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<BookCubit>(),
                child: const BookFormPage(),
              ),
            ),
          );
          if (result == true) {
            context.read<BookCubit>().loadBooks(); 
          }
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.whiteColor),
      ),
    );
  }
}
