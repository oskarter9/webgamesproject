package 
{
	import com.friendsofed.vector.VectorModel;
	import flash.globalization.NumberFormatter;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ricky
	 */
	public class BolasEnemigas extends Bolas 
	{
		public var _bolasEnemigasImage:Image;
		
		
		
		public function BolasEnemigas(bolasImage:Image, pX:Number, pY:Number, angle:Number) 
		{
			super(pX, pY, angle, 4);
			
			_bolasEnemigasImage = bolasImage;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			
		}
		
		private function onAddedToStage(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			configuraBolaEnemiga();
		}
		private function configuraBolaEnemiga():void{
			
			
			_bolasEnemigasImage.width = _bolasEnemigasImage.width / 2;
			_bolasEnemigasImage.height = _bolasEnemigasImage.height / 2;
			
			_bolasEnemigasImage.x = posActualX;
			_bolasEnemigasImage.y = posActualY;
			
			_bolasEnemigasImage.alignPivot();
			
			this.addChild(_bolasEnemigasImage);
			
				
		}
		/*
		private function insideLimits():void{
			
			
			if (getPosX() < 0 + _bolasEnemigasImage.width/2){
				
				setModX(_bolasEnemigasImage.width/2);
				setSpeedX(getSpeedX() * ( -1));
			}
			if (getPosX() > (stage.stageWidth - _bolasEnemigasImage.width/2)){
				
				setModX(-_bolasEnemigasImage.width/2);
				setSpeedX(getSpeedX() * ( -1));
			}
			if (getPosY() < 0 + _bolasEnemigasImage.height/2){
			
				setModY(_bolasEnemigasImage.height / 2);
				setSpeedY(getSpeedY() * ( -1));
			}
			if (getPosY() > (stage.stageHeight - _bolasEnemigasImage.height/2)){
				
				setModY(-_bolasEnemigasImage.height/2);
				setSpeedY(getSpeedY() * ( -1));
				
			}
		}
		*/
		private function insideLimits():void{
			
			if (getCentroImagen(_bolasEnemigasImage).x  < 0 + _bolasEnemigasImage.width/2){
				setSpeedX(getSpeedX() *-1);
			}
			if (getCentroImagen(_bolasEnemigasImage).x > stage.stageWidth - _bolasEnemigasImage.width/2){
				setSpeedX(getSpeedX() * -1);
			}
			if (getCentroImagen(_bolasEnemigasImage).y < 0 + _bolasEnemigasImage.height/2){
				setSpeedY(getSpeedY() * -1);
			}
			if (getCentroImagen(_bolasEnemigasImage).y > stage.stageHeight - _bolasEnemigasImage.height/2){
				setSpeedY(getSpeedY() * -1);
			}
			
			
		}
		
		private function testingVelocity():void{
			
			if (Math.abs(getSpeedX())<1){
				setSpeedX(1);
			}
			if (Math.abs(getSpeedY()) < 1){
				setSpeedY(1);
			}
			
		}
		override public function move():void{
			
			var _auxX:Number = getPosX();
			var _auxY:Number = getPosY();
			
			setPosX(getPosX() + getSpeedX());
			setPosY(getPosY() + getSpeedY());
			
			posAnteriorX = _auxX;
			posAnteriorY = _auxY;
			
			_bolasEnemigasImage.x = getPosX();
			_bolasEnemigasImage.y = getPosY();
			
			_bolasEnemigasImage.rotation+=0.1
			
			insideLimits();
			//testingVelocity();
			
		}
		
	}

}