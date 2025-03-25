import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/tasklist.dart';
import 'package:todolist/view/component/items/task_list_item.dart';
import 'package:todolist/view/home/homepage/home_bottom_navigationbar.dart';
import 'package:todolist/view/task/tasklist_page.dart';
import 'package:todolist/viewmodel/tasklistcollection_viewmodel.dart';
import 'package:todolist/view/home/homepage/home_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TaskListCollectionViewModel>().getTaskListCollection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskListCollectionViewModel>(
        builder: (context, taskListCollectionViewModel, child) {
          if (taskListCollectionViewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }

          if (taskListCollectionViewModel.error != null) {
            return Center(
              child: Text(
                taskListCollectionViewModel.error ?? 'Lỗi không tải được',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: HomeSearchBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 10),
                  child: Text(
                    taskListCollectionViewModel.taskListCollection?.title ??
                        'Danh sách của tôi',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: taskListCollectionViewModel
                              .taskListCollection?.tasklists.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        final item = taskListCollectionViewModel
                                .taskListCollection?.tasklists[index] ??
                            TaskList(title: '', tasks: []);
                        return TaskListItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskListPage(
                                  taskList: item,
                                ),
                              ),
                            );
                          },
                          model: item,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
