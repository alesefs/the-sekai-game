package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa  
	public class Jogador extends FlxSprite
	{
		//declaração da imagem de hikari(heroi)
		[Embed(source = "../assets/Imagens/Hikari.png")] public var jogador:Class;
		
		//declaração do som de passos
		[Embed(source = "../assets/sons/passo.mp3")] public var passos:Class;
		
		//declaração do som do ataque do heroi
		[Embed(source = "../assets/sons/ataqueheroi.mp3")]public var atkheroi:Class;
		
		//contador zerado
		public var counter:Number = 0;
		
		//bollean pra saber se o heroi(jogaodr) ta morto ou não
		public var isDying:Boolean = false;
		
		
		//função principal da classe jogador
		public function Jogador(X:Number, Y:Number) 
		{
			//atualiza posição
			super(X, Y);		
			
			//faz os sprites da imagem do jogador
			loadGraphic(jogador, true, true, 31, 60, true);
			
			//animação dos sprites do jogador
			addAnimation("parar", [0], 0, false);
			addAnimation("andar", [2, 3, 4, 5], 5, true);
			addAnimation("soco", [7, 6], 3, true);
			
			//adiciona keyevent (eventos no teclado
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//tipo de movimento de teclado
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT, 1, true, false)
			
			//habilitando as setas do teclado
			FlxControl.player1.setCursorControl(true, true, true, true);
			
			//velocidades para o player
			FlxControl.player1.setMovementSpeed(80, 80, 100, 100, 50, 50);
			
			//controles de limites de tela para o player
			FlxControl.player1.setBounds(0, 70, 2950, 85);
			
			//lado inicial do heroi
			facing = FlxObject.RIGHT; 
			
		}
		
		//função kill (quando morrer) 
		override public function kill():void //função morrer	
		{
			
			isDying = true;//se morto
			
			
			
			frame = 0;//fps = 0
			
			//velocidades = 0
			velocity.x = 0;
			velocity.y = 0;
			
			//desabilita setas
			FlxControl.player1.setCursorControl(false, false, false, false);
			
			//angulo (deitado)
			angle = 90;
			
			//animação (parado)
			play("idle");
			
		}
		
		//funnção update
		override public function update():void
		{
			
			//cria função ´para setas do teclado
			if (FlxG.keys.pressed("UP")||("DOWN")||("RIGHT")||("LEFT"))
				
				//se velocidade x diferente de 0 e velocidade y diferente de 0
				if (velocity.x != 0 || velocity.y != 0)
					{
						//ande
						play("andar");
						
						//contador + tempo gasto
						counter += FlxG.elapsed;
							if (counter >= 0.45)
							{
								//quando contador zerar toca som de passo 
								counter = 0;
								FlxG.play(passos, 1, false);
								//FlxG.playMusic(passos, 1);
							}
					}
					else //senão
					{
						//animação parado
						play("parar")
					}
			
			//habilitando tecla Z para ser o ataque do heroi	
			if (FlxG.keys.pressed("Z"))
				{
					
					//animação do soco
					play("soco")
					velocity.x = velocity.y = 0;
				}
			
			//se apertar Z tambem toca o som do golpe do heroi
			if (FlxG.keys.justPressed("Z"))
				{
					FlxG.play(atkheroi, 1, false);
				}
				
				//ataliza update
				super.update();
		}
	}

}