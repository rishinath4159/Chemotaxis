 Bacteria[] bacteria;
 Predator predator;

 void setup()   
 {     
 	size(500,500);
 	background(150,150,100);
 	bacteria = new Bacteria[500];
 	predator = new Predator();
 	for (int i = 0; i < bacteria.length; i++)
 	{
 		bacteria[i] = new Bacteria();
 	}
 }   


 void draw()   
 {    
 	fill(150,150,100);
 	rect(0, 0, 500, 500);

 	predator.move();
 	predator.chase(bacteria, predator.track(bacteria));
 	predator.eat(bacteria);
 	predator.show();

 	for (int i = 0; i < bacteria.length; i++)
 	{
 		if (bacteria[i].alive()){
 			bacteria[i].move();
 			bacteria[i].flee(predator.returnX(), predator.returnY());
 			bacteria[i].show(predator.returnX(), predator.returnY());
 		}
 	}
 }



 class Bacteria    
 {     

	int bacteriaX;
	int bacteriaY;
	boolean living;

	int bacteriaColor;

 	Bacteria(){
 		bacteriaX = (int)(Math.random()*500);
 		bacteriaY = (int)(Math.random()*500);
 		bacteriaColor = (int)(Math.random()*255);
 		living = true;
 	}

 	void move(){
 		bacteriaX = wrap(bacteriaX);
 		bacteriaY = wrap(bacteriaY);
 		bacteriaX += (int)(Math.random() * 11) - 5;
 		bacteriaY += (int)(Math.random() * 11) - 5;
 	}

 	void die(){
 		living = false;
 	}

 	boolean alive(){
 		return(living);
 	}

 	int returnX(){
 		return(bacteriaX);
 	}

 	int returnY(){
 		return(bacteriaY);
 	}

 	void show(int x, int y){
 		if (dist(bacteriaX, bacteriaY, x, y) < 60){
 			fill(255,0,0);
 		} else {
 			fill(bacteriaColor);
 		}
 		ellipse(bacteriaX, bacteriaY, 5, 5);
 	}

 	void flee(int x, int y){
 		if (dist(bacteriaX, bacteriaY, x, y) < 50){
 			if (bacteriaX > x){
 				bacteriaX += 2;
 			} else {
 				bacteriaX -= 2;
 			}
 			if (bacteriaY > y){
 				bacteriaY += 2;
 			} else {
 				bacteriaY -= 2;
 			}
 		}
 	}
 }  

 class Predator extends Bacteria {

 	int size;
 	int prey;
 	float preyDist;
 	int col1;
 	int col2;
 	int col3;

 	Predator(){
 		bacteriaX = 250;
 		bacteriaY = 250;
 		size = 10;

 		prey = 0;
 		preyDist = 200;

 		col1 = (int)(Math.random() * 255);
 		col2 = (int)(Math.random() * 255);
 		col3 = (int)(Math.random() * 255);
 	}

 	void show(){
 		fill(col1, col2, col3);
 		ellipse(bacteriaX, bacteriaY, size, size);
 	}

 	void move(){
 		bacteriaX = wrap(bacteriaX);
 		bacteriaY = wrap(bacteriaY);
 		bacteriaX += (int)(Math.random() * 5) - 2;
 		bacteriaY += (int)(Math.random() * 5) - 2;
 	}

 	int track(Bacteria[] bacteria){
 		if (!bacteria[prey].alive()){
 			for (int i=0; i<bacteria.length; i++){
 				preyDist = 200;
 				if (dist(bacteriaX, bacteriaY, bacteria[i].returnX(), bacteria[i].returnY()) < preyDist && bacteria[i].alive()) {
	 				prey = i;
	 				preyDist = dist(bacteriaX, bacteriaY, bacteria[i].returnX(), bacteria[i].returnY());
 				}
 			}

 		}
 		return(prey);
 	}

 	void chase(Bacteria[] bacteria, int i){
 		if (bacteriaX < bacteria[i].returnX()){
 			bacteriaX += 3;
 		} else {
 			bacteriaX -= 3;
 		}

 		if (bacteriaY < bacteria[i].returnY()){
 			bacteriaY += 3;
 		} else {
 			bacteriaY -= 3;
 		}
 	}

 	void eat(Bacteria[] bacteria){
 		for (int i=0; i<bacteria.length; i++){
 			if (dist(bacteriaX, bacteriaY, bacteria[i].returnX(), bacteria[i].returnY()) < 10 && bacteria[i].alive()) {
 				bacteria[i].die();
	 			col1 = (int)(Math.random() * 255);
	 			col2 = (int)(Math.random() * 255);
	 			col3 = (int)(Math.random() * 255);
 			}
 		}
 	}
 
 }



 int wrap (int pos){
 	if (pos > 500){
 		return (int) pos % 500;
 	}
 	return pos;	
 }
 