import 'package:flutter/material.dart';

class TripFormScreen extends StatefulWidget {
  const TripFormScreen({super.key});

  @override
  State<TripFormScreen> createState() => _TripFormScreenState();
}

class _TripFormScreenState extends State<TripFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? tripVibe;
  String? travelGroup;
  double pace = 2;
  String? destination;
  int days = 1;
  double budget = 500;
  DateTime? tripDate;
  String? style;
  bool localGuide = false;
  String? perfectTrip;

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => tripDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Your Trip"),
        backgroundColor: const Color(0xFF006A71),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              buildDropdown(
                label: "Your trip vibe",
                value: tripVibe,
                items: ["Relaxed", "Adventurous", "Cultural", "Luxury"],
                onChanged: (val) => setState(() => tripVibe = val),
              ),
              buildDropdown(
                label: "Who are you travelling with?",
                value: travelGroup,
                items: ["Alone", "Family", "Friends", "Strangers"],
                onChanged: (val) => setState(() => travelGroup = val),
              ),
              buildSlider("Preferred pace", pace, 1, 5, (val) => setState(() => pace = val)),
              buildTextField("Destination", (val) => destination = val),
              buildCounter("Number of days", days, (val) => setState(() => days = val)),
              buildBudgetSlider(),
              buildDatePicker(),
              buildDropdown(
                label: "Travel style",
                value: style,
                items: ["Planned", "Spontaneous", "Mix"],
                onChanged: (val) => setState(() => style = val),
              ),
              SwitchListTile(
                title: const Text("Need a local guide?"),
                value: localGuide,
                onChanged: (val) => setState(() => localGuide = val),
              ),
              buildTextField("What would make it perfect?", (val) => perfectTrip = val),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF48A6A7),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Trip Saved!")),
                    );
                  }
                },
                child: const Text("Submit", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown({required String label, required String? value, required List<String> items, required void Function(String?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFFF2EFE7),
        ),
        value: value,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget buildSlider(String label, double value, double min, double max, void Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          activeColor: const Color(0xFF48A6A7),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildTextField(String label, void Function(String) onSaved) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFFF2EFE7),
        ),
        onSaved: (val) => onSaved(val ?? ''),
        validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
      ),
    );
  }

  Widget buildCounter(String label, int value, void Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label: $value"),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => onChanged(value > 1 ? value - 1 : 1),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => onChanged(value + 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBudgetSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Budget: \$${budget.toStringAsFixed(0)}"),
        Slider(
          value: budget,
          min: 100,
          max: 10000,
          divisions: 100,
          activeColor: const Color(0xFF9ACBD0),
          onChanged: (val) => setState(() => budget = val),
        ),
      ],
    );
  }

  Widget buildDatePicker() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(tripDate == null ? "Select trip date" : "Trip Date: ${tripDate!.toLocal()}".split(' ')[0]),
      trailing: const Icon(Icons.calendar_today),
      onTap: pickDate,
    );
  }
}
