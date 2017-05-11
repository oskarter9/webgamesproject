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
	public class BolaAuxiliar extends Bolas
	{
		private var _scaleX:Number;
		private var _scaleY:Number;
		private var _posX:Number;
		private var _posY:Number;
		private var _imageBolaAuxiliar:Image;
		
		public function BolaAuxiliar(imageBolaAuxiliar:Image, escaladoX:Number, escaladoY:Number, posX:Number, posY:Number) 
		{
			super(posX, posY, 0, 0);
			_imageBolaAuxiliar = imageBolaAuxiliar;
			_scaleX = escaladoX;
			_scaleY = escaladoY;
			_posX = posX;
			_posY = posY;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		private function onAddedToStage(e:Event):void{
			
			_imageBolaAuxiliar.x = _posX;
			_imageBolaAuxiliar.y = _posY;
			_imageBolaAuxiliar.scaleX = _scaleX;
			_imageBolaAuxiliar.scaleY = _scaleY;
			_imageBolaAuxiliar.visible = false;
			//_imageBolaAuxiliar.alignPivot();
			
			
			
			
			
		}
	}

}