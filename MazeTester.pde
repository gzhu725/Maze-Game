int max = 10;
CollectiblePoint[] collectibles = new CollectiblePoint[max];
PlayerPoint player = new PlayerPoint();

int collected = 0;

int l = 400;
int[] xcords = new int[l];
int[] xcords2 = new int[l];
int[] xcords3 = new int[l];
int[] ycords = new int[l];
int[] ycords2 = new int[l];
int[] ycords3 = new int[l];

void setup() {
  size(600,600);
  player.set(width/2, height/2, 100,0,100, false);
  for (int i = 0; i<collectibles.length; i++) {
    collectibles[i] = new CollectiblePoint();
    collectibles[i].set((int)(random(0,width)), (int)(random(0,height)), 255,100,0,true);
  }
  int start = 5;
for(int i = 0; i<l; i++) {
     xcords[i] = (int)(random(0,width));
     xcords2[i] = xcords[i] + (int)(random(20,50));
     ycords[i] = start;
     if(i%20 == 0 && i>=20) start += 30;
  }
  start = 5;
  for(int i = 0; i<l; i++) {
    xcords3[i] = start;
    ycords2[i] = (int)(random(0,height));
    ycords3[i] = ycords2[i] + (int)(random(20,50));
    if(i%20 == 0 && i>=20) start +=40;
  }
}
void draw() { 
background(255);
textSize(20);
text("POINT PATH", 10,20);
fill(0,0,0);
stroke(147,112,219);
strokeWeight(3);
 for(int i = 0; i<l; i++) {
  line(xcords[i], ycords[i], xcords2[i], ycords[i]);
  line(xcords3[i], ycords2[i], xcords3[i], ycords3[i]); }

  
for (int i = 0; i<collectibles.length;i++) {
  if(collectibles[i].getIsVisible()) {
    stroke(collectibles[i].r, collectibles[i].g, collectibles[i].b);
    strokeWeight(10);
    point(collectibles[i].posx, collectibles[i].posy);
  }
  if (dist(player.posx, player.posy, collectibles[i].posx,collectibles[i].posy) <=10 && collectibles[i].getIsVisible()) {
    //it keeps incrementing because ITS STILL within ddistance even if the thing is 
    //not visible
    collectibles[i].setIsVisible(false);
   collected++;
   //continue;
  }
  if(collected == max) {
    player.setIsFinished(true);
 }//BRACKET 
}
  color pixel = get(0,0);
  color purple = color(147,112,219);
  for(int k = 0; k<width;k++) {
    for(int j = 0; j<height;j++) {
      pixel = get(k,j);
      if(pixel == purple && player.posx == k && player.posy == j) {
        //for barriers
        if (keyCode == UP) {
        player.posy += 1;
        
      }
      if (keyCode == DOWN) {
        player.posy -=1;
      }
      if (keyCode == LEFT) {
        player.posx +=1;
      }
     if (keyCode == RIGHT) {
        player.posx -=1;
      }
      }
    }
  }

  stroke(255,0,255);
  strokeWeight(5); 
  point(player.posx, player.posy);
  
  if(keyPressed) {
    if(key == CODED) {
      if (keyCode == UP) {
        player.posy -= 1;
        
      }
      if (keyCode == DOWN) {
        player.posy +=1;
      }
      if (keyCode == LEFT) {
        player.posx -=1;
      }
      if (keyCode == RIGHT) {
        player.posx +=1;
      }
      
      
      
    }
  }
  
 if(player.posx<0) player.posx += 5;
 if(player.posx>width) player.posx -= 5;
 if(player.posy <0) player.posy += 5;
 if (player.posy >height) player.posy -=5;
  //-1 just make it stay still
  stroke(0);
  line(width-60, 3,width-20,3);
  line(width-60, 3,width-60,33);
  line(width-60, 33,width-20,33); 
  line(width-20, 3,width-20,33);
  textSize(30);
  text(collected, 550,25);
  
 if(player.getIsFinished()) {
    textSize(50);
    text("You collected all the points!", 20,300);
  }
  
}
