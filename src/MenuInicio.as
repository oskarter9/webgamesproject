package 
{
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MenuInicio extends Sprite
	{
		private var menuInicio:Image;
		private var playButton:Button;
		private var controlsButton:Button;
		
		public function MenuInicio() 
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage (event:Event): void 
		{
			
			menuInicio = new Image(Assets.getTexture("menuInicio"));
			
			playButton = new Button(Assets.getTexture("playGrande"));
			playButton.x = 480 - (playButton.width / 2);
			playButton.y = 320 - (playButton.height / 2);
			
			controlsButton = new Button(Assets.getTexture("botonControls"));
			controlsButton.x = 480 - (controlsButton.width / 2);
			controlsButton.y = 500 - (controlsButton.height / 2);
			
			this.addChild(menuInicio);
			this.addChild(playButton);
			this.addChild(controlsButton);
			
			this.addEventListener(Event.TRIGGERED, onMenuInicioClick);
		}
		
		private function onMenuInicioClick(e:Event):void
		{
			var buttonClicked:Button = e.target as Button;
			if ((buttonClicked as Button) == playButton)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"levels"}, true));
			}
			else if ((buttonClicked as Button) == controlsButton)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"controls"}, true));
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