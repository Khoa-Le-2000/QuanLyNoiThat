import 'package:flutter/material.dart';
import 'package:quan_ly_noi_that/slide_bar.dart';

class ScreenNote extends StatelessWidget {
  const ScreenNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Note(),
    );
  }
}

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  int _selectedIndex = 0;

  var txtCustomerName = TextEditingController();
  var txtSearch = TextEditingController();

  Widget newNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Tên khách hàng",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 16),
          child: TextFormField(
            controller: txtCustomerName,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: colorMain,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Nội dung",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: colorMain,
              ),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
              ),
              child: const Text("Tạo"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget oldNote() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
          child: TextFormField(
            controller: txtSearch,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: colorMain,
              hintText: "Nhập để tìm kiếm thông tin",
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                item("Việt",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                item("Bảo",
                    "Contrary to popular belief, Lorem Ipsum is not simply random text"),
                item("Mai",
                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
                item("Loan",
                    "when an unknown printer took a galley of type and ."),
                item("Phượng", "scrambled it to make a type specimen book. "),
                item("Lân", "It has survived not only five centuries, "),
                item(
                    "Chương", "but also the leap into electronic typesetting,"),
                item("Dũng",
                    " remaining essentially unchanged. It was popularised "),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget titleContent(String title, String content) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        Expanded(
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget item(String name, String content) {
    return Container(
      decoration: BoxDecoration(
        color: colorMain,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                titleContent("Khách hàng: ", name),
                const SizedBox(height: 5),
                titleContent("Nội dung: ", content),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: slideBar(context),
      appBar: AppBar(
        backgroundColor: colorMain,
        title: const Text("Ghi chú"),
      ),
      body: Container(
        color: colorBackground,
        child: (_selectedIndex == 0) ? newNote() : oldNote(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorMain,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Ghi chú mới',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Ghi chú cũ',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: colorSecond,
        currentIndex: _selectedIndex,
        onTap: _onItemButtomTap,
      ),
    );
  }

  void _onItemButtomTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
