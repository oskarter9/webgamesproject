package 
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	
	public class MenuControles extends Sprite 
	{
		private var menuControles:Image;
		private var backButton:Button;
		
		public function MenuControles() 
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage (event:Event): void 
		{		
			menuControles = new Image(Assets.getTexture("menuControles"));
			
			backButton = new Button(Assets.getTexture("botonBack"));
			backButton.x = 480 - (backButton.width / 2);
			backButton.y = 550 - (backButton.height / 2);
			
			this.addChild(menuControles);
			this.addChild(backButton);
			
			this.addEventListener(Event.TRIGGERED, onMenuControlesClick);
		}
		
		private function onMenuControlesClick(e:Event):void
		{
			var buttonClicked:Button = e.target as Button;
			if ((buttonClicked as Button) == backButton)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"back"}, true));
			}
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}
}