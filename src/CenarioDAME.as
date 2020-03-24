package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a Group porque vai haver varias informaçoes nelas e essas 
	//informações vao ser repassadas para outras classes
	public class CenarioDAME extends FlxGroup
	{
		//block que impede o jogador ir para o boss sem matar ninguem
		public static var floor:FlxTileblock;

		//declaração dos mobs 1 e 2
		public var inimigos:GrupoMob1;
		public var inimigos2:GrupoMob2;
		
		//função da classe CenarioDAME + boolean de criação de mobs 
		public function CenarioDAME(skipInimigos:Boolean = false) 
		{
			//atualiza a função
			super();
			
			//criação e atributos do block
			//nome da classe = new FlxTileblock(x, y, largura, altura);
			floor = new FlxTileblock(2500, 100, 1 , 150);
			//recria o grafico com (largura, altura e cor)
			floor.makeGraphic(1, 130, 0xFFF8B5742);
			//alpha no block
			floor.alpha = 0;
			//adiciona na classe CenarioDAME
			add(floor)
			
			//boolean para criação dos inimigos
			if (skipInimigos == false)
				{
					//metodos de recebimento de imagens mob 1 e 2 
					addInimigos();
					addInimigos2();
				}
				
		}
		
		//adicionando os mobs1 na classe CenarioDAME
		private function addInimigos():void
		{
			//declarando o mob1
			inimigos = new GrupoMob1();
			
			//onde vao aparecer no stage
			inimigos.addInimigo(500, 100);
			inimigos.addInimigo(650, 100);
			inimigos.addInimigo(800, 100);
			inimigos.addInimigo(950, 100);
			inimigos.addInimigo(1100, 100);
			inimigos.addInimigo(1250, 100);
			inimigos.addInimigo(1400, 100);
			
		}

		//adicionando os mobs2 na classe CenarioDAME
		private function addInimigos2():void
		{
			//declarando o mob2
			inimigos2 = new GrupoMob2();
			
			//onde vao aparecer no stage
			inimigos2.addInimigo2(1700, 100);
			inimigos2.addInimigo2(1750, 100);
			inimigos2.addInimigo2(1900, 100);
			inimigos2.addInimigo2(2050, 100);
			inimigos2.addInimigo2(2200, 100);
			inimigos2.addInimigo2(2350, 100);
			
		}
		
	}

}