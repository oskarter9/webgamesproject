package 
{

	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class BolasImage 
	{
		private static var gameTexture:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/bolaNormal2.png")]
		public static const bola:Class;
		
		[Embed(source = "../media/images/bolaCongelada.png")]
		public static const bolaCongelada:Class;
		
		public static function getTexture(name:String):Texture {
		if (gameTexture[name] == undefined) 
			{
				var bitmap:Bitmap = new BolasImage[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
		return gameTexture[name];
		}
	}
}