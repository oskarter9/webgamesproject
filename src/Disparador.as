package 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.utils.deg2rad;
	
	public class Disparador extends Sprite
	{
		private var _nivel:Sprite;
		public var _disparadorImage:Image;
		
		public function Disparador(nivel:Sprite, disparadorImage:Image)
		{
			_nivel = nivel;
			_disparadorImage = disparadorImage;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);	
		}
		
		private function onAddedToStage(e:starling.events.Event):void
		{
			
			configDisparador();

			_nivel.addChild(_disparadorImage);
		}
		private function configDisparador():void {
			
			//_disparadorImage.alignPivot();
			_disparadorImage.width = _disparadorImage.width/2;
			_disparadorImage.height = _disparadorImage.height / 2;
			//_disparadorImage.visible = false;
			_disparadorImage.x = stage.width / 2 ;
			_disparadorImage.y = stage.height / 2 ;
		}
		
	}	
}