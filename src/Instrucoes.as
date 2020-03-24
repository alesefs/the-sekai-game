package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa  
	public class Instrucoes extends FlxState 
	{
		//chama a imagem de fundo na classe assets3
		public static var imagemmenu3:Assets3;
		
		//variaveis de texto
		public static var instrucoes:FlxText;
		public static var instrucoesTX:FlxText;
		
		//botao
		public static var botaomenu:FlxButton;
		
		//som de fundo
		[Embed(source = "../assets/sons/menu.mp3")] private var som4menump3:Class;
		
		
		//função principal da classe
		public function Instrucoes() 
		{
			super();
		}
		
		//função create
		override public function create():void 
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//cria no stage a imagem de fundo ponto inicial (x=0, y=0)
			imagemmenu3 = new Assets3(0, 0);
			//adiciona no stage
			add(imagemmenu3);
			
			//cria o text instruçoes e poe ele no stage
			instrucoes = new FlxText(175, 40, 100, "INSTRUCOES", false);
			instrucoes.color = 0xEEE8AA;
			instrucoes.shadow = 0x888888;
			instrucoes.scale.x = 2;
			instrucoes.scale.y = 1.5;
			add(instrucoes);
			
			//cria o text instruçoesTX e poe ele no stage
			instrucoesTX = new FlxText(40, 125, 250, "	Voce sera Hikari e lutara contra os guerreiros sekai e contra seu irmao Irakih para recuperar"
			+"o Sekai Prism e salvar seu continente", false);
			instrucoesTX.color = 0xEEE8AA;
			instrucoesTX.shadow = 0x888888;
			add(instrucoesTX);			
			
			//cria botao e chama metodo para função retorno
			botaomenu = new FlxButton(120, 210, "VOLTAR", opcoes2);
			botaomenu.color = 0xEEE8AA;
			botaomenu.label.color = 0x0000FF;
			add(botaomenu);	
			
			//toca musica de fundo
			FlxG.play(som4menump3, .5, true);
			
			//atualiza o create
			super.create();
		}
		
		//metodo para função retorno
		private function opcoes2():void
			{
				//mostra mouse
			   FlxG.mouse.show();
			   //apaga a tela em 2 segundos e chama a função retorno
				FlxG.fade(0xff222222, 2, opcoesmenu);
			}	
		
		//função retorno	
		private function opcoesmenu():void
			{
				//envia para pagina de opçoes(classe opcoes)
				FlxG.switchState(new Opcoes);
			}				
			
		//função destruir	
		override public function destroy():void
			{
				
				FlxG.pauseSounds();//som de fundo
				imagemmenu3.destroy();//imagem de fundo
				instrucoes.destroy();//texto instruçoes
				instrucoesTX.destroy();//texto instruçoesTX
				botaomenu.destroy();//botao
				
				//atualiza apos passar de pagina e destroi tudo
				super.destroy();
			}	
	}

}