import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/core/themes/app_style.dart';
import '../../domain/entities/book.dart';
import '../bloc/book_cubit.dart';
import '../bloc/book_state.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../domain/usecases/book_usecases.dart';
@RoutePage()
class BookPage extends StatelessWidget {
  const BookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          BookCubit(BookUseCases(BookRepositoryImpl()))..loadBooks(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Book Register App',
            style:
                AppStyles.text20PxBold.copyWith(color: AppColors.whiteColor),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            if (state is BookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookLoaded) {
              final books = state.books;
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (_, i) {
                  final book = books[i];
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.12),
                          blurRadius: 4.r,
                          offset: Offset(0, 2),
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
                              onPressed: () => _showForm(context, book),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  context.read<BookCubit>().deleteBook(
                                        book.id,
                                      ),
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
          onPressed: () => _showForm(context),
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.add, color: AppColors.whiteColor),
        ),
      ),
    );
  }
  void _showForm(BuildContext context, [Book? book]) {
    final oldId = book?.id;
    final idController = TextEditingController(text: book?.id ?? '');
    final nameController = TextEditingController(text: book?.name);
    final authorController = TextEditingController(text: book?.author);
    final priceController = TextEditingController(text: book?.price);

 
    String selectedDateStr = book?.publicationDate ?? '';

    final dateController = TextEditingController(text: selectedDateStr);

    Future<void> _pickDate() async {
      DateTime initialDate = DateTime.now();
      try {
        if (selectedDateStr.isNotEmpty) {
          initialDate = DateFormat('yyyy-MM-dd').parse(selectedDateStr);
        }
      } catch (_) {
       
      }
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        selectedDateStr = DateFormat('yyyy-MM-dd').format(pickedDate);
        dateController.text = selectedDateStr;
      }
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(book == null ? 'Add Book' : 'Edit Book'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'Book ID'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Author Name'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Publication Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _pickDate,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (idController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Book ID cannot be empty')),
                );
                return;
              }

              final newBook = Book(
                id: idController.text.trim(),
                name: nameController.text,
                author: authorController.text,
                price: priceController.text,
                publicationDate: dateController.text,
              );

              if (book == null) {
                context.read<BookCubit>().addBook(newBook);
              } else {
                context.read<BookCubit>().updateBookWithIdChange(
                      oldId!,
                      newBook,
                    );
              }
              Navigator.pop(context);
            },
            child: Text('Save', style: AppStyles.text15PxRegular),
          ),
        ],
      ),
    );
  }
}
