 Bacteria[] bacteria;
 Predator predator;

 void setup()   
 {     
 	size(500,500);
 	background(0,0,0);
 	bacteria = new Bacteria[500];
 	predator = new Predator();
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
 		predator.move();
 		predator.show();
 	}
 }



 class Bacteria    
 {     

	int bacteriaX;
	int bacteriaY;

	int bacteriaColor;

 	Bacteria(){
 		bacteriaX = (int)(Math.random()*500);
 		bacteriaY = (int)(Math.random()*500);
 		bacteriaColor = (int)(Math.random()*255);
 	}

 	void move(){
 		bacteriaX -= (int)(Math.random() * 20) - 10;
 		bacteriaY -= (int)(Math.random() * 20) - 10;
 	}

 	int returnX(){
 		return(bacteriaX);
 	}

 	int returnY(){
 		return(bacteriaY);
 	}

 	void show(){
 		fill(bacteriaColor);
 		ellipse(bacteriaX, bacteriaY, 5, 5);
 	}
 }  

 class Predator extends Bacteria {

 	Predator(){
 		bacteriaX = (int)(Math.random()*500);
 		bacteriaY = (int)(Math.random()*500);
 	}

 	@Override
 	void show(){
 		fill(255, 0, 0);
 		ellipse(bacteriaX, bacteriaY, 10, 10);
 	}

 }