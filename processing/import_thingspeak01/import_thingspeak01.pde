//This sketch retrieves a large block of data from thingspeak.
//Here I use json as the format, though this can 
//be done (with different parsing) with xml or csv files.
// You can see the raw json file by pasting the following 
//into the address bar of your browser:
// <a href="http://api.thingspeak.com/channels/11653/feed.json?key=
//E593NEBDKFBC84D6&start=2011-11-11%2010:10:10&end=2014-11-11%2011:11:11" target="_blank" rel="nofollow">http://api.thingspeak
//.com/channels/11653/feed.json?key=E593NEBDKFBC84D6&amp;start=2011-11-11 10:10:10&amp;end=2014-11-11 11:11:11</a>
// Details on how to construct these urls can be found at Thingspeak Community:
//<a href="http://community.thingspeak.com/documentation/api/" target="_blank" rel="nofollow">http://community.thingspeak.com/documentation/api/</a>
 
JSONObject json; // this is the full json object including the headers
JSONArray totalData; // this is the array in the feeds part
JSONObject record; // this is each one of the small json objects in the array
int id; // this is just a counter provided by Thingspeak that increments 
        //with each new posted data point. It is an int
String timeStamp; // this is the full time stamp provided by Thingspeak. 
        //It could be parsed to extract specific information for visualization
int x,y,z,rolldeg; // this is the data point that I uploaded from my arduino 
 
void setup() {
}
void draw(){
  json = loadJSONObject("http://"+"api.thingspeak.com/channels/183021/feeds.json?results=2");
  totalData = json.getJSONArray("feeds"); 
  for (int i = 0; i < totalData.size(); i++) {
    record = totalData.getJSONObject(i); // remember the items in 
    //the array are also JSON objects
    id = record.getInt("entry_id"); // the key "entry_id" is given 
    //by Thingspeak. This is essentially a counter
    timeStamp = record.getString("created_at"); // the key "created_at" is also 
    //given by Thingspeak. I will write a parser to unpack it into a Date class soon.
    x = int(record.getString("field1"))-1000; // Thingspeak stored this as 
    y = int(record.getString("field2"))-1000;
    z = int(record.getString("field3"))-1000;
    rolldeg = int(record.getString("field4"))-1000;
    //x = int(record.getString("field1"))-1000;
    //a string so I have to convert it to an int for visualisation
    print(id); // Just checking that it is all there. 
    print('\t');
    print(timeStamp);
    print('\t');
    print(x);
    print('\t');
    print(y);
    print('\t');
    print(z);
    print('\t');
    println(rolldeg);
}
 delay(15000);
}