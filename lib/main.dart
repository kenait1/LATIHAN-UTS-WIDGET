import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupMembersPage(),
    );
  }
}

class GroupMember {
  final String name;
  final String nim;
  final String birthdate;

  GroupMember({
    required this.name,
    required this.nim,
    required this.birthdate,
  });
}

List<GroupMember> groupMembers = [
  GroupMember(name: 'Tobby Aries Yap', nim: '32210069', birthdate: '19-04-2003'),
  GroupMember(name: 'Christabel Ivan Setiadi', nim: '32210082', birthdate: '29-11-2003'),
  GroupMember(name: 'Alex Sugianto', nim: '32210089', birthdate: 'Ga tau ga masuk'),
];

class GroupMembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota Kelompok'),
      ),
      body: ListView.builder(
        itemCount: groupMembers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groupMembers[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailsPage(
                    member: groupMembers[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MemberDetailsPage extends StatelessWidget {
  final GroupMember member;

  MemberDetailsPage({
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Anggota $member.name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Nama: ${member.name}'),
            Text('NIM: ${member.nim}'),
            Text('Tanggal Lahir: ${member.birthdate}'),
          ],
        ),
      ),
    );
  }
}