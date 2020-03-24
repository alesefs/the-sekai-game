package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class GameOver extends FlxState 
	{
		//chama a imagem de fundo na classe assets2
		public static var imagemmenu2:Assets4;
		
		//chama a imagem negra na classe Assets4
		public static var imggameover:Assets6;
		
		//cria variavel de texto
		public static var gameover:FlxText;
		
		//cria contadores de eventos zerados
		public var counter:Number = 0;
		public var counter2:Number = 0;
		
		//o metodo descer --> cria velocidade 
		public var descer:Number = 0;
		
		//cria som do boss rindo (fundo do game over)
		[Embed(source = "../assets/sons/bosswins.mp3")] private var winboss:Class;
			
		//função principal do game over
		public function GameOver() 
		{
			super();
		}
		
		//função create
		override public function create():void
			{
				FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
				
				//adiciona a imagem de fundo no stage do game over
				//ponto inicial x=0 e y=0
				imagemmenu2 = new Assets4(0, 0);
				add(imagemmenu2);
				
				//adiciona a imagem negra no stage do game over
				//ponto inicial x=0 e y=0
				imggameover = new Assets6(0, 0)
				add(imggameover);
				
				
				//propriedades do texto na classe game over
				gameover = new FlxText(80, 140, 175, "VOCE FRACASSOU E A ESCURIDAO IMPERARA", false);
				gameover.color = 0xFF0000;
				gameover.shadow = 0x8B0000;
				gameover.scale.x = 1.5;
				gameover.scale.y = 1.5;
				add(gameover);
				
				//adicionando velocidade em descer
				descer = 0.5;
				
				//toca o fundo de risada do boss
				FlxG.play(winboss, 1, false);

				super.create();
			}	
		
		//função update	
		override public function update():void
			{
				//variavel se "if"
				//se a imagem negra tiver Y maior que 0 
				if (imggameover.y < 0)
				{
					//a imagem ganha velocidade em Y e desce 
					imggameover.y += descer;
				}
			
				//contador +FlxG.elapsed (tempo gasto)
				//serve para automatizar um evento
				counter += FlxG.elapsed;
					
						//se o contador for maior ou igual a 5 segundos
						if (counter >= 5)
					{
						//faz a função retorno
						FlxG.fade(0xff222222, 2, menuState);
					}
				
				//atualiza o update	
				super.update();
			}
		
		//função retorno	
		private function menuState():void
			{
				//envia fluxo para omenu do jogo(classe Menu)
				FlxG.switchState(new Menu());
			}	
		
		//função destruir -- destroi tudo apos passagem das paginas	
		override public function destroy():void
			{
				imagemmenu2.destroy();//imagem de fundo
				imggameover.destroy();//imagem negra
				gameover.destroy();//texto game over
				
				//atualiza apos passagem de telas
				super.destroy();
			}		
			
	}

}