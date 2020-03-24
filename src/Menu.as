package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
		
	 //ela vai extender a sprite por ser imagem fixa  
	public class Menu extends FlxState
	{
		//chama a imagem de fundo na classe assets1
		public static var imagemmenu:Assets1;
		
		//cria botoes de eventos
		public static var botaojogar:FlxButton;
		public static var botaoopcoes:FlxButton;
		
		//chama o som de fundo do menu
		[Embed(source = "../assets/sons/menu.mp3")] private var menump3:Class;
		
		//função principal do menu
		public function Menu() 
		{
				super();
		}
		
		//função create
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//cria no stage a imagem de fundo ponto inicial (x=0, y=0)
			imagemmenu = new Assets1(0, 0);
			//adiciona no stage
			add(imagemmenu);
			
			//mostra o mouse na tela
			FlxG.mouse.show();
			
			
			//cria o botao jogar e chama metodo para função retorno
			botaojogar = new FlxButton(190, 140, "JOGAR", comecar);
			botaojogar.color = 0xEEE8AA;
			botaojogar.label.color = 0x0000FF;
			add(botaojogar);
			
			//cria o botao opçoes e chama metodo para função retorno
			botaoopcoes = new FlxButton(190, 170, "OPCOES", opcoes);
			botaoopcoes.color = 0xEEE8AA;
			botaoopcoes.label.color = 0x0000FF;
			add(botaoopcoes);
			
			//toca o fundo musical
			FlxG.play(menump3, .5, true);
			
			//atualiza o create
			super.create();
		}
		
		
		//metodo para função retorno
		private function comecar():void
		  {  
			//mostra o mouse na tela 
		    FlxG.mouse.hide();
			//apaga a tela em 2 segundos e chama a função retorno
		    FlxG.fade(0xff222222, 2, historia);
		  }
		 
		  
		//metodo para função retorno 
		private function opcoes():void
			{
				//mostra o mouse na tela 
			    FlxG.mouse.hide();
				//apaga a tela em 2 segundos e chama a função retorno
			    FlxG.fade(0xff222222, 2, opcoesmenu);
			} 
			
			
		//função retorno botao jogar
		private function historia():void
			{
				//envia fluxos para Historia(narração)
				FlxG.switchState(new Historia());
			}
		
			
		//função retorno botao opcoes	
		private function opcoesmenu():void
			{
				//envia fluxos para opçoes
				FlxG.switchState(new Opcoes());
			}
		
		//função destroi tudo	
		override public function destroy():void
			{
				
				FlxG.pauseSounds();//sons de fundo
				imagemmenu.destroy();//imagem de fundo
				botaojogar.destroy();//botao jogar
				botaoopcoes.destroy();//boato opcoes
				
				//atualiza apos mudança de classe
				super.destroy();
			}		
	}

}