package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa  
	public class Historia extends FlxState 
	{
		//chama a imagem de fundo na classe assets2
		public static var imagemmenu2:Assets2;
		
		//cração de textos
		public static var narracao:FlxText;
		public static var avancar:FlxText;
		
		//contadores de eventos
		public var counter:Number = 0;
		
		//o metodo subir --> cria velocidade 
		public var subir:Number = 0;
		
		//som de fundo
		[Embed(source = "../assets/sons/narracao.mp3")] private var somnarracao:Class
		
		//tarja para indentificar melhor o avance
		public var tarja:FlxTileblock;
		
		
		//função da classe historia
		public function Historia() 
		{
			super();
		}
		
		
		//função create
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//cria no stage a imagem de fundo ponto inicial (x=0, y=0)
			imagemmenu2 = new Assets2(0, 0);
			//alpha
			imagemmenu2.alpha = 0.25;
			//adiciona no stage
			add(imagemmenu2);			
			
			
			// cria e executa no stage o texto da narração
			narracao = new FlxText(35, 210, 275, "	Ha 15000 anos atras, existia um continente chamado Sekai."+
			" Esse lugar era o mais desenvolvido do planeta." + " La exista o Sekai Prism. Esse prism emitia as cores do arco-iris para toda terra "
			+"e tambem dava energia para que a vida existisse em Sekai." + " Porem, no decimo sexto aniversario dos herdeiros de Sekai, " +
			" Laeto presenteia hikari com kakera que e um fragmento do Sekai Prism." + " Porem, Irakih nao recebe presente por conta de seu comportamento desordeiro."
			+" Por conta disso, Irakih fica com inveja de Hikari e rouba o Prism Sekai." + " Apos esse acontecimento, Irakih conjura uma magia proibida,"
			+" que transforma os habitantes de Sekai em zumbis guerreiros." + " Ao ver essa situacao, Laeto ordena a Hikari que detenha seu irmao"
			+" e recupere o Sekai Prism antes que o mal maior aconteca", false);
			narracao.color = 0xEEE8AA;
			add(narracao)
			
			//cria a tarja no fim da tela
			tarja = new FlxTileblock(0, 200, 270, 250);
			tarja.makeGraphic(350, 230, 0xff000000);
			add(tarja);
			
			//metodo para avançar histoia
			//metodo key event (teclado)
			avancar = new FlxText(65, 210, 200, "Aperte ENTER para AVANCAR", false);
			avancar.color = 0xEEE8AA;
			avancar.shadow = 0x888888;
			add(avancar);
			
			//adicionando velocidade em descer
			subir = 0.175;
			
			//toca a narração do jogo
			FlxG.play(somnarracao, 1, false)
	
			//atualiza o create
			super.create();
		}

		//função update
		override public function update():void
		{	
			//se o texto da narração for maior que 0
				if (narracao.x > 0)
				{
					//texto da narração sobe
					narracao.y -= subir;
				}
			//contador mas tempo gasto
			counter += FlxG.elapsed;
			
			// quando contador der 50segundos
			if (counter >= 50)
				{
					//chama a função retorno
					FlxG.fade(0xff222222, 2, menuState);
				}
			
				//se apertar ENTER tambem chama a função retorno
				if (FlxG.keys.justPressed("ENTER"))
					{
						FlxG.fade(0xff222222, 2, menuState);
					}
					
			//atualiza update		
			super.update();
		}	
		
		//função retorno
		private function menuState():void
			{
				//envia fluxos para o PlayState(jogo rodando)
				FlxG.switchState(new PlayState());
			}	
		
		//função destruir	
		override public function destroy():void
			{
			
				FlxG.pauseSounds();//som da narração
				imagemmenu2.destroy();//imagem de fundo
				narracao.destroy();//texto da narração
				avancar.destroy();//texto do avançar
				
				//atualiza quando for enviado para o playstate
				super.destroy();
			}	
	}

}