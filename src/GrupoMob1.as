package  
{
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxHealthBar;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 
	//ela vai extender a Group porque vai haver varias informaçoes nelas e essas 
	//informações vao ser repassadas para outras classes
	public class GrupoMob1 extends FlxGroup
	{
		//função da classe GrupoMob1
		public function GrupoMob1() 
		{
			super();
		}
		
		//cria metodo para multiplicar inimigos no stage com parametros (x, y)
		public function addInimigo (x:int, y:int):void
		{
			//cria temporizador (multiplicador) para mobs da classe Mob1
			var tempInimigo:Mob1 = new Mob1(x, y);
			
			//adiciona metodo
			add(tempInimigo);
			
		}

	}

}