package  
{
	import org.flixel.FlxRect;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	/**
	 * ...
	 * @author alehssandro
	 */
	public class Bullete extends FlxWeapon 
	{
			
		override public function Bullete (name:String, parentRef:* = null, xVariable:String = "x", yVariable:String = "y"):void
		{
			super(name, parentRef, xVariable, yVariable);
			
			setBulletBounds (new FlxRect(0, 0, 0, 0));

		}
	}
}