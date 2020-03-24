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
	public class Controles extends FlxState 
	{
		
	//chama a imagem do assets3 para o stage da classe controles	
	public static var imagemmenu3:Assets3;
	
	//cria variavel de textos
	public static var controles:FlxText;
	public static var mover:FlxText;	
	public static var ataques:FlxText;
	public static var pausa:FlxText;
	public static var som:FlxText;
	
	//cria botao para eventos no stage da classe 
	public static var botaomenu:FlxButton;
	
	//som de fundo do stage controles
	[Embed(source = "../assets/sons/menu.mp3")] private var som3menump3:Class;

	//função da classe controles
		public function Controles() 
		{
			super();
		}
		
		//função create (cria os itens declarados no stage)
		override public function create():void 
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//imagem do menu com (x e y) de onde vai ser o ponto inicial
			imagemmenu3 = new Assets3(0, 0);
			//adiciona no stage da classeControles
			add(imagemmenu3);
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			controles = new FlxText(175, 40, 100, "CONTROLES", false);
			//cor das letras
			controles.color = 0xEEE8AA;
			//cor da sombra
			controles.shadow = 0x888888;
			//escala em x e y
			controles.scale.x = 2;
			controles.scale.y = 1.5;
			//adiciona no stage
			add(controles);
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			mover = new FlxText(25, 100, 300, "ANDAR: aperte  ↑, ↓, →, ←", false);
			//cor das letras
			mover.color = 0xEEE8AA;
			//cor da sombra
			mover.shadow = 0x888888;
			//adiciona no stage
			add(mover);
			
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			ataques = new FlxText(25, 125, 300, "ATACAR: aperte  Z", false);
			//cor das letras
			ataques.color = 0xEEE8AA;
			//cor da sombra
			ataques.shadow = 0x888888;
			//adiciona no stage
			add(ataques);
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			pausa = new FlxText(25, 150, 150, "PAUSAR: aperte P", false);
			//cor das letras
			pausa.color = 0xEEE8AA;
			//cor da sombra
			pausa.shadow = 0x888888;
			//adiciona no stage
			add(pausa)
			
			
			//textos e seus atributos
			//nome da classe = new FlxText (x, y, largura, "nome que vai aparecer no stage", fonte especial)
			som = new FlxText(25, 175, 300, "AJUSTES DE SOM: aperte 0, +, --", false);
			//cor das letras
			som.color = 0xEEE8AA;
			//cor da sombra
			som.shadow = 0x888888;
			//adiciona no stage
			add(som);
			
			
			
			//textos e seus atributos
			//nome do botao declarado = new FlxButton(x, y, "nome", função clicar)
			botaomenu = new FlxButton(120, 210, "VOLTAR", opcoes1);
			//cor do botao
			botaomenu.color = 0xEEE8AA;
			//cor da letra do botao
			botaomenu.label.color = 0x0000FF;
			//adiciona no stage
			add(botaomenu);	
			
			//tocador do som de fundo do stage controles 
			FlxG.play(som3menump3, .5, true);
			
			//atualiza o create
			super.create();
		}
		
		//essa é a função clicar desse botao acima 
		private function opcoes1():void
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
				controles.destroy();//texto controles
				mover.destroy();//texto mover
				ataques.destroy();//texto ataques
				pausa.destroy();//texto pausa
				som.destroy();//texto som
				botaomenu.destroy();//botao
				
				//atualiza depois de destruido
				super.destroy();
			}	
	}

}