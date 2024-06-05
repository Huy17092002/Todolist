import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TodoListApp(),
    ),
  );
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  var myController = TextEditingController();
  bool isSearch = false;
  bool isSua = false;
  double opacitySua = 1;
  double opacityCancel = 0;
  FocusNode focusNode = FocusNode();

  void _cancel() {
    setState(() {
      isSearch = false;
      isSua = false;
      opacitySua = 1;
      opacityCancel = 0;
    });
    myController.clear();
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 320),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thank you'),
                          actions: [
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: AnimatedContainer(
                    width: isSua ? 40 : 40,
                    height: isSua ? 0 : 30,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutQuad,
                    // alignment: isSua ? Alignment.center:AlignmentDirectional.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: opacitySua,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCirc,
                      child: const Text(
                        'Sửa',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    child: AnimatedContainer(
                      width: isSua ? 305 : 360,
                      height: 35,
                      alignment: Alignment.topRight,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutQuad,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: focusNode,
                              controller: myController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Tìm kiếm',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 12.5),
                              ),
                              onTap: () {
                                setState(() {
                                  isSearch = true;
                                  isSua = true;
                                  opacitySua = 0;
                                  opacityCancel = 1;
                                });
                              },
                            ),
                          ),
                          if (isSearch)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  myController.clear();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.5, right: 4),
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.grey[500],
                                  size: 17,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (isSearch)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {
                            _cancel();
                          },
                          child: const Text(
                            'Hủy',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Danh sách của tôi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 360,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 0.25),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                height: MediaQuery.of(context).size.height - 260,
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    index++;
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.playlist_add_circle, size: 38, color: Colors.blueAccent),
                          title: const Text(
                            'view',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            print('view $index');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddtaskScreen(),
                              ),
                            );
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                          indent: 70,
                          endIndent: 0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 33),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.add_circle,
                  size: 30,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Lời nhắc mới',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const Addtask();
                    },
                  );
                },
              ),
              const SizedBox(width: 45),
              TextButton(
                child: const Text(
                  'Thêm danh sách',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return  Container(
                          height: 780,
                          child: const AddList(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddtaskScreen extends StatefulWidget {
  const AddtaskScreen({super.key});

  @override
  State<AddtaskScreen> createState() => AddtaskScreenState();
}

class AddtaskScreenState extends State<AddtaskScreen> {
  List<Widget> _reminderInputs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400,
        leading: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.blue),
                  Text(
                    'Danh sách',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 155,
            ),
            IconButton(
              icon: const Icon(
                Icons.pending_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(10, 99, 9, 0),
                  items: <PopupMenuItem>[
                    const PopupMenuItem(
                      value: Icons.preview,
                      child: ListTile(
                        leading: Text(
                          'Show List Info',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.info_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      value: Icons.share,
                      child: ListTile(
                        leading: Text(
                          'Select Reminders',
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Icon(Icons.check_circle_outline),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Text(
                          'Sort By',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        title: Icon(Icons.import_export),
                      ),
                    ),
                    const PopupMenuItem(
                        child: ListTile(
                          leading:Text(
                            'Show Completed',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ) ,
                          title: Icon(Icons.remove_red_eye_outlined),
                        )
                    ),
                    const PopupMenuItem(
                        child: ListTile(
                        leading: Text('Print',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        ),
                          title: Icon(Icons.print),
                        )
                    ),
                     const PopupMenuItem(
                          child:  ListTile(
                            leading: Text('Delete List',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            ),
                            title:Icon(Icons.delete_rounded),
                          )
                      ),
                  ],
                );
              },
            ),
            TextButton(
              child: const Text(
                'Xong',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Xong'),
                      actions: [
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'View',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ..._reminderInputs,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 33,
          right: 210,
        ),
        child: TextButton.icon(
          icon: const Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.blue,
          ),
          label: const Text(
            'Lời nhắc mới',
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            setState(() {
              _reminderInputs.add(_buildReminderInput());
            });
          },
        ),
      ),
    );
  }

  Widget _buildReminderInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.radio_button_unchecked, color: Colors.grey),
            hintText: 'Add note',
            suffixIcon: Icon(Icons.info_outline)),
      ),
    );
  }
}

class Addtask extends StatelessWidget {
  const Addtask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 780,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 60,
              ),
              const Text(
                'New Reminder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 45),
              TextButton(
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Xong'),
                        actions: [
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      helperText: 'Notes',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const DetailsScreen();
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 2, left: 20),
                          child: Row(
                            children: [
                              Text(
                                'Chi tiết',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 238),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 19,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const ListScreen();
                    },
                  );
                },
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 2, left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_add_circle,
                          color: Colors.green,
                          size: 36,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'List',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 175,
                        ),
                        Text(
                          'Wear',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddList extends StatelessWidget {
  const AddList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400,
        leading: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 5)),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 75,
            ),
            const Text(
              'New List',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 80),
            TextButton(
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thank you'),
                      actions: [
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Icons.format_list_bulleted_rounded,
                        color: Colors.white,
                        size: 65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 320,
                    height: 53,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'List name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 65,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17, top: 13),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool switchValue = false;
  bool showText = false;
  bool showDate = false;
  bool showClock = false;


  void _toggleSwitch(bool value) {
    setState(() {
      switchValue = value;
      showText = value;
    });
  }

  void _toggleCustomDatePicker(bool value) {
    setState(() {
      showDate = value;
      showClock = false;
    });
  }

  void _toggleCustomClock(bool value) {
    setState(() {
      showClock = value;
      showDate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 770,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                    Text(
                      'Lời nhắc mới',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 90,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thank you very much'),
                        actions: [
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
             AnimatedContainer(
                  width: 350,
                  duration: const Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.date_range,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 177,
                            ),
                            CupertinoSwitch(
                              value: showDate,
                              onChanged: _toggleCustomDatePicker,
                            ),
                          ],
                        ),
                    AnimatedContainer(
                      height: showDate ? 350 : 0,
                      duration: const Duration(milliseconds: 400),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          child: CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onDateChanged: (DateTime value) {},
                          ),
                        ),
                      ),
                   ),
                        const Divider(
                          thickness: 0.8,
                          color: Colors.grey,
                        ),
                     AnimatedContainer(
                          height: showClock ? 200 : 43,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(Icons.query_builder,color: Colors.white,),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 177,
                                  ),
                                  CupertinoSwitch(
                                    value: showClock,
                                    onChanged: _toggleCustomClock,
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: showClock,
                                child: Flexible(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: DateTime.now(),
                                    use24hFormat: true,
                                    onDateTimeChanged: (DateTime newDateTime) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const RepeatScreen();
                      },
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 0, left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.repeat_on,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Repeat',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 160,),
                          Text(
                            'Never',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AnimatedContainer(
                  height: switchValue ? 120 : 45,
                  width: 350,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2, left: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                              padding:const EdgeInsets.only(top: 6, left: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.blue[700],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.near_me,
                                      color: Colors.white,
                                      size: 21,
                                    ),
                                  ),
                                 const SizedBox(
                                    width: 10,
                                  ),
                                 const Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Location',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (showText)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 15, bottom: 10),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const Icon(
                                            Icons.near_me,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue[600],
                                          ),
                                          child: const Icon(
                                            Icons.directions_car,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue[600],
                                          ),
                                          child: const Icon(
                                            Icons.directions_car,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 14,
                        top: 3,
                        child: CupertinoSwitch(
                          value: switchValue,
                          onChanged: _toggleSwitch,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2, left: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.priority_high,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),
                       const SizedBox(width: 10,),
                        const Text(
                          'Priority',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        GestureDetector(
                          onTap: () {
                            showMenu(
                              context: context,
                              position: const RelativeRect.fromLTRB(5, 255, 0, 0),
                              items: <PopupMenuItem>[
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'None',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'Low',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                const PopupMenuItem(
                                  child: ListTile(
                                    leading: Text(
                                      'Medium',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                'None',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Icon(
                                Icons.unfold_more,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.blue),
                    Text(
                      'Danh sách mới',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const Text(
                'List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 1),
          itemBuilder: (BuildContext context, int index) {
            index++;
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.playlist_add_circle, size: 38, color: Colors.redAccent),
                  title: const Text(
                    ' Item',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    print('Item $index');

                    Navigator.pop(
                      context,
                    );
                  },
                ),
                const Divider(
                  thickness: 0.3,
                  indent: 70,
                  endIndent: 0,
                  height: 0.2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RepeatScreen extends StatelessWidget {
  const RepeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
      width: 390,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 400,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.blue),
                    Text(
                      'Chi tiet',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Repeat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 450,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 1),
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    index++;
                    return const Column(
                      children: [
                        ListTile(
                          title: Text(
                       'view',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.8,
                          indent: 10,
                          endIndent: 0,
                          height: 0.2,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
