package 
{
	import com.friendsofed.vector.VectorModel;
	import flash.geom.Point;
	import flash.globalization.NumberFormatter;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import Disparador;
	
	public class Bolas extends Sprite 
	{
		
		
		

		

		
		public var laneta:Number;
		public var congelado:Boolean;
		
		public var posAnteriorX:Number;
		public var posAnteriorY:Number;
		
		public var posActualX:Number;
		public var posActualY:Number;
		
		public var _speed:Number;
		
		public function Bolas(pX:Number, pY:Number, angle:Number, speed:Number = 0 ) 
		{
			super();
			 
			
			posActualX = pX;
			posActualY = pY;
			
			posAnteriorX = posActualX - Math.cos(angle) * speed;
			posAnteriorY = posActualY - Math.sin(angle) * speed;
			
			_speed = speed;

			
				
		}
		
		
		//get and set
		public function setPosX(num:Number):void{
			posActualX = num;
		}
		public function setPosY(num:Number):void{
			posActualY = num;
		}		
		public function getSpeedX():Number{
			
			return (getPosX() - posAnteriorX);
			
		}
		public function getSpeedY():Number{
			return (getPosY() - posAnteriorY);
		}
		public function getPosX():Number{
			return posActualX;
		}
		public function getPosY():Number{
			return posActualY;
		}
		public function setSpeedX(num:Number):void{
			posAnteriorX = (getPosX() - num);
			
		}
		public function setSpeedY(num:Number):void{
			posAnteriorY = (getPosY() -num);
		}
		public function setX(num:Number):void{
			posAnteriorX = (num - getSpeedX());
			setPosX(num);
			
		}
		public function setY(num:Number):void{
			posAnteriorY = (num - getSpeedY());
			setPosY(num);
		}
		public function getSpeed():Number{
			return _speed;
		}
		public function setModX(num:Number):void{
			posActualX + num;
		}
		public function setModY(num:Number):void{
			posActualY + num;
		}
		
		public function getCentroImagen(imagen:Image):Point{
			return new Point(imagen.x, imagen.y);
		}
		public function get PosX():Number{ return posActualX; }
		public function get PosY():Number{ return posActualY; }
		public function get Vx():Number {return PosX - posAnteriorX};
		public function get Vy():Number {return PosY - posAnteriorY};
		public function set PosX(x:Number):void {posActualX = x; };
		public function set PosY(x:Number):void {posActualY = x; };
		
	
		
		
		
		
		public function move():void{
			
			
			var auxX:Number = getPosX();
			var auxY:Number = getPosY();

			setPosX(getPosX() + getSpeedX());
			setPosY(getPosY() + getSpeedY());
			

			posAnteriorX = auxX;
			posAnteriorY = auxY;

				
		}
			
		//random generators
		/*
		private function GetRandomXPosition():Number{
			return Math.floor(Math.random() * (1+ (stage.stageWidth + _bolasImage.width) + _bolasImage.width) - _bolasImage.width);
		}
		private function GetRandomYPosition():Number{
			return Math.floor(Math.random() * (1+ (stage.stageHeight + _bolasImage.height) + _bolasImage.height) - _bolasImage.height);
		}
		*/
	}
}
