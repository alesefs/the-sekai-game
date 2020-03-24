package  
{
	import org.flixel.system.FlxPreloader;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//classe preloader carregar todo o jogo, classes , sons, imagens , etc
	public class Preloader extends FlxPreloader
	{
		//função principal
		public function Preloader()
		{
			//envia fluxos de retorno para Main
			className = "Main";
			//atualiza o preloader
			super();
		}
	}
}