
#include <ESP8266WiFi.h>
 
const char* ssid = "iPhone YK";
const char* password = "younes95";

// Step D1
int Step = 5;
// Dir  D2
int Dir  = 4;

int dicesteps = 50;
int beltspeed = 10;

WiFiServer server(80);
 
void setup() {
  Serial.begin(115200);
  delay(10);
 pinMode(Step, OUTPUT); //Step pin as output
 pinMode(Dir,  OUTPUT); //Direcction pin as output
 digitalWrite(Step, LOW); // Currently no stepper motor movement
 digitalWrite(Dir, LOW);  
 
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
 
  // Start the server
  server.begin();
  Serial.println("Server started");
 
  // Print the IP address on serial monitor
  Serial.print("Use this URL to connect: ");
  Serial.print("http://");    //URL IP to be typed in mobile/desktop browser
  Serial.print(WiFi.localIP());
}
 
void loop() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
 
  // Wait until the client sends some data
  Serial.println("new Connection");
  while(!client.available()){
    delay(1);
  }
 
  // Read the first line of the request
  String request = client.readStringUntil('\r');
  client.flush();
 
  // Requests
  int i;
  if (request.indexOf("/cmd=1") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 1 Die");
    digitalWrite(Dir, LOW); //Rotate direction
       for( i=1; i<=(dicesteps); i++){
        digitalWrite(Step, HIGH);
        delay(beltspeed);
        digitalWrite(Step, LOW);
        delay(beltspeed);
      }
  }
  if (request.indexOf("/cmd=2") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 2 Dice");
    digitalWrite(Dir, LOW); //Rotate direction
          for( i=1;i<=(dicesteps*2);i++){
          digitalWrite(Step, HIGH);
          delay(beltspeed);
          digitalWrite(Step, LOW);
          delay(beltspeed);}
  }
  if (request.indexOf("/cmd=3") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 3 Dice");
    digitalWrite(Dir, LOW); //Rotate direction
          for( i=1;i<=(dicesteps*3);i++){
          digitalWrite(Step, HIGH);
          delay(beltspeed);
          digitalWrite(Step, LOW);
          delay(beltspeed);}
  }
  if (request.indexOf("/cmd=4") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 4 Dice");
    digitalWrite(Dir, LOW); //Rotate direction
          for( i=1;i<=(dicesteps*4);i++){
          digitalWrite(Step, HIGH);
          delay(beltspeed);
          digitalWrite(Step, LOW);
          delay(beltspeed);}
  }
  if (request.indexOf("/cmd=5") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 5 Dice");
    digitalWrite(Dir, LOW); //Rotate direction
          for( i=1;i<=(dicesteps*5);i++){
          digitalWrite(Step, HIGH);
          delay(beltspeed);
          digitalWrite(Step, LOW);
          delay(beltspeed);}
  }
  if (request.indexOf("/cmd=6") != -1)  { //Move belt dicesteps forward
    Serial.println("Moving 6 Dice");
    digitalWrite(Dir, LOW); //Rotate direction
          for( i=1;i<=(dicesteps*6);i++){
          digitalWrite(Step, HIGH);
          delay(beltspeed);
          digitalWrite(Step, LOW);
          delay(beltspeed);}
  }
  
  // Return the response
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println(""); //  do not remove
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<h1 align=center>Dice Tower controlled over WiFi</h1><br />");
  client.println("<h2 align=center>Order Dice Below:</h2><br />");

  client.println("<div align=center>");
  client.println("<a href=\"/cmd=1\"\" ><button>1 Die </button></a><br />");
  client.println("<a href=\"/cmd=2\"\" ><button>2 Dice</button></a><br />");
  client.println("<a href=\"/cmd=3\"\" ><button>3 Dice</button></a><br />");
  client.println("<a href=\"/cmd=4\"\" ><button>4 Dice</button></a><br />");
  client.println("<a href=\"/cmd=5\"\" ><button>5 Dice</button></a><br />");
  client.println("<a href=\"/cmd=6\"\" ><button>6 Dice</button></a><br />");
  client.println("</div>");
  client.println("</html>");
  delay(1);
  Serial.println("");
 
}