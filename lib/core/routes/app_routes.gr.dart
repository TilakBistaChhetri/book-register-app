// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:registerapp/features/auth/presentation/pages/login_page.dart'
    as _i3;
import 'package:registerapp/features/home/domain/entities/book.dart' as _i7;
import 'package:registerapp/features/home/presentation/pages/book_form_page.dart'
    as _i1;
import 'package:registerapp/features/home/presentation/pages/book_page.dart'
    as _i2;
import 'package:registerapp/features/splash/splash_page.dart' as _i4;

/// generated route for
/// [_i1.BookFormPage]
class BookFormRoute extends _i5.PageRouteInfo<BookFormRouteArgs> {
  BookFormRoute({
    _i6.Key? key,
    _i7.Book? book,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         BookFormRoute.name,
         args: BookFormRouteArgs(key: key, book: book),
         initialChildren: children,
       );

  static const String name = 'BookFormRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookFormRouteArgs>(
        orElse: () => const BookFormRouteArgs(),
      );
      return _i1.BookFormPage(key: args.key, book: args.book);
    },
  );
}

class BookFormRouteArgs {
  const BookFormRouteArgs({this.key, this.book});

  final _i6.Key? key;

  final _i7.Book? book;

  @override
  String toString() {
    return 'BookFormRouteArgs{key: $key, book: $book}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookFormRouteArgs) return false;
    return key == other.key && book == other.book;
  }

  @override
  int get hashCode => key.hashCode ^ book.hashCode;
}

/// generated route for
/// [_i2.BookPage]
class BookRoute extends _i5.PageRouteInfo<void> {
  const BookRoute({List<_i5.PageRouteInfo>? children})
    : super(BookRoute.name, initialChildren: children);

  static const String name = 'BookRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookPage();
    },
  );
}

/// generated route for
/// [_i3.LoginPageWrapper]
class LoginRouteWrapper extends _i5.PageRouteInfo<void> {
  const LoginRouteWrapper({List<_i5.PageRouteInfo>? children})
    : super(LoginRouteWrapper.name, initialChildren: children);

  static const String name = 'LoginRouteWrapper';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPageWrapper();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}
