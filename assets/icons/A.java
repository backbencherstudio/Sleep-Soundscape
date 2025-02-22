Expanded(
  child: ListView.builder(
    itemCount: 6,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900], // Background color
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset('assets/images/white_sound.png', width: 40, height: 40),
            title: Text(
              "Sound ${index + 1}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Subtitle ${index + 1}",
              style: TextStyle(color: Colors.white70),
            ),
       trailing: isPressedList[index]
            ? Image.asset(
            'assets/icons/start.png',
            width: 30,
            height: 30,
                      )
                    : Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 30,
                      ),
            onTap: () {
              debugPrint("Sound ${index + 1} selected"); // Use debugPrint instead of print
              // Add your audio play functionality here
            },
          ),
        ),
      );
    },
  ),
),
