package
{
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author alehssandro
	 */

	 //detalhes do SWF
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	//chama e faz retorno com preloader
	[Frame(factoryClass="Preloader")] 
	
	
	//classe inicial do programa por isso extends a FlxGame (classe Pai/Mae) 
	public class Main extends FlxGame
	{
		//função principal do main
		public function Main()
		{
			//atualiza enviando para o menu
			super(320, 240, Menu, 2, 60, 60);
			//força a verificação de erros
			forceDebugger = false; 
		}
	}
}
	
