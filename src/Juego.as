package 
{

	import starling.events.Event;
	import starling.display.Sprite;
	
	public class Juego extends Sprite
	{
		private var menuNiveles:MenuNiveles;
		private var menuInicio:MenuInicio;
		private var menuControles:MenuControles;
		
		public function Juego()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, OnChangeScreen);
			
			menuNiveles=new MenuNiveles();
			menuNiveles.disposeTemporarily();
			this.addChild(menuNiveles);
			
			menuControles=new MenuControles();
			menuControles.disposeTemporarily();
			this.addChild(menuControles);
			
			menuInicio = new MenuInicio();
			this.addChild(menuInicio);
			menuInicio.initialize();
		}
		
		private function OnChangeScreen(e:NavigationEvent):void
		{
			switch(e.params.id)
			{
				case "levels":
					menuInicio.disposeTemporarily();
					menuNiveles.initialize();
					break;
					
				case "back":
					menuInicio.initialize();
					menuNiveles.disposeTemporarily();
					menuControles.disposeTemporarily();
					break;
				case "controls":
					menuInicio.disposeTemporarily();
					menuControles.initialize();
			}
		}
	}	
}