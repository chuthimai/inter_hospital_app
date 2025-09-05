import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemAsString;
  final String labelText;
  final String hintText;
  final String searchHint;

  const CustomDropdownSearch({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemAsString,
    this.labelText = "Chọn",
    this.hintText = "Tìm kiếm...",
    this.searchHint = "Nhập để tìm...",
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: items,
      selectedItem: selectedItem,
      itemAsString: itemAsString,
      onChanged: onChanged,
      popupProps: PopupProps.dialog(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: searchHint,
            prefixIcon: const Icon(Icons.search),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        dialogProps: DialogProps(
          insetPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 128.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
