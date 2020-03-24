package  
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	/**
	 * ...
	 * @author alehssandro
	 */
	public class PlayState extends FlxState
	{
		private var cenario:Cenario;
		private var player:Player;
		private var bala:Bullete;
		
		
		public function PlayState() 
		{
			
		}
		
		
		override public function create ():void
		{
			super.create();
			
			cenario = new Cenario (0, 0);
			add(cenario);
			
			player = new Player(0, 0);
			add(player);
			
			
			//bala	
			bala = new Bullete("bala", player, "x", "y");
			bala.makePixelBullet(100, 5, 2, 0xffc0c0c0, 0, 0);
			add(bala.group);	
				
			
			
			
			
			

			//parte tecnica
			FlxG.bgColor = 0xff123456;
			FlxG.mouse.show();
			
			FlxG.worldBounds = new FlxRect(0, 0, cenario.width, cenario.height);
			FlxG.camera.setBounds(0, 0, 3100, 240);			
			FlxG.camera.follow(player, FlxCamera.STYLE_LOCKON);	
			
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.acceleration, "y", "ay");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			FlxG.watch(player, "x", "x");
			FlxG.watch(player, "y", "y");
		}
		
		override public function update():void
		{
		
			if (FlxG.keys.justPressed("SPACE"))
			{
				if (player.facing == FlxObject.RIGHT)
					{  
						player.play("tiro");
					    bala.setBulletOffset(25, 15);
					    bala.setBulletDirection(FlxWeapon.BULLET_RIGHT, 200);
					    bala.bounds.width = player.x + 300;
					    bala.bounds.height = player.y + 240;
				}
					
				if (player.facing == FlxObject.LEFT)
					{
						player.play("tiro");
						bala.setBulletOffset(5, 15);
						bala.setBulletDirection(FlxWeapon.BULLET_LEFT, 200);
						bala.bounds.width = player.x + 300;
						bala.bounds.height = player.y + 240;
					}
	
				bala.fire();	
			}
			
			
			super.update();
		}
	}

}