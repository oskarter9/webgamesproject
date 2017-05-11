package 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class BolasDisparadorImage 
	{	
		private static var gameTexture:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/bolaDisparador2.png")]
		public static const bolaDisparador:Class;
		
		public static function getTexture(name:String):Texture {
		if (gameTexture[name] == undefined) 
			{
				var bitmap:Bitmap = new BolasDisparadorImage[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
		return gameTexture[name];
		}		
	}
}