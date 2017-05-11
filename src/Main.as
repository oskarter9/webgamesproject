package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	[SWF(frameRate = "60", width = "960", height = "640", backgroundColor = "0x0000ff")]
	
	public class Main extends Sprite 
	{
		private var mystarling: Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			trace("starling framework initialized!");
			
			mystarling = new Starling(Juego, stage);
			mystarling.antiAliasing = 1;
			mystarling.start();
			removeEventListener(Event.ADDED_TO_STAGE, init);

		}
		
	}
	
}