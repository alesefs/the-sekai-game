package  
{
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class Mob2 extends FlxSprite
	{
		//chama a imagem do mob2
		[Embed(source = "../assets/Imagens/mob2.png")] public static var mob2:Class;
		
		//velocidades x e y
		private var xspeed:Number;
		private var yspeed:Number;
		
		//boolean para saber se ele ta vivo/morto
		public var isDying:Boolean = false;
		
		//função principal da classe
		public function Mob2(X:int, Y:int) 
		{
			//atualiza posição do mob 2
			super(X, Y);
			
			//cria sprites da imagem dos mobs2
			loadGraphic(mob2, true, true, 43, 60);
			
			//lado inicial dos mobs 2
			facing = FlxObject.LEFT;
			
			//animações do mob2
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [0, 1, 2, 3, 4], 5, true);
			
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
			if ( x + xspeed > 2450 ) xspeed *= -1;
			if ( x + xspeed < 1650 ) xspeed *= -1;
			if ( y + yspeed > 160 ) yspeed *= -1;
			if ( y + yspeed < 65 ) yspeed *= -1;
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