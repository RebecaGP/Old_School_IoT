import websockets.*;

WebsocketServer ws;
int now;
float x,y;

void setup(){
  size(200,200);
  ws= new WebsocketServer(this,8025,"/");
  now=millis();
  x=0;
  y=0;
}

void draw(){
  background(0);
  ellipse(x,y,10,10);
  if(millis()>now+5000){
    ws.sendMessage("ping");
    now=millis();
  }
}

void webSocketServerEvent(String msg){
 println(msg);
 x=random(width);
 y=random(height);
}
