package 
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	
	public class MenuNiveles extends Sprite 
	{
		private var menuNiveles:Image;
		private var backButton:Button;
		private var level1Button:Button;
		private var level2Button:Button;
		private var nivel1:Nivel1;
		private var nivel2:Nivel2;
		
		public function MenuNiveles() 
		{
			super();
			nivel1 = new Nivel1();
			nivel1.disposeTemporarily();
			this.addChild(nivel1);
			
			//nivel2 = new Nivel2();
			//nivel2.disposeTemporarily();
			//this.addChild(nivel2);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage (event:Event): void 
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, OnChangeScreen);
			
			menuNiveles = new Image(Assets.getTexture("menuNiveles"));
			backButton = new Button(Assets.getTexture("botonBack"));
			backButton.x = 480 - (backButton.width / 2);
			backButton.y = 550 - (backButton.height / 2);
			
			level1Button = new Button(Assets.getTexture("botonLevel1"));
			level1Button.x = 200;
			level1Button.y = 320 - (backButton.height / 2);
			
			//level2Button = new Button(Assets.getTexture("botonLevel2"));
			//level2Button.x = 570;
			//level2Button.y = 320 - (backButton.height / 2);
			
			this.addChild(menuNiveles);
			this.addChild(backButton);
			this.addChild(level1Button);
			//this.addChild(level2Button);
			
			this.addEventListener(Event.TRIGGERED, onMenuNivelesClick);
		}
		
		private function onMenuNivelesClick(e:Event):void
		{
			var buttonClicked:Button = e.target as Button;
			if ((buttonClicked as Button) == level1Button)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"level1"}, true));
			}
			else if ((buttonClicked as Button) == level2Button)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"level2"}, true));
			}
			else if ((buttonClicked as Button) == backButton)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"back"}, true));
			}
		}
		
		private function OnChangeScreen(e:NavigationEvent):void
		{
			switch(e.params.id)
			{
				case "level1":
					eliminateMenu();
					nivel1.initialize();
					break;
					
				case "level2":
					eliminateMenu();
					//nivel2.initialize();
					break;
			}
		}
		
		private function eliminateMenu():void
		{
			this.removeChild(menuNiveles);
			this.removeChild(backButton);
			this.removeChild(level1Button);
			this.removeChild(level2Button);
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