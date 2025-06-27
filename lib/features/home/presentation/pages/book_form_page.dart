import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registerapp/core/themes/app_colors.dart';
import 'package:registerapp/core/themes/app_style.dart';
import 'package:registerapp/core/widgets/custom_text_form_field.dart';
import 'package:registerapp/core/widgets/primary_button.dart';
import '../../domain/entities/book.dart';
import '../bloc/book_cubit.dart';

@RoutePage()
class BookFormPage extends StatefulWidget {
  final Book? book;
  const BookFormPage({super.key, this.book});
  @override
  State<BookFormPage> createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController authorController;
  late TextEditingController priceController;
  late TextEditingController dateController;
  String selectedDateStr = '';

  @override
  void initState() {
    super.initState();
    final book = widget.book;
    idController = TextEditingController(text: book?.id ?? '');
    nameController = TextEditingController(text: book?.name ?? '');
    authorController = TextEditingController(text: book?.author ?? '');
    priceController = TextEditingController(text: book?.price ?? '');
    selectedDateStr = book?.publicationDate ?? '';
    dateController = TextEditingController(text: selectedDateStr);
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    authorController.dispose();
    priceController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime initial = DateTime.now();
    if (selectedDateStr.isNotEmpty) {
      try {
        initial = DateFormat('yyyy-MM-dd').parse(selectedDateStr);
      } catch (_) {}
    }
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDateStr = DateFormat('yyyy-MM-dd').format(picked);
      dateController.text = selectedDateStr;
    }
  }

  void save() {
    if (idController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Book ID cannot be empty')));
      return;
    }
    final newBook = Book(
      id: idController.text.trim(),
      name: nameController.text,
      author: authorController.text,
      price: priceController.text,
      publicationDate: dateController.text,
    );
    final cubit = context.read<BookCubit>();
    if (widget.book == null) {
      cubit.addBook(newBook);
    } else {
      cubit.updateBookWithIdChange(widget.book!.id, newBook);
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.book == null ? 'Add Book' : 'Edit Book',
          style: AppStyles.text20PxBold.copyWith(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomTextFormField(controller: idController, label: 'Book ID'),
            SizedBox(height: 12.h),
            CustomTextFormField(controller: nameController, label: 'Name'),
            SizedBox(height: 12.h),
            CustomTextFormField(
              controller: authorController,
              label: 'Author Name',
            ),
            SizedBox(height: 12.h),
            CustomTextFormField(controller: priceController, label: 'Price'),
            SizedBox(height: 12.h),
            CustomTextFormField(
              controller: dateController,
              label: 'Publication Date',
              readOnly: true,
              onTap: pickDate,
            ),
            SizedBox(height: 20.h),
            PrimaryButton(title: 'Save', onPressed: save),
          ],
        ),
      ),
    );
  }
}
