import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final bottomTabControllerProvider = Provider<PageController>(
  (ref) => PageController(),
);

// All State Provider
final selectedTabIndexProvider = StateProvider<int>((ref) => 0);
final selectedMyOrderIndexProvider = StateProvider<int>((ref) => 0);
final currentPageController = StateProvider<int>((ref) => 0);
final selectedProductColorIndex = StateProvider<int?>((ref) => 0);
final selectedProductSizeIndex = StateProvider<int>((ref) => 0);
final isOnboardingLastPage = StateProvider<bool>((ref) => false);
final obscureText1 = StateProvider<bool>((ref) => true);
final obscureText2 = StateProvider<bool>((ref) => true);
final obscureText3 = StateProvider<bool>((ref) => true);

final selectedPayment = StateProvider<String>((ref) => '');
final isProfileVefifySuccess = StateProvider<bool>((ref) => false);

// Product Filter State
final selectedReviewIndex = StateProvider<int?>((ref) => null);
final selectedCategoryByIndex = StateProvider<int?>((ref) => null);
final selectedBrandIndex = StateProvider<int?>((ref) => null);
final selectedColorIndex = StateProvider<int?>((ref) => null);
final selectedSizeIndex = StateProvider<int?>((ref) => null);
final selectedSortByIndex = StateProvider<int?>((ref) => null);
final selectedMinPrice = StateProvider<double?>((ref) => null);
final selectedMaxPrice = StateProvider<double?>((ref) => null);
