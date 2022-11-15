import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/tools/validators.dart';

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
  int _maxChoosableTab = 0;
  late final TabController _tabCtrl;

  _onInfoFormSubmit(Map<String, dynamic> data) {
    print(data);

    _tabCtrl.animateTo(1);
    setState(() {
      _selectedTab = _tabCtrl.index;
      _maxChoosableTab = 1;
    });
  }

  _onDetailFormSubmit(Map<String, dynamic> data) {
    print(data);
    Navigator.of(context).pop();
  }

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
                  _selectedTab = value <= _maxChoosableTab ? value : _maxChoosableTab;
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
}

class InformationForm extends StatefulWidget {
  const InformationForm({required this.onSubmitted, super.key});

  final void Function(Map<String, dynamic> data) onSubmitted;

  @override
  State<InformationForm> createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, dynamic> _data = {
    "title": "",
    "occupation": "",
    "speciality": "",
    "description": "",
    "internalJobNumber": "",
    "internalContact": "",
    "country": "",
    "zipCode": "",
    "city": "",
    "address": "",
  };

  Widget _addSpacing(double size, [bool horizontal = false]) {
    return horizontal ? SizedBox(width: size) : SizedBox(height: size);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Job Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          TextFormField(
            decoration: const InputDecoration(labelText: "Title"),
            validator: validateInput('title', {'required': true}),
            onChanged: (value) => _data['title'] = value,
          ),
          _addSpacing(16),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Occupation", errorMaxLines: 2),
                  validator: validateInput('occupation', {'required': true}),
                  onChanged: (value) => _data['occupation'] = value,
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Speciality"),
                  validator: validateInput('speciality', {'required': true}),
                  onChanged: (value) => _data['speciality'] = value,
                ),
              ),
            ],
          ),
          _addSpacing(16),
          TextFormField(
            decoration: const InputDecoration(labelText: "Description"),
            validator: validateInput('description', {'required': true}),
            onChanged: (value) => _data['description'] = value,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
          ),
          _addSpacing(16),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Internal Job Number"),
                  onChanged: (value) => _data['internalJobNumber'] = value,
                  keyboardType: TextInputType.number,
                  validator: validateInput('number', {'required': true, 'min': 0}),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Candidate Contact", errorMaxLines: 2),
                  onChanged: (value) => _data['candidateContact'] = value,
                  keyboardType: TextInputType.phone,
                  validator: validateInput('contact number', {'required': true}),
                ),
              ),
            ],
          ),
          _addSpacing(24),
          const Text("Job Location", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Country"),
                  onChanged: (value) => _data['country'] = value,
                  validator: validateInput('country', {'required': true}),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Zip Code"),
                  onChanged: (value) => _data['zipCode'] = value,
                  validator: validateInput('zip code', {'required': true}),
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
                  onChanged: (value) => _data['city'] = value,
                  validator: validateInput('value', {'required': true}),
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Address"),
                  onChanged: (value) => _data['address'] = value,
                  validator: validateInput('address', {'required': true}),
                ),
              ),
            ],
          ),
          _addSpacing(36),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_form.currentState == null || !_form.currentState!.validate()) return;
                widget.onSubmitted(_data);
              },
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

class DetailsForm extends StatefulWidget {
  const DetailsForm({required this.onSubmitted, super.key});

  final void Function(Map<String, dynamic> data) onSubmitted;

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final _form = GlobalKey<FormState>();

  Widget _addSpacing(double size, [bool horizontal = false]) {
    return horizontal ? SizedBox(width: size) : SizedBox(height: size);
  }

  final Map<String, dynamic> _data = {
    "positionType": "",
    "experienceLevel": "",
    "educationalLevel": "",
    "salaryMin": "",
    "salaryMax": "",
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
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
                  validator: validateInput('position', {'required': true}),
                  onChanged: (value) => _data['positionType'] = value,
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Experience Level"),
                  validator: validateInput('level', {'required': true}),
                  onChanged: (value) => _data['experienceLevel'] = value,
                ),
              ),
            ],
          ),
          _addSpacing(12),
          TextFormField(
            decoration: const InputDecoration(labelText: "Educational Level"),
            validator: validateInput('level', {'required': true}),
            onChanged: (value) => _data['educationalLevel'] = value,
          ),
          _addSpacing(24),
          const Text("Salary Details", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          _addSpacing(18),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Salary Min", errorMaxLines: 2),
                  keyboardType: TextInputType.number,
                  validator: validateInput('minimum salary', {'required': true, 'min': 0}),
                  onChanged: (value) => _data['salaryMin'] = value,
                ),
              ),
              _addSpacing(24, true),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Salary Max", errorMaxLines: 2),
                  keyboardType: TextInputType.number,
                  validator: validateInput('maximum salary', {'required': true, 'min': 0}),
                  onChanged: (value) => _data['salaryMax'] = value,
                ),
              ),
            ],
          ),
          _addSpacing(36),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_form.currentState == null || !_form.currentState!.validate()) return;
                widget.onSubmitted(_data);
              },
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
