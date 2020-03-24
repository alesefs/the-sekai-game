package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author alehssandro
	 */
	public class Cenario extends FlxSprite
	{
		[Embed(source = "../lib/cenario.png")] private var cenario:Class;
		
		public function Cenario(x:Number, y:Number) 
		{
			super(-225, -165, cenario);
		}
		
	}

}