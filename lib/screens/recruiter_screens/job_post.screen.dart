import 'package:flutter/material.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({super.key});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    const Tab(
      child: Text(
        "Step 1 - Primary Information",
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Tab(
      child: Text(
        "Step 2 - Details and Requirements",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  int _selectedTab = 0;
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(initialIndex: _selectedTab, length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: Column(
          children: [
            TabBar(
              controller: _tabCtrl,
              onTap: (value) {
                setState(() {
                  _selectedTab = value;
                });
              },
              tabs: _tabs,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                  child: Builder(
                    builder: (context) => _selectedTab == 0
                        ? InformationForm(onSubmitted: _onInfoFormSubmit)
                        : DetailsForm(onSubmitted: _onDetailFormSubmit),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onInfoFormSubmit() {
    setState(() {
      _tabCtrl.animateTo(1);
      _selectedTab = _tabCtrl.index;
    });
  }

  _onDetailFormSubmit() {
    Navigator.of(context).pop();
  }
}

class InformationForm extends StatelessWidget {
  const InformationForm({required this.onSubmitted, super.key});

  final void Function() onSubmitted;

  Widget _addSpacing(double size, [bool horizontal = false]) {
    return horizontal ? SizedBox(width: size) : SizedBox(height: size);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Job Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          TextFormField(decoration: const InputDecoration(labelText: "Title")),
          _addSpacing(16),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Occupation"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Speciality"),
                ),
              ),
            ],
          ),
          _addSpacing(16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Description"),
            keyboardType: TextInputType.multiline,
            maxLines: 4,
          ),
          _addSpacing(16),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Internal Job Number"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Candidate Contact"),
                ),
              ),
            ],
          ),
          _addSpacing(24),
          const Text("Job Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Country"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Zip Code"),
                ),
              ),
            ],
          ),
          _addSpacing(12),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "City or State"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Address"),
                ),
              ),
            ],
          ),
          _addSpacing(36),
          Center(
            child: ElevatedButton(
              onPressed: onSubmitted,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB749A3),
                foregroundColor: Colors.white,
              ),
              child: const Text("Proceed To Next Stage"),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsForm extends StatelessWidget {
  const DetailsForm({required this.onSubmitted, super.key});

  final void Function() onSubmitted;

  Widget _addSpacing(double size, [bool horizontal = false]) {
    return horizontal ? SizedBox(width: size) : SizedBox(height: size);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Job Requirements", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          const Divider(thickness: 2, color: Colors.grey, height: 32),
          const Text("Position Details", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Position Type"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Experience Level"),
                ),
              ),
            ],
          ),
          _addSpacing(12),
          TextFormField(
            decoration: const InputDecoration(labelText: "Educational Level"),
          ),
          _addSpacing(24),
          const Text("Salary Details", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Salary Min"),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Salary Max"),
                ),
              ),
            ],
          ),
          _addSpacing(36),
          Center(
            child: ElevatedButton(
              onPressed: onSubmitted,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB749A3),
                foregroundColor: Colors.white,
              ),
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
