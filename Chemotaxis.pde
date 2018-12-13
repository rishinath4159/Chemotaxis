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

	int bacteriaColor;

 	Bacteria(){
 		bacteriaX = (int)(Math.random()*500);
 		bacteriaY = (int)(Math.random()*500);
 		bacteriaColor = (int)(Math.random()*255);
 	}

 	void move(){
 		if(bacteriaX < targetX){
 			bacteriaX += (int)(Math.random() * 10);
 		} else if (bacteriaX > targetX){
 			bacteriaX -= (int)(Math.random() * 10);
 		}

 		if(bacteriaY < targetY){
 			bacteriaY += (int)(Math.random() * 10);
 		} else if (bacteriaY > targetY){
 			bacteriaY -= (int)(Math.random() * 10);
 		}
 		
 		bacteriaX -= (int)(Math.random() * 20) - 10;
 		bacteriaY -= (int)(Math.random() * 20) - 10;
 	}

 	void target(int x, int y){
 		targetX = x;
 		targetY = y;
 	}

 	void show(){
 		fill(bacteriaColor);
 		ellipse(bacteriaX, bacteriaY, 5, 5);
 	}
 }  
