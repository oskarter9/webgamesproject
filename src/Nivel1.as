package

{
	import flash.events.MouseEvent;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.utils.deg2rad;
	import starling.utils.VectorUtil;
	import com.friendsofed.vector.*;
	//import com.friendsofed.utils.*
	
	public class Nivel1 extends Sprite
	{
		private var nivel1BG:Image;
		private var disparadorImage:Image;
		private var disparador:Disparador;
		private var bolaEnemigaImage:Image;
		private var bola:Bolas;
		private var bolaEnemiga:BolasEnemigas;
		private var bolaDisparadorImage:Image;
		private var bolaDisparador:BolasDisparador;
		private var i:Number;
		private var touch:Touch;
		private var clickTouch:Touch;
		private var pivote:Number;
		//private var numBolas:Number;
		public var bolasDisparador:Vector.<BolasDisparador>;
		public var bolasEnemigas:Vector.<BolasEnemigas>;
		private var hemosDado:Boolean;
		private var bolaAuxiliarDisparadorImage:Image;

		public var bolaAuxiliarDisparador:BolaAuxiliar
		
		
		private var v0:VectorModel;
		private var v1:VectorModel;
		private var v2:VectorModel;
		private var v3:VectorModel;
		
		private var limite_infX:Number;
		private var limite_supX:Number;
		private var limite_infY:Number;
		private var limite_supY:Number;
		
		public function Nivel1() 
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage (event:Event): void 
		{
			
			//inicializamos vectores de VectorModel
			
			v0 = new VectorModel();
			v1 = new VectorModel();
			v2 = new VectorModel();
			v3 = new VectorModel();
			
			//inicializamos vectores
			bolasDisparador = new Vector.<BolasDisparador>();
			bolasEnemigas = new Vector.<BolasEnemigas>();
			
			nivel1BG = new Image(Assets.getTexture("nivel1BG"));
			this.addChild(nivel1BG);
		
			//instanciamos el disparador
			creaDisparador();
			//situamos el disparador
			this.addChild(disparador);
			trace(disparador._disparadorImage.x);
			trace(disparador._disparadorImage.y);
			
			bolaAuxiliarDisparadorImage = new Image(Assets.getTexture("bolaAuxiliarImage"));
		    bolaAuxiliarDisparador = new BolaAuxiliar(bolaAuxiliarDisparadorImage, disparador._disparadorImage.scaleX, disparador._disparadorImage.scaleY, disparador._disparadorImage.x, disparador._disparadorImage.y);
			this.addChild(bolaAuxiliarDisparador);
			this.addChild(bolaAuxiliarDisparadorImage);
			
			bolaAuxiliarDisparadorImage.pivotX = disparadorImage.pivotX;
			bolaAuxiliarDisparadorImage.pivotY = disparadorImage.pivotY;
		
			
			/*
			bolaAuxiliarDisparadorImage.x = disparadorImage.x;
			bolaAuxiliarDisparadorImage.y = disparadorImage.y;
			bolaAuxiliarDisparadorImage.scaleX = disparadorImage.scaleX;
			bolaAuxiliarDisparadorImage.scaleY = disparadorImage.scaleY;
			*/
			
			//trace("se ha añadido la bola");
			//trace(bolaAuxiliarDisparador.x);
			//trace(bolaAuxiliarDisparador.y);
			//esparcimos las bolas por el mapa
			esparcirBolas(20);
			
			//llamamos a los listeners
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			this.addEventListener(Event.ENTER_FRAME, onGame);
		}
		
		private function esparcirBolas(numBolas:Number):void{
			
			for (i = 0; i < numBolas; i++){
				
				bolaEnemigaImage = new Image(BolasImage.getTexture("bola"));
				limite_infX = 0 + bolaEnemigaImage.width / 2;
				limite_infY = 0 + bolaEnemigaImage.height / 2;
				limite_supX = stage.stageWidth - bolaEnemigaImage.width / 2;
				limite_supY = stage.stageHeight - bolaEnemigaImage.height / 2;
			
				
				
				//addChild(bolaEnemigaImage);
				
				//PENDIENTE DE REVISON
				var randomX:Number = Math.floor(Math.random() * (limite_supX - limite_infX + 1 )) + limite_infX;
													  
				var randomY:Number = Math.floor(Math.random() * (limite_supY - limite_infY + 1 )) + limite_infY; 
				var anguloRandom:Number = Math.random() * 2 * Math.PI;
				
				
				bolaEnemiga = new BolasEnemigas(bolaEnemigaImage, randomX, randomY, anguloRandom);
				
				//rellenamos vector bolasEnemigas
				bolasEnemigas[i] = bolaEnemiga;
				
				//la instanciamos
				addChild(bolaEnemiga);

			}
		}
		
	
		
		
		private function creaDisparador():void{
			
			disparadorImage = new Image(DisparadorImage.getTexture("disparador"));
			disparador = new Disparador(this, disparadorImage);
			
			pivote = 45; //calculado a partir de los píxeles hasta el centro
			disparadorImage.pivotX = pivote;
			disparadorImage.pivotY = pivote;
			
		}
		
		private function creaBolaDisparador():void{
			
		//posición ratón en el click y sin clickar	
			
			//calculamos la posicion en la que hacemos click
			var posx:Number = touch.globalX - disparadorImage.x;//global to local
			var posy:Number = touch.globalY - disparadorImage.y;//global to local
			var iniciox:Number = disparadorImage.x + disparadorImage.pivotX * Math.cos(disparadorImage.rotation + deg2rad(90));
			var inicioy:Number = disparadorImage.y + disparadorImage.pivotY * Math.sin(disparadorImage.rotation + deg2rad(90));
			var anguloSalida:Number = Math.atan2(posy, posx);
			//creamos la bola
			bolaDisparadorImage = new Image(BolasDisparadorImage.getTexture("bolaDisparador"));
			bolaDisparador = new BolasDisparador(bolaDisparadorImage, iniciox, inicioy, anguloSalida);
			
			
		}

		private function onTouch(e:TouchEvent):void{
			
			touch = e.getTouch(stage);
			if (touch)
			{
				if (touch.phase == TouchPhase.HOVER)//sin click
				{
					//calculamos angulo a partir de cateto contiguo y cateto opuesto.
					var opuesto:Number = touch.globalY - disparadorImage.y;
					var contiguo:Number = touch.globalX - disparadorImage.x;
					var angulo:Number =  deg2rad(270) + Math.atan2(opuesto, contiguo);
					
					//aplicamos dicho angulo a la rotación
					disparadorImage.rotation = angulo;
				}
				if (touch.phase == TouchPhase.BEGAN)//con click
				{
					//creamos bola disparador
					creaBolaDisparador();
					//instanciamos bola disparador
					
					bolasDisparador.push(bolaDisparador);
					//trace(bolasDisparador.length);
					addChild(bolaDisparador);
					
					
				}
			}		
		}
				

		private function onGame(e:Event):void
		{
			bolaAuxiliarDisparadorImage.rotation = disparadorImage.rotation;
			comprobarColisiones();
			moverBolas();
			if (bolasEnemigas.length >= 0){
				comprobarColisionesBolasDist();
			}
			
			
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		private function moverBolas():void{
			
			if (bolasDisparador.length > 0){
				
				for (var i:int = bolasDisparador.length - 1; i >= 0; i--){
					
					if (bolasDisparador[i].destroy() == false){
						
						bolasDisparador[i].move();
					}
					else{
						
						removeChild(bolasDisparador[i]);
						bolasDisparador.removeAt(i);
					}
				}
			}
		}
		
		private function comprobarColisionesBolasDist():void{
			
			
			if (bolasDisparador.length >= 0){
				
				for (var i:int = 0; i < bolasEnemigas.length;i++ ){
				
					
					
					for (var j:int = 0; j < bolasDisparador.length; j++ ){
						
						 
						
						if (collisionEntreBolasDist(bolasEnemigas[i], bolasDisparador[j])){
						
							removeChild(bolasEnemigas[i]);
							removeChild(bolasDisparador[j]);
							bolasEnemigas.removeAt(i);
							bolasDisparador.removeAt(j);
							
			
							if (bolasEnemigas.length == 0 && bolasDisparador.length > 0){
								break;
							}
							
	
						}
				
					}

					
					
				}
				
			}
		}
		
		private function comprobarColisiones():void{
			
			if (bolasEnemigas.length > 0){
				

				
				for (var j:int = bolasEnemigas.length -1 ; j >= 0; j--){
					
					
					for (var k:int = 0; k < j; k++ ){
						
						if (collisionEntreBolas(bolasEnemigas[j], bolasEnemigas[k]) ==true){
							
							//bolasEnemigas[j].setSpeed();
							//bolasEnemigas[k].setSpeed();   
							reboteEntreDosBolas(bolasEnemigas[j], bolasEnemigas[k]);
							
							
							
							//trace("HAN CHOCADO DOS BOLAS");
							
						}
						
					}
					
					if (colisionConDisparador(bolasEnemigas[j], bolaAuxiliarDisparador)){
						
							reboteConDisparador(bolasEnemigas[j], bolaAuxiliarDisparador);
						
					}
					bolasEnemigas[j].move();	
				}
				
			}
			
			
			
		}
		
		//comprueba el choque con las paredes del stage (metodo insideLimits() un poco chungo
		/*
		private function insideLimits(bola:BolasEnemigas):void{
			
			
			if (bola.getPosX() < 0){
				bola.getPosX().x = 0;
				bola.setSpeedX(bola.getSpeedX() * ( -1));
			}
			if (bola.getPosX() > (stage.stageWidth - bola._bolasEnemigasImage.width)){
				bola.setPosX(stage.stageWidth - bola._bolasEnemigasImage.width);
				bola.setSpeedX(bola.getSpeedX() * ( -1));
			}
			if (bola.getPosY() < 0){
				bola.setPosY(0);
				bola.setSpeedY(bola.getSpeedY() * ( -1));
			}
			if (bola.getPosY() > (stage.stageHeight - bola._bolasEnemigasImage.height)){
				bola.setPosY(stage.stageHeight - bola._bolasEnemigasImage.height);
				bola.setSpeedY(bola.getSpeedY() * ( -1));
				
			}
		}
		
		
		*/
		//comprueba el choque con las paredes del stage
		
		
		private function colisionConDisparador(bola:BolasEnemigas, bolaAuxDisparador:BolaAuxiliar):Boolean{
			
			v0.update(bola.getPosX(), bola.getPosY(), bolaAuxDisparador.getPosX(), bolaAuxDisparador.getPosY());
			
			var distanciaMaxima:Number = bola._bolasEnemigasImage.width / 2 + bolaAuxiliarDisparadorImage.width / 2;
			if (v0.m < distanciaMaxima){
				return true;
			}
			return false;
			
			
			
			
		}
		
		
		private function collisionEntreBolas(bolaUno:BolasEnemigas, bolaDos:BolasEnemigas):Boolean{
			
			v0.update(bolaUno.getPosX(), bolaUno.getPosY(), bolaDos.getPosX(), bolaDos.getPosY());
			
			var distanciaMaxima:Number;
			distanciaMaxima = bolaUno._bolasEnemigasImage.width / 2 + bolaDos._bolasEnemigasImage.width / 2;
			
			
			if (v0.m <  distanciaMaxima){
				
				return true;
				//trace("están MÁS que pegadas. ");
			}
			
			
			return false;
		}
		
		private function collisionEntreBolasDist(bolaUno:BolasEnemigas, bolaDos:BolasDisparador):Boolean{
			
			v0.update(bolaUno.getPosX(), bolaUno.getPosY(), bolaDos._bolasDisparadorImage.x, bolaDos._bolasDisparadorImage.y);
			
			var distanciaMaxima:Number;
			distanciaMaxima = bolaUno._bolasEnemigasImage.width / 2 + bolaDos._bolasDisparadorImage.width / 2;
			
			
			if (v0.m <  distanciaMaxima){
				
				return true;
				//trace("están MÁS que pegadas. ");
			}
			
			
			return false;
		}
		
		public function reboteEntreDosBolas(bolaUno:BolasEnemigas, bolaDos:BolasEnemigas):void{
			
				//faltara comprobar esto y ya estaria xd
				var sumaDeLosRadios:Number = bolaUno._bolasEnemigasImage.width / 2 + bolaDos._bolasEnemigasImage.width / 2;
	
				
				var interseccionBolas:Number = sumaDeLosRadios - v0.m;
				var fuerzaColisionX:Number = Math.abs(v0.dx * interseccionBolas);
				var fuerzaColisionY:Number = Math.abs(v0.dy * interseccionBolas);
				
				var auxX:Number;
				var auxY:Number;
				
				if (bolaUno.getPosX() > bolaDos.getPosX()){
					auxX = 1;
				}
				else{
					auxX = -1;
				}
				if (bolaUno.getPosY() > bolaDos.getPosY()){
					auxY = 1;
				}
				else{
					auxY = -1;
				}
				bolaUno.setX(bolaUno.getPosX() + (fuerzaColisionX * auxX));
				bolaUno.setY(bolaUno.getPosY() + (fuerzaColisionY * auxY));
				
				bolaDos.setX(bolaDos.getPosX() + (fuerzaColisionX * -auxX));
				bolaDos.setY(bolaDos.getPosY() + (fuerzaColisionY * -auxY));
				
				v1.update(bolaUno.getPosX(), bolaUno.getPosY(), bolaUno.getPosX() + bolaUno.getSpeedX(), bolaUno.getPosY() + bolaUno.getSpeedY());
				v2.update(bolaDos.getPosX(), bolaDos.getPosY(), bolaDos.getPosX() + bolaDos.getSpeedX(), bolaDos.getPosY() + bolaDos.getSpeedY());
				
				var proyeccionBolaUno1:VectorModel = VectorMath.project(v1, v0);
				var proyeccionBolaUno2:VectorModel = VectorMath.project(v1, v0.ln);
				var proyeccionBolaDos1:VectorModel = VectorMath.project(v2, v0);
				var proyeccionBolaDos2:VectorModel = VectorMath.project(v2, v0.ln);
				
				bolaUno.setSpeedX (proyeccionBolaUno2.vx + proyeccionBolaDos1.vx);
				bolaUno.setSpeedY (proyeccionBolaUno2.vy + proyeccionBolaDos1.vy);
				
				bolaDos.setSpeedX (proyeccionBolaUno1.vx + proyeccionBolaDos2.vx);
				bolaDos.setSpeedY (proyeccionBolaUno1.vy + proyeccionBolaDos2.vy);
				
			
				
				
				
				
				//var moduloSpeedX = Math.sqrt((bolaDos.getSpeedX() - bolaUno.getSpeedX())*(bolaDos.getSpeedX() - bolaUno.getSpeedX())+ 
				
				//var fuerzaColisionX:Number = Math.abs((bolaDos.getSpeedX()) * interseccionBolas);
				//var fuerzaColisionY:Number = Math.abs((bolaDos.y - bolaUno.y) * interseccionBolas);
				
				
				
				 
		}
		
		public function reboteConDisparador(bola:BolasEnemigas, disparador:BolaAuxiliar):void{
			
				var distanciaMaxima: Number = bola._bolasEnemigasImage.width / 2 + bolaAuxiliarDisparadorImage.width / 2;
				var interseccion:Number = distanciaMaxima - v0.m;
				
				bola.setX(bola.getPosX() - (interseccion * v0.dx));
				bola.setY(bola.getPosY() - (interseccion * v0.dy));
				
				v1.update(bola.getPosX(), bola.getPosY(), bola.getPosX() + bola.getSpeedX(), bola.getPosY() + bola.getSpeedY());
				
				var rebote:VectorModel = VectorMath.bounce(v1, v0.ln);
				bola.setSpeedX(rebote.vx);
				
				
			
		}
	}	
}