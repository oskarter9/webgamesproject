package 
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class DisparadorImage
	{
		private static var gameTexture:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/Disparador2.png")]
		public static const disparador:Class;
		
		public static function getTexture(name:String):Texture {
		if (gameTexture[name] == undefined) 
			{
				var bitmap:Bitmap = new DisparadorImage[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
		return gameTexture[name];
		}
	}	
}