package 
{	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.utils.deg2rad;
	
	public class BolasDisparador extends Bolas
	{
		public var _bolasDisparadorImage:Image;
		private var _disparadorImage:Image;
		private var _posX:Number;
		private var _posY:Number;
		
		public function BolasDisparador(bolasDisparadorImage:Image, posX:Number, posY:Number, angulo:Number) 
		{
			super(posX, posY, angulo, 4);
			_bolasDisparadorImage = bolasDisparadorImage;
			
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:starling.events.Event):void
		{
			//configurar disparador bolas
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			configDisparadorBolas();
			
			
			//instanciamos la bola
			
		}
		
		
		override public function move():void
		{
			var _auxX:Number = getPosX();
			var _auxY:Number = getPosY();
			
			setPosX(getPosX() + getSpeedX());
			setPosY(getPosY() + getSpeedY());
			
			posAnteriorX = _auxX;
			posAnteriorY = _auxY;
			
			_bolasDisparadorImage.x = getPosX();
			_bolasDisparadorImage.y = getPosY();
			
			_bolasDisparadorImage.rotation+=0.1
			
		}
		
		public function destroy():Boolean{
		
			
			if (_bolasDisparadorImage.x < 0){
				return true;
			}
			if (_bolasDisparadorImage.x > (stage.stageWidth - _bolasDisparadorImage.width)){
				return true;
			}
			if (_bolasDisparadorImage.y < 0){
				return true;
			}
			if (_bolasDisparadorImage.y > (stage.stageHeight - _bolasDisparadorImage.height)){
				return true;
				
			}
			return false;
		}
		private function configDisparadorBolas():void{
			
			//escalamos
			_bolasDisparadorImage.width = _bolasDisparadorImage.width/2;
			_bolasDisparadorImage.height = _bolasDisparadorImage.height / 2;
			
			_bolasDisparadorImage.x = posActualX;
			_bolasDisparadorImage.y = posActualY;
			_bolasDisparadorImage.alignPivot();
			
			this.addChild(_bolasDisparadorImage);
		}
	}
}