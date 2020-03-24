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
	public class Creditos extends FlxState
	{
		//chama a imagem do assets3 para o stage da classe controles	
		public static var imagemmenu3:Assets3;
		
		//cria variavel de textos		
		public static var creditos:FlxText;		
		public static var creditosTX:FlxText;		
		public static var creditosTX2:FlxText;		
		
		//cria botao para eventos no stage da classe 
		public static var botaomenu:FlxButton;
		
		//som de fundo do stage creditos
		[Embed(source = "../assets/sons/menu.mp3")] private var som5menump3:Class;
		
		
		//função da classe creditos
		public function Creditos() 
		{
			super();
		}
		
		//função create (cria os itens declarados no stage)
		override public function create():void 
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//imagem do menu com (x e y) de onde vai ser o ponto inicial
			imagemmenu3 = new Assets3(0, 0);
			//adiciona no stage da classe creditos
			add(imagemmenu3);
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			creditos = new FlxText(175, 40, 100, "CREDITOS", false);
			//cor das letras
			creditos.color = 0xEEE8AA;
			//cor da sombra
			creditos.shadow = 0x888888;
			//escala em x e y
			creditos.scale.x = 2;
			creditos.scale.y = 1.5;
			//adiciona no stage
			add(creditos);	
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			creditosTX = new FlxText(40, 100, 250, "Produtores do THE SEKAI:  Alehssandro Emanuel & Hugo Rocha", false);
			//cor das letras
			creditosTX.color = 0xEEE8AA;
			//cor da sombra
			creditosTX.shadow = 0x888888;
			//adiciona no stage
			add(creditosTX);
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			creditosTX2 = new FlxText(40, 140, 250, "agradecemos o auxilio dos professores de jogos digitais, todos incluindo professores desde o 1º periodo ate o 3º. 'Os Produtores'", false);
			//cor das letras
			creditosTX2.color = 0xEEE8AA;
			//cor da sombra
			creditosTX2.shadow = 0x888888;
			//adiciona no stage
			add(creditosTX2);
			
			
			//textos e seus atributos
			//nome do botao declarado = new FlxButton(x, y, "nome", função clicar)
			botaomenu = new FlxButton(120, 210, "VOLTAR", opcoes3);
			//cor do botao
			botaomenu.color = 0xEEE8AA;
			//cor da letra do botao
			botaomenu.label.color = 0x0000FF;
			//adiciona no stage
			add(botaomenu);	
			
			
			//tocador do som de fundo do stage controles 
			FlxG.play(som5menump3, .5, true);
			
			//atualiza o create
			super.create();
		}
		
		//essa é a função clicar desse botao acima 
		private function opcoes3():void
			{
				//aparece o mouse no stage
			   FlxG.mouse.show();
			   //apaga o stage e chama a função retorno 
			   FlxG.fade(0xff222222, 2, opcoesmenu);
			   
			}			
		
		//função de retorno
		private function opcoesmenu():void
			{
				//envia fluxo para a pagina opçoes (classe opçoes)
				FlxG.switchState(new Opcoes);
			}

		
		//função destruir quando clicar no botao
		//destroi tudo que foi criado na pagina para diminuir a menoria virtual
		override public function destroy():void
			{
			
				FlxG.pauseSounds();//som de fundo
				imagemmenu3.destroy();//imagem de fundo
				creditos.destroy();//texto creditos
				creditosTX.destroy();//texto creditosTX
				creditosTX2.destroy();//texto creditosTX2
				botaomenu.destroy();//botao
				
				//atualiza depois de destruido
				super.destroy();
			}		
		
	}

}