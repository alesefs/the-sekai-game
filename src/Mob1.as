package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class Mob1 extends FlxSprite
	{
		//chama a imagem do mob1
		[Embed(source = "../assets/Imagens/mob1.png")] public static var mob1:Class;
		
		//boolean para saber se ele ta vivo/morto
		public var isDying:Boolean = false;
		
		//velocidades x e y
		private var xspeed:Number;
		private var yspeed:Number;
		
		//função principal da classe
		public function Mob1(X:int, Y:int) 
		{
			
			//atualiza posição
			super(X, Y, mob1);
			
			//cria sprites da imagem dos mobs1
			loadGraphic(mob1, true, true, 31, 60);
			
			//lado inicial dos mobs 1
			facing = FlxObject.LEFT;
			
			//animações do mob1
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [2, 3, 6, 7, 4, 5, 6, 7], 10, true);
			
			//animação inicial
			play("walk");

			//HP do mob
			health = 4;
			
			//aplicando velocidade ao mob
			xspeed = Math.random() * 0.5;
			yspeed = Math.random() * 0.5;
			
		}

		//função update
		override public function update():void
		{	
			//AI para movimentos dos mobs
			if ( x + xspeed > 1600 ) xspeed *= -1 ;
			if ( x + xspeed < 400 ) xspeed *= -1 ;
			if ( y + yspeed > 150 ) yspeed *= -1;
			if ( y + yspeed < 75 ) yspeed *= -1;
			x += xspeed;
			y += yspeed;
			
			//atualização do update
			super.update();
		}
		
		//função kill 
		override public function kill():void //função morrer	
		{
			
			isDying = true;//se morto
			
			//velocidades nulas
			velocity.x = 0;
			velocity.y = 0;
			
			//angulo 90 pra deitar
			angle = 90;
			
			//deixa de existir (some)
			exists = false;
			
			//ficam imoveis
			immovable = true
	
		}
		
	}

}