#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>

int Step = 5;
int Dir  = 4;
float dicesteps = 28.70;
int beltspeed = 5;
int diceOrderStatus = 0;
String dieId[] = {"die1", "die2", "die3", "die4", "die5", "die6"};
String buttonTitle[] = {"1 Die", "2 Dice", "3 Dice", "4 Dice", "5 Dice", "6 Dice"};

//Connect på http://192.168.4.1

const char *ssid = "DiceTower";

ESP8266WebServer server(80);

void handleRoot() {
  String HTML = "<!DOCTYPE html>\
  <html>\
  <head>\
  \t\n<title>DiceTower</title>\
  \t\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\
  \n<style>\
 \nhtml,body{\t\nwidth:100%\;\nheight:100%\;\nmargin:0}\n*{box-sizing:border-box}\n.colorAll{\n\tbackground-color:#90ee90}\n.colorBtn{\n\tbackground-color:#add8e6}\n.angleButtdon,a{\n\tfont-size:30px\;\nborder:1px solid #ccc\;\ndisplay:table-caption\;\npadding:7px 10px\;\ntext-decoration:none\;\ncursor:pointer\;\npadding:5px 6px 7px 10px}a{\n\tdisplay:block}\n.btn{\n\tmargin:5px\;\nborder:none\;\ndisplay:inline-block\;\nvertical-align:middle\;\ntext-align:center\;\nwhite-space:nowrap}\n";

  HTML += "</style>\n\n</head>\n\n<body>\n<h1 align=center>DiceTower Controller</h1>\n";
  
  int k = 0;
  for ( int j = 1; j <= 6; j++) {
    if (diceOrderStatus == j) {
      HTML += "\t<div align=center class=\"btn\">\n\t\t<a class=\"angleButton\" style=\"background-color:#f56464\"  href=\"/dice?";
      HTML += dieId[k];
      HTML += "=ordered\">";
      HTML += buttonTitle[k];
    } else {
      HTML += "\t<div class=\"btn\">\n\t\t<a class=\"angleButton \" style=\"background-color:#90ee90\"  href=\"/dice?";
      HTML += dieId[k];
      HTML += "=ordered\">";
      HTML += buttonTitle[k];
    }
    HTML += "</a>\t\n\t</div>\n\n";
    k++;
  }
  HTML += "\t<div align=center>\n\t\t";
  HTML += "</div>";
  HTML += "</a>\t\n\t</div>\n\n";

  HTML += "\t\n</body>\n</html>\n";
  server.send(200, "text/html", HTML);
}

void handleNotFound() {
  String message = "Page Not Found - 404\n\n";
  message += "URL: ";
  message += server.uri();
  message += "\n";
  server.send(404, "text/plain", message);

}

void setup() {
  delay(1000);
  Serial.begin(115200);
  Serial.println();
  pinMode(Step, OUTPUT); //Step pin as output
  pinMode(Dir,  OUTPUT); //Direcction pin as output
  digitalWrite(Step, LOW); // Set no motor movement
  digitalWrite(Dir, LOW); // Set no motor movement
  Serial.println("-> -> Stepper Motor Instantiated! <- <-");
  WiFi.softAP(ssid);
  Serial.println("-> -> Setting Up Dice Tower WiFi <- <-");
  IPAddress myIP = WiFi.softAPIP();
  Serial.println("-> -> WiFi Access Point Up! <- <-");
  Serial.println("-> -> Setting Up Pages <- <-");
  server.on("/", handleRoot);
  server.on("/dice", HTTP_GET, dieControl);
  server.onNotFound(handleNotFound);
  server.begin();
  Serial.print("-> -> Belt Controller Is Ready! - Connect on: http://");
  Serial.print(myIP);
  Serial.print("! <- <-");
}

void loop(void) {
  server.handleClient();
  int i;
    digitalWrite(Dir, LOW); //Rotate direction
    for ( i = 1; i <= (dicesteps * diceOrderStatus); i++) {
      digitalWrite(Step, HIGH);
      delay(beltspeed);
      digitalWrite(Step, LOW);
      delay(beltspeed);
    }
    diceOrderStatus = 0;
    handleRoot();
  delay(1);
}

void dieControl() {
  if (server.arg(dieId[0]) == "ordered") {
    diceOrderStatus = 1;
  } else if (server.arg(dieId[1]) == "ordered") {
    diceOrderStatus = 2;
  } else if (server.arg(dieId[2]) == "ordered") {
    diceOrderStatus = 3;
  } else if (server.arg(dieId[3]) == "ordered") {
    diceOrderStatus = 4;
  } else if (server.arg(dieId[4]) == "ordered") {
    diceOrderStatus = 5;
  } else if (server.arg(dieId[5]) == "ordered") {
    diceOrderStatus = 6;
  }
  handleRoot();
}
