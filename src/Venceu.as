package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a state por ser imagem fixa
	public class Venceu extends FlxState
	{
		//declara a imagem de fundo que ta na classe Assets2
		public static var imagemmenu2:Assets2;
		
		//declara o texto venceu
		public static var venceu:FlxText;
		
		//declara as particulas
		private var theEmitter:FlxEmitter;
		private var GOLDPixel:FlxParticle;
		
		//declara contador
		public var counter:Number = 0;
		
		//som de fundo 
		[Embed(source = "../assets/sons/fimdejogo.mp3")] private var vcvenceu:Class;
		
		//função principal
		public function Venceu() 
		{
			super();
		}
		
		//função create
		override public function create():void
			{
				
				FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
				
				//carrega a imagem de fundo
				imagemmenu2 = new Assets2(0, 0);
				add(imagemmenu2);
				
				
				//carrega o texto de voce venceu
				venceu = new FlxText(100, 140, 180, "VOCE RECUPEROU O PRISM SEKAI E NOS SALVOU", false);
				venceu.color = 0xEEE8AA;
				venceu.shadow = 0x333333;
				venceu.scale.x = 1.5;
				venceu.scale.y = 1;
				add(venceu);
				
				
				//funções para perticulas
				FlxG.framerate = 60; //fps
				FlxG.flashFramerate = 60; // fps
				
				//evento emissão de particulas
				//cria particula
				theEmitter = new FlxEmitter(FlxG.width / 2, FlxG.height/2, 400);
				add(theEmitter);
				
				//emite particula
				for (var i:int = 0; i < theEmitter.maxSize / 2; i++) 
					{
						GOLDPixel = new FlxParticle();
						GOLDPixel.makeGraphic(2, 2, 0xFFEEE8AA);
						theEmitter.add(GOLDPixel);
						GOLDPixel = new FlxParticle();
						GOLDPixel.makeGraphic(1, 1, 0xFFEEE8AA);
						theEmitter.add(GOLDPixel);
					}
					
			//inicializa evento
			theEmitter.start(false, 3, .01);
			
			
			//toca fundo musical
			FlxG.play(vcvenceu, .4, true)
				
				//atualiza create
				super.create();
			}	
		
		//função update	
		override public function update():void
			{
				//contador + tempo gasto
				counter += FlxG.elapsed;
					//se maior que 5segundos
					if (counter >= 5)
					{
						//escurece e chama metodo
						FlxG.fade(0xff222222, 2, menuState);
					}
				
				//atualiza update	
				super.update();
			}
		
		//metodo chamado	
		private function menuState():void
			{
				//envia para menu(menu do jogo - classe menu)
				FlxG.switchState(new Menu());
			}	
		
			
		//função destroy	
		override public function destroy():void
			{
				FlxG.pauseSounds();//sons
				imagemmenu2.destroy();//imagem de fundo
				venceu.destroy();//texto venceu
				theEmitter.destroy();//emissor de particulas
				GOLDPixel.destroy();//a particula
				
				//atualiza o destroy
				super.destroy();
			}
	}

}