package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	import org.flixel.plugin.photonstorm.FlxWeapon;

	/**
	 * ...
	 * @author alehssandro
	 */
	public class Player extends FlxSprite
	{
		[Embed(source="../lib/hikari.png")] private var player:Class;
		
		public var velocidade:int;
		
		public var counter:Number = 0;
		
		
		public function Player(x:int, y:int) 
		{
			super(120, 120, player);
			
			loadGraphic(player, true, true, 32, 64, true);
			
			addAnimation("andar", [2, 3, 4, 5], 5, true);
			addAnimation("parar", [0], 0, false);
			addAnimation("soco", [7, 6], 3, true);
			addAnimation("chute", [9, 8], 3, true);
			addAnimation("tiro", [23, 22], 3, true);
			addAnimation("faca", [17, 16], 3, true);
			addAnimation("morto", [29], 0, false);
			
			
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT, 1, true, false)
			
			FlxControl.player1.setCursorControl(true, true, true, true);
			
			FlxControl.player1.setMovementSpeed(80, 80, 100, 100, 50, 50);
			
			FlxControl.player1.setBounds(100, 65, 2850, 80);
			
			facing = FlxObject.RIGHT; 
			

		}
		
		
		
		
		override public function update ():void
		{

			if (FlxG.keys.pressed("UP")||("DOWN")||("RIGHT")||("LEFT"))

				if (velocity.x != 0 || velocity.y != 0)
					{
						play("andar");
					}
					else
					{
						play("parar")
					}			
				
			if (FlxG.keys.pressed("Z"))
				{
					counter += FlxG.elapsed;
							if (counter <= 1)
							{
								counter = 0;
								velocity.x = velocity.y = 0;
								play("soco")
							}	
				}
				
			if (FlxG.keys.pressed("X"))
				{
					counter += FlxG.elapsed;
							if (counter <= 1)
							{
								counter = 0;
								velocity.x = velocity.y = 0;
								play("chute")
							}	
				}	
			
			if (FlxG.keys.pressed("C"))
				{
					counter += FlxG.elapsed;
							if (counter <= 1)
							{
								counter = 0;
								velocity.x = velocity.y = 0;
								play("faca")
							}	
				}
				
			if (FlxG.keys.pressed("SPACE"))
				{
					counter += FlxG.elapsed;
							if (counter <= 1)
							{
								counter = 0;
								velocity.x = velocity.y = 0;
								play("tiro")
							}	
				} 
				
				super.update();			
			
		}
		
	}

}