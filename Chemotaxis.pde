 Bacteria[] bacteria;

 void setup()   
 {     
 	size(500,500);
 	background(0,0,0);
 	bacteria = new Bacteria[500];
 	for (int i = 0; i < bacteria.length; i++)
 	{
 		bacteria[i] = new Bacteria();
 	}
 }   


 void draw()   
 {    
 	fill(0,0,0);
 	rect(0, 0, 500, 500);
 	for (int i = 0; i < bacteria.length; i++)
 	{
 		bacteria[i].move();
 		bacteria[i].show();
 	}
 }

 void mousePressed(){
 	for (int i = 0; i < bacteria.length; i++)
 	{
 		bacteria[i].target(mouseX, mouseY);
 	}
 }


 class Bacteria    
 {     

	int bacteriaX;
	int bacteriaY;

	int targetX;
	int targetY;

 	Bacteria(){
 		bacteriaX = (int)(Math.random()*500);
 		bacteriaY = (int)(Math.random()*500);
 	}

 	void move(){
 		if(bacteriaX < mouseX){
 			bacteriaX += Math.floor(Math.random() * Math.floor(10));
 		} else if (bacteriaX > mouseX){
 			bacteriaX += Math.floor(Math.random() * Math.floor(10)) - 20;
 		}

 		if(bacteriaY < mouseY){
 			bacteriaY += Math.floor(Math.random() * Math.floor(10));
 		} else if (bacteriaY > mouseY){
 			bacteriaY += Math.floor(Math.random() * Math.floor(10)) - 20;
 		}
 		bacteriaX += Math.floor(Math.random() * Math.floor(3)) - 1;
 		bacteriaY += Math.floor(Math.random() * Math.floor(3)) - 1;
 	}

 	void target(int x, int y){
 		targetX = x;
 		targetY = y;
 	}

 	void show(){
 		fill(255,0,0);
 		ellipse(bacteriaX, bacteriaY, 5, 5);
 	}
 }  
