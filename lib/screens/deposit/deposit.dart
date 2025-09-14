// import 'package:code2earn/widgets/app_text_field.dart';
// import 'package:flutter/material.dart';
//
// class Deposit extends StatefulWidget {
//   const Deposit({super.key});
//
//   @override
//   State<Deposit> createState() => _DepositState();
// }
//
// class _DepositState extends State<Deposit> {
//   TextEditingController amtController = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Deposit"),),
//       body: SafeArea(child: SingleChildScrollView(
//
//
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Column(
//           children: [
//
//             // Enter amount
//             AppTextField(amtController,"Amount"),
//             SizedBox(height: 14,),
//             AppTextField(amtController,"Days"),
//             SizedBox(height: 14,),
//             AppTextField(amtController,"How many questions a day"),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8A00), padding: EdgeInsets.symmetric(horizontal: 38, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//               onPressed: (){
//                 Navigator.push(context, new MaterialPageRoute(builder: (context)=>Deposit()));
//               },
//               child: Text('Deposit Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15)),
//             ),
//
//
//
//
//
//             // Enter amount
//             // TextField(decoration: InputDecoration(hintText: "Enter amount to deposit"),),
//
//
//
//
//           ],
//         ),
//       )),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



// class ChallengeSetupApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Code2Earn - Challenge Setup',
//       theme: ThemeData(
//         primaryColor: Color(0xFFFF8A00),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Inter',
//         textTheme: TextTheme(
//           headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//           subtitle1: TextStyle(fontSize: 16, color: Colors.black87),
//           bodyText2: TextStyle(fontSize: 14, color: Colors.black87),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             primary: Color(0xFFFF8A00),
//             onPrimary: Colors.white,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             padding: EdgeInsets.symmetric(vertical: 14),
//             textStyle: TextStyle(fontWeight: FontWeight.w700),
//           ),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: ChallengeSetupScreen(),
//     );
//   }
// }

class ChallengeSetupScreen extends StatefulWidget {
  @override
  _ChallengeSetupScreenState createState() => _ChallengeSetupScreenState();
}

class _ChallengeSetupScreenState extends State<ChallengeSetupScreen> {
  final _amountController = TextEditingController(text: '500');
  DateTime? _startDate;
  DateTime? _endDate;
  int _questionsPerDay = 2;
  int _selectedDurationDays = 10; // default 10 days
  final DateFormat _dateFmt = DateFormat('d MMM');

  // helper to parse amount safely
  int get currentAmount {
    try {
      return int.parse(_amountController.text);
    } catch (e) {
      return 0;
    }
  }

  void _addAmount(int add) {
    final newVal = (currentAmount + add).clamp(0, 1000000);
    _amountController.text = newVal.toString();
    setState(() {});
  }

  void _selectDurationPreset(int days) {
    setState(() {
      _selectedDurationDays = days;
      _startDate = DateTime.now();
      _endDate = DateTime.now().add(Duration(days: days - 1));
    });
  }

  Future<void> _pickStartDate() async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? today,
      firstDate: DateTime(today.year - 1),
      lastDate: DateTime(today.year + 2),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        // if end date exists and is before start, adjust end
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = _startDate;
        }
        _updateDurationFromDates();
      });
    }
  }

  Future<void> _pickEndDate() async {
    final today = DateTime.now();
    final init = _endDate ?? (_startDate ?? today);
    final picked = await showDatePicker(
      context: context,
      initialDate: init,
      firstDate: DateTime(today.year - 1),
      lastDate: DateTime(today.year + 2),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
        // if start date exists and is after end, adjust start
        if (_startDate != null && _startDate!.isAfter(_endDate!)) {
          _startDate = _endDate;
        }
        _updateDurationFromDates();
      });
    }
  }

  void _updateDurationFromDates() {
    if (_startDate != null && _endDate != null) {
      final diff = _endDate!.difference(_startDate!).inDays + 1;
      _selectedDurationDays = diff > 0 ? diff : 1;
    }
  }

  String _summaryText() {
    final amt = currentAmount;
    final days = _selectedDurationDays;
    final q = _questionsPerDay;
    final perDayRefund = (days > 0) ? (amt / days).round() : 0;
    final start = _startDate != null ? _dateFmt.format(_startDate!) : '—';
    final end = _endDate != null ? _dateFmt.format(_endDate!) : '—';
    return "You are betting ₹$amt for $days day${days==1? '': 's'} solving $q question${q==1? '': 's'} per day.\nStart: $start • End: $end\nEstimated refund ~ ₹$perDayRefund/day (after verification).";
  }

  @override
  void initState() {
    super.initState();
    // default start and end
    _startDate = DateTime.now();
    _endDate = DateTime.now().add(Duration(days: _selectedDurationDays - 1));
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Widget _chip(String label,
      {bool selected = false, VoidCallback? onTap, EdgeInsets? margin}) {
    return Container(
      margin: margin ?? EdgeInsets.only(right: 8, top: 8),
      child: ChoiceChip(
        label: Text(label,
            style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600)),
        selected: selected,
        onSelected: (_) => onTap?.call(),
        selectedColor: Color(0xFFFF8A00),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final amt = currentAmount;
    final isCustomDuration = ![7, 10, 30].contains(_selectedDurationDays);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Start Challenge', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        foregroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount input
              Text('Amount', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter amount in ₹',
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),

              // quick-add chips
              SizedBox(height: 10),
              Wrap(
                children: [
                  _chip('+100', onTap: () => _addAmount(100)),
                  _chip('+500', onTap: () => _addAmount(500)),
                  _chip('+1000', onTap: () => _addAmount(1000)),
                  _chip('Clear', onTap: () {
                    _amountController.text = '0';
                    setState(() {});
                  }),
                ],
              ),

              SizedBox(height: 18),

              // Duration chips
              Text('Duration', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 10),
              Wrap(
                children: [
                  _chip('7 Days',
                      selected: _selectedDurationDays == 7,
                      onTap: () => _selectDurationPreset(7)),
                  _chip('10 Days',
                      selected: _selectedDurationDays == 10,
                      onTap: () => _selectDurationPreset(10)),
                  _chip('30 Days',
                      selected: _selectedDurationDays == 30,
                      onTap: () => _selectDurationPreset(30)),
                  _chip('Custom',
                      selected: isCustomDuration,
                      onTap: () {
                        // enable custom: user will pick dates
                        setState(() {
                          _selectedDurationDays = 0;
                          _startDate = DateTime.now();
                          _endDate = DateTime.now();
                        });
                        _pickStartDate();
                      }),
                ],
              ),

              SizedBox(height: 14),

              // Start & End date pickers
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickStartDate,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start Date',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Text(
                                _startDate != null
                                    ? _dateFmt.format(_startDate!)
                                    : 'Select',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickEndDate,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('End Date',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Text(
                                _endDate != null
                                    ? _dateFmt.format(_endDate!)
                                    : 'Select',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18),

              // Questions per day
              Text('Questions per day',
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 10),
              Wrap(
                children: [
                  _chip('1', selected: _questionsPerDay == 1, onTap: () {
                    setState(() => _questionsPerDay = 1);
                  }),
                  _chip('2', selected: _questionsPerDay == 2, onTap: () {
                    setState(() => _questionsPerDay = 2);
                  }),
                  _chip('3', selected: _questionsPerDay == 3, onTap: () {
                    setState(() => _questionsPerDay = 3);
                  }),
                  _chip('Custom', onTap: () async {
                    // simple dialog to pick custom number
                    final val = await showDialog<int>(
                        context: context,
                        builder: (c) {
                          int temp = _questionsPerDay;
                          return AlertDialog(
                            title: Text('Custom questions/day'),
                            content: StatefulBuilder(
                                builder: (c2, setS2) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Slider(
                                      min: 1,
                                      max: 10,
                                      divisions: 9,
                                      value: temp.toDouble(),
                                      onChanged: (v) =>
                                          setS2(() => temp = v.round()),
                                    ),
                                    Text('$temp questions/day'),
                                  ],
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(c, null),
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () => Navigator.pop(c, temp),
                                  child: Text('OK')),
                            ],
                          );
                        });
                    if (val != null) {
                      setState(() => _questionsPerDay = val);
                    }
                  }),
                ],
              ),

              SizedBox(height: 18),

              // Live summary
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                color: Colors.grey.shade50,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _summaryText(),
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18),

              // Agreement checkbox and CTA
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                        'You agree to submit proof daily (video / screenshot / code). Missing days may reduce refund.',
                        style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: amt <= 0 || _startDate == null || _endDate == null
                    ? null
                    : () {
                  // Here: proceed to payment or confirmation
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      padding: EdgeInsets.all(16),
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Confirm Challenge',
                              style:
                              TextStyle(fontWeight: FontWeight.w700)),
                          SizedBox(height: 12),
                          Text('Amount: ₹$amt'),
                          SizedBox(height: 6),
                          Text(
                              'Duration: ${_selectedDurationDays} day(s) • ${_questionsPerDay} q/day'),
                          SizedBox(height: 16),
                          Text(
                              'Proceed to payment gateway (Razorpay/UPI). For MVP this is a mock.'),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Mock deposit complete — challenge started')));
                            },
                            child: Center(child: Text('Proceed to Pay')),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(48)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Start Challenge & Deposit Now'))),
              ),

              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}