package 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;
	
	
	public class Assets

	{
		private static var gameTexture:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/backgrounds/MenuInicio.jpg")]
		public static const menuInicio:Class;
		
		[Embed(source = "../media/images/backgrounds/MenuNiveles.jpg")]
		public static const menuNiveles:Class;
		
		[Embed(source = "../media/images/backgrounds/MenuControles.jpg")]
		public static const menuControles:Class;
		
		[Embed(source = "../media/images/backgrounds/gargantua.png")]
		public static const nivel1BG:Class;
		
		[Embed(source = "../media/images/backgrounds/Nivel2.jpg")]
		public static const nivel2BG:Class;
		
		[Embed(source = "../media/images/buttons/playGrande.png")]
		public static const playGrande:Class;
		
		[Embed(source = "../media/images/buttons/playPequenyo.png")]
		public static const playPequenyo:Class;
		
		[Embed(source = "../media/images/buttons/back.png")]
		public static const botonBack:Class;
		
		[Embed(source = "../media/images/buttons/controls.png")]
		public static const botonControls:Class;
		
		[Embed(source = "../media/images/buttons/botonLevel1.png")]
		public static const botonLevel1:Class;
		
		[Embed(source = "../media/images/buttons/botonLevel2.png")]
		public static const botonLevel2:Class;
		
		[Embed(source = "../media/images/bolaAuxiliarImage.png")]
		public static const bolaAuxiliarImage:Class;
		

		
		
		public static function getTexture(name:String):Texture 
		{
			if (gameTexture[name] == undefined) 
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
		return gameTexture[name];
		}	
	}
}