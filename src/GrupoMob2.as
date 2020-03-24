package  
{
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxBar;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a Group porque vai haver varias informaçoes nelas e essas 
	//informações vao ser repassadas para outras classes
	public class GrupoMob2 extends FlxGroup
	{
		//função da classe GrupoMob2
		public function GrupoMob2() 
		{
			super();
		}
		
	//cria metodo para multiplicar inimigos no stage com parametros (x, y)
	public function addInimigo2 (x:int, y:int):void
		{
			//cria temporizador (multiplicador) para mobs da classe Mob2
			var tempInimigo2:Mob2 = new Mob2(x, y);
			
			//adiciona metodo
			add(tempInimigo2);
			
		}

		
	}

}