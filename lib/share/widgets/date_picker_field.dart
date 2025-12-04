import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final String label;
  final void Function(DateTime)? onDateSelected;
  final DateTime? start;
  final DateTime? end;
  final List<DateTime> allowedDates;
  final bool enabled;

  const DatePickerField({
    super.key,
    required this.label,
    this.onDateSelected,
    this.start,
    this.end,
    this.allowedDates = const [],
    this.enabled = true,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.6,
        child: TextField(
          readOnly: true,
          controller: TextEditingController(
            text: _selectedDate != null
                ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                : "",
          ),
          decoration: InputDecoration(
            hintText: "Chọn ngày",
            labelText: widget.label,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          onTap: _pickDate,
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    late DateTime? picked;
    if (widget.allowedDates.isNotEmpty) {
      picked = await _pickDateHasAllowedDates(allowedDates: widget.allowedDates);
    } else {
      picked = await _pickDateHasStartEndDate(start: widget.start, end: widget.end);
    }

    if (picked != null) {
      setState(() => _selectedDate = picked);
      widget.onDateSelected?.call(picked);
    }
  }

  Future<DateTime?> _pickDateHasAllowedDates(
      {required List<DateTime> allowedDates}) async {
    return await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? allowedDates.first,
      firstDate: allowedDates.first,
      lastDate: allowedDates.last,
      selectableDayPredicate: (day) {
        return allowedDates.any((d) =>
        d.year == day.year && d.month == day.month && d.day == day.day);
      },
      locale: const Locale("vi", "VN"),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Future<DateTime?> _pickDateHasStartEndDate(
      {required DateTime? start, required DateTime? end}) async {
    start ??= DateTime.now();
    if (end == null) {
      final nextMonth = DateTime(start.year, start.month + 1, start.day);
      end = DateTime(nextMonth.year, nextMonth.month, nextMonth.day);
    }

    return await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? start,
      firstDate: start,
      lastDate: end,
      locale: const Locale("vi", "VN"),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
