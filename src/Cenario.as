package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class Cenario  extends FlxSprite
	{
		//imagem do cenario do jogo
		[Embed(source = "../assets/Imagens/cenario.png")] public static var cenario:Class;
		
		//som de fundo do jogo
		[Embed(source = "../assets/sons/fundo jogo.mp3")] private var fundojogo:Class;
		
		
		//função da classe cenario com parametros x e y
		public function Cenario(x:Number, y:Number) 
		{
			//super para atualizar a imagem
			super(-225, -160, cenario);
			
			//toca a musica de fundo do jogo
			//FlxG.play(classe da musica, volume, loop)
			FlxG.play(fundojogo, .5, true);
			
		}
		
	}

}