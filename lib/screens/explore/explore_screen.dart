class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: const Color(0xFFF2EFE7),
            appBar: AppBar(
                backgroundColor: const Color(0xFF48A6A7),
                title: const Text("ExploreScreen"),
                centerTitle: true,
            ),
            body: Center(
                child: Text('Work in Progress');
            )
        );
    }
}