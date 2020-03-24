package  
{
	import org.flixel.*;
	import flash.display.*;
	import org.flixel.plugin.photonstorm.FlxHealthBar;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 //a classe mais importante do jogo (O JOGO)
	 //state por que contem iconens vindos de outras classes e com referencias static(estatica)
	public class PlayState extends FlxState
	{
		
		//chama classe cenario
		public static var cenario:Cenario;
		
		//chama classe cenarioDAME
		public static var cenarioDAME:CenarioDAME;
		
		//chama classe jogador
		public static var jogador:Jogador;
		
		//cria barra de HP do Heroi
		private var barraheroHP:FlxHealthBar;
		
		//cria texto com nome de hikari
		private var hikari:FlxText;
		
		//cria texto com a ponntuação
		private var score:FlxText;
		
		//chama classe inimigo(boss)
		public static var inimigo:Boss;
		
		//cria barra de hp pro boss
		private var barraenemyHP:FlxHealthBar;
		
		//cria texto com o nome irakih
		private var irakih:FlxText;	
		
		//cria velocidade 
		private var velocidade:Number;
		
		//bloco para inicio de cenario
		private var ruina:FlxTileblock;
		
		//cria contadores
		public var counter:Number = 0;
		public var counter2:Number = 0;
		public var counter3:Number = 0;
		public var counter4:Number = 0;
		public var counter5:Number = 0;
		
		//cria evento de pausa
		public var paused:Boolean;
		public var pauseGroup:FlxGroup;
		
		//chama classe Assets5		
		public var cristal:Assets5;
		
		//carrega o som de ataque do boss
		[Embed(source = "../assets/sons/ataqueboss.mp3")] private var atkboss:Class;
		
		//carrega o som de impacto do boss
		[Embed(source="../assets/sons/hitimpactboss.mp3")] private var hitimpactboss:Class;
		
		//carrega o som de passos do boss
		[Embed(source = "../assets/sons/passoboss.mp3")] public static var andarboss:Class;

		//carrega o som de impacto pro heroi
		[Embed(source = "../assets/sons/hitimpactheroi.mp3")] public static var hitimpactheroi:Class;
		
		//carrega o som de morte do heroi
		[Embed(source = '../assets/sons/morte heroi.mp3')] public var mortheroi:Class;
		
		//carrega o som de amorte do boss
		[Embed(source = "../assets/sons/morte boss.mp3")] public var mortboss:Class;
		
		//carrega o som de dor do boss
		[Embed(source = "../assets/sons/dor boss.mp3")] public var dorboss:Class;
		
		//carrega o som de dor do heroi
		[Embed(source = "../assets/sons/dor heroi.mp3")] public var dorheroi:Class;
		
		//carrega dor de mob
		[Embed(source = "../assets/sons/dor mob.mp3")] public var dormob:Class;
		
		//impacto mob
		[Embed(source = "../assets/sons/hitimpactmob.mp3")] public var impactomob:Class; 
		
		//ataque mob
		[Embed(source = "../assets/sons/ataque mob.mp3")] public var ataquemob:Class;
		
		//ataque mob 2
		[Embed(source = "../assets/sons/ataque mob2.mp3")] public var ataquemob2:Class;
		
		//dor mob 2
		[Embed(source="../assets/sons/dormob2.mp3")] public var dormob2:Class;
		
		//som do boss
		[Embed(source = "../assets/sons/fundo boss.mp3")] public var somboss:Class;
		
		
		//carrega foto de hikari pra hud
		[Embed(source = "../assets/Imagens/hud.png")] public static var hud:Class;
		
		
		//função principal da classe
		public function PlayState() 
		{
			super()
		}
		
		//função create adiciona ao stage
		override public function create ():void
		{
			//super.create();
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			/*if (FlxG.stage.displayState == StageDisplayState.NORMAL)
			{
				FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
			}
			else 
			{ 
				FlxG.stage.displayState = StageDisplayState.NORMAL;
			}*/
			
			//cor de fundo
			FlxG.bgColor = 0xff1E90FF;
			
			//adiciona o cenario de fundo
			cenario = new Cenario(0, 0);
			add(cenario);
			
			//adiciona o block
			cenarioDAME = new CenarioDAME();
			add(cenarioDAME)
			
			//add]iciona mob1
			add(cenarioDAME.inimigos);
			
			//adiciona mob2
			add(cenarioDAME.inimigos2);
			
			//adiciona jogador
			jogador = new Jogador(100, 100);
			jogador.health = 100;
			add(jogador);
			
			//adiciona barra de HP do heroi
			barraheroHP = new FlxHealthBar(jogador, 100, 10, jogador.health - 100 , jogador.health, true);
			barraheroHP.scrollFactor.x = barraheroHP.scrollFactor.y = 0;
			barraheroHP.x = 25; 
			barraheroHP.y = 10;
			add (barraheroHP)	
			
			//adiciona foto do heroi
			var hudheroi:FlxSprite = new FlxSprite(5, 5, hud)
			hudheroi.scrollFactor.x = hudheroi.scrollFactor.y = 0; 
			add(hudheroi)
			
			//adiciona o nome doheroi
			hikari = new FlxText(30, 10, 100, "HIKARI", true);
			hikari.color = 0xff0000;
			hikari.scrollFactor.x = hikari.scrollFactor.y = 0;
			add(hikari);
			
			//adiciona a pontuação do heroi
			score = new FlxText(30, 25, 280, "MATE TODOS: " + (cenarioDAME.inimigos.countLiving() + cenarioDAME.inimigos2.countLiving()));//"SCORE: " + (cenarioDAME.inimigos.countLiving() * 100 + cenarioDAME.inimigos2.countLiving() * 100));
			score.scrollFactor.x = score.scrollFactor.y = 0;
			score.color = 0xffffffff;
			score.shadow = 0xff222222;
			add(score);
			
			//pre adiciona o prism sekai
			cristal = new Assets5(0, 0)
			cristal.exists = false
			add(cristal);
			
			//adiciona o boss
			inimigo = new Boss(2900, 100);
			inimigo.health = 200;
			add(inimigo);
			
			//pre adiciona a barra de hp do boss 
			barraenemyHP = new FlxHealthBar(inimigo, 250, 10, inimigo.health - 200 , inimigo.health, true);
			barraenemyHP.scrollFactor.x = barraenemyHP.scrollFactor.y = 0;
			barraenemyHP.x = 35; 
			barraenemyHP.y = 185;
			
			//pre adiciona o nome do boss
			irakih = new FlxText(140, 185, 100, "IRAKIH", true);
			irakih.color = 0xff0000;
			irakih.scrollFactor.x = irakih.scrollFactor.y = 0;
			
			//adiciona velocidade
			velocidade = 0.5;
			
			//limites de tela em jogo
			FlxG.worldBounds = new FlxRect(0, 0, cenario.width, cenario.height);
			
			//adiciona camera 
			FlxG.camera.follow(jogador, FlxCamera.STYLE_LOCKON);
			
			//adiciona evento de pausa
			paused = false;
			pauseGroup = new FlxGroup();
			
			//block de ruinas
			ruina = new FlxTileblock( -10, 190, 100, 5);
			ruina.makeGraphic(260, 5, 0xff000000);
			ruina.alpha = 0;
			add(ruina);
			
			//atualiza o create
			super.create();
		}
		
		//função update
		override public function update():void
		{
			//colisoes
			FlxG.collide(inimigo, cenario);
			FlxG.collide(jogador, ruina);
			FlxG.collide(inimigo, cenarioDAME);
			FlxG.overlap(jogador, cenarioDAME.inimigos, hitEnemy);
			FlxG.overlap(jogador, cenarioDAME.inimigos2, hitEnemy2);
			
			//AI do boss	
			//face do boss
			if (jogador.x > inimigo.x)
				{
					inimigo.scale.x = -1;
				}
			else
				{
					inimigo.scale.x = 1;
				}
			
			//AI do boss	
			//movimento / andar do boss
			if (inimigo.y != jogador.y && jogador.x <= inimigo.x - 200)
				{
					inimigo.play("walk");
						
					counter4 += FlxG.elapsed;
				if (counter4 >= 0.45)
					{
						counter4 = 0;
						//so usar som na aula de som
						//FlxG.stream("../assets/sons/passoboss.mp3", 1, false);
						FlxG.play(andarboss, 1, false);
					} 			
			
	
				}
				
			if (jogador.x >= inimigo.x - 199 && jogador.x <= inimigo.x - 20)
				{
					inimigo.play("walk");
					inimigo.x -= velocidade;
					
						counter4 += FlxG.elapsed;
				if (counter4 >= 0.45)
					{
						counter4 = 0;
						//so usar som na aula de som
						FlxG.stream("../assets/sons/passoboss.mp3", 1, false);
					}
				}
				
			if (jogador.x >= inimigo.x + 20)		
				{
					inimigo.play("walk");
					inimigo.x += velocidade;
					
					counter4 += FlxG.elapsed;
				if (counter4 >= 0.45)
					{
						counter4 = 0;
						//so usar som na aula de som
						FlxG.stream("../assets/sons/passoboss.mp3", 1, false);
					}
				}
				
				//AI do boss
				//movimento / atacar
			if (inimigo.y >= jogador.y - 2 && inimigo.y <= jogador.y + 2 && jogador.x >= inimigo.x - 20 && jogador.x <= inimigo.x + 20)
				{
					inimigo.play("ataque");	
					
						counter2 += FlxG.elapsed;
							if (counter2 >= 0.60)
							{
								counter2 = 0;
								FlxG.play(atkboss, 0.5, false);
							}	
						
						counter3 += FlxG.elapsed;
								if (counter3 >= 0.65)
							{
								counter3 = 0;
								FlxG.play(dorheroi, 0.4, false);
								FlxG.play(hitimpactboss, 0.4, false);
						
							}
					
					//evento morte do heroi		
					jogador.health -= 0.1;
						
					if (jogador.health <= 0)
						{
							jogador.kill();
							barraheroHP.kill();
							hikari.kill();
							
						counter += FlxG.elapsed;
							if (counter >= 0)
								{
									FlxG.play(mortheroi, .5, false);
								}
									inimigo.x = jogador.x + 5;
									inimigo.y = jogador.y + 5;
							inimigo.play("idle");
							
							counter += FlxG.elapsed;
							if (counter >= 0.15)
								{
									FlxG.pauseSounds();
									FlxG.fade(0xff222222, 1, gameover);
								}
						}
				}
					
			if (jogador.y > inimigo.y)
				{
					inimigo.y += velocidade;
				}
			else 
				{
					inimigo.y -= velocidade;
				}				
			
				
			//AI do boss
			//morte do boss
			if (FlxG.keys.justReleased("Z") && inimigo.y >= jogador.y - 2 && inimigo.y <= jogador.y + 2 && jogador.x >= inimigo.x - 20 && jogador.x <= inimigo.x + 20)
				{	
					add(barraenemyHP);
					add(irakih)
					inimigo.health -= 10;
				

						counter += FlxG.elapsed;
					if (counter <= 0.3)
					{
						counter = 0;
						FlxG.stream("../assets/sons/dor boss.mp3", 1, false)
						FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
					}
				}				
				
				
				if (inimigo.health <= 0)
					{
						inimigo.kill();
						velocidade = 0;
						inimigo.velocity.x = 0
						inimigo.velocity.y = 0
						jogador.x = inimigo.x - 5;
						jogador.y = inimigo.y - 5;
						inimigo.scale.x = 1;
						barraenemyHP.kill();
						irakih.kill();
						
						counter += FlxG.elapsed;
							if (counter <= 0.2)
								{
									//counter = 0;
									FlxG.stream("../assets/sons/morte boss.mp3", 0.4, false);
								}
						
							if (counter >= 0.5)
								{
									cristal.exists = true; 
									cristal.x = inimigo.x;
									cristal.y = inimigo.y;
								}
							if (counter >= 0.75)
							{
								
								FlxG.fade(0xff222222, 2, venceu);
							}
					}
					
						
					
			//função para pausa
			if (FlxG.keys.justPressed("P"))
				{
					paused = !paused;
				}
			if (paused)
				{
					return pauseGroup.update();	
				}
			
			//contador de pontos se = 0 / a porta(block) se abre	
			if (cenarioDAME.inimigos.countLiving()+0 || cenarioDAME.inimigos2.countLiving()+0)
			{
				cenarioDAME.exists = true;
				FlxG.collide(jogador, cenarioDAME)
			}
			else
			{
				cenarioDAME.exists = false;
				score.text = "MATE IRAHIK E RECUPERE O PRISM SEKAI";
				score.color = 0xffffffff;
				
				
				if (jogador.x > 2600)
				{
					score.exists = false;
				}
			}
				
			//atualiza o update	
			super.update();
		}
		
		
		//função de colição jogador / mob1
		private function hitEnemy (jogador:FlxObject, inimigos1:FlxObject):void
			{
				if (jogador.x > inimigos1.x)
				{
					inimigo.scale.x = -1;
				}
				else
				{
					inimigo.scale.x = 1;
				}
				
				if (Mob1(inimigos1).isDying == true)
				{
					return;
				}	

				if (Mob1(inimigos1).isDying == false)
				{

					
					if (jogador.x >= inimigos1.x - 3 && FlxG.keys.justReleased("Z"))
					{
						counter += FlxG.elapsed;
							if (counter <= 0.15)
								{
									counter = 0;
									FlxG.stream("../assets/sons/dor mob.mp3", 1, false);
								}
							if (counter <= 0.2)
								{
									counter = 0;
									FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								}
								
						inimigos1.health  -= 1
					}
					if (inimigos1.health <= 0)
					{
						
						inimigos1.kill();
						
						// se mob morrer contador - 1 mob
						score.text = "MATE-OS TODOS: " + (cenarioDAME.inimigos.countLiving() + cenarioDAME.inimigos2.countLiving());
					}
					
					if (jogador.x <= inimigos1.x + 3 && FlxG.keys.justReleased("Z"))
					{
						counter += FlxG.elapsed;
							if (counter <= 0.15)
								{
									counter = 0;
									FlxG.stream("../assets/sons/dor mob.mp3", 1, false);
								}
							if (counter <= 0.2)
								{
									counter = 0;
									FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								}	
								
						inimigos1.health  -= 1
					}
					if (inimigos1.health <= 0)
					{
						inimigos1.kill();
						
						// se mob morrer contador - 1 mob
						score.text = "MATE-OS TODOS: " + (cenarioDAME.inimigos.countLiving() + cenarioDAME.inimigos2.countLiving());
					}

					//ataque mob1
					if (inimigos1.x <= jogador.x - 2 || inimigos1.x >= jogador.x + 2)
					{
						counter3 += FlxG.elapsed;
									
						if (counter3 >= 1)
							{	
								counter3 = 0;
								FlxG.play(ataquemob, 0.5, false); 
							}	
						if (counter3 >= 1.2)
							{
								counter3 = 0;	
								FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								FlxG.play(dorheroi, 1, false);
							}
								
						jogador.health -= 0.02;
					}
					
					//morte heroi
					if (jogador.health <= 0)
					{
						jogador.kill();
						
						counter += FlxG.elapsed;
						
						if (counter >= 1)
							{
								FlxG.fade(0xff222222, 2, gameover);
							}
					}
		
				}
			}
			

			
		//função de colição jogador / mob2		
		private function hitEnemy2 (jogador:FlxObject, inimigos2:FlxObject):void
			{
				if (Mob2(inimigos2).isDying == true)
				{
					return;
				}	

				if (Mob2(inimigos2).isDying == false)
				{

					if (jogador.x >= inimigos2.x - 5 && FlxG.keys.justReleased("Z"))//|| jogador.x <= inimigos1.x + 2 && FlxG.keys.justReleased("Z"));
					{
						
						counter += FlxG.elapsed;
							if (counter <= 0.15)
								{
									counter = 0;
									FlxG.stream("../assets/sons/dormob2.mp3", 1, false);
								}
						if (counter <= 0.2)
								{
									counter = 0;
									FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								}
								
						inimigos2.health  -= 1
					}
					if (inimigos2.health <= 0)
					{
						inimigos2.kill();
						
						// se mob morrer contador - 1 mob
						score.text = "MATE-OS TODOS: " + (cenarioDAME.inimigos.countLiving() + cenarioDAME.inimigos2.countLiving());
					}
					
					if (jogador.x <= inimigos2.x + 5 && FlxG.keys.justReleased("Z"))
					{
						counter += FlxG.elapsed;
							if (counter <= 0.15)
								{
									counter = 0;
									FlxG.stream("../assets/sons/dormob2.mp3", 1, false);
								}
							if (counter <= 0.2)
								{
									counter = 0;
									FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								}
								
						inimigos2.health  -= 1
					}
					if (inimigos2.health <= 0)
					{
						inimigos2.kill();
						
						// se mob morrer contador - 1 mob
						score.text = "MATE-OS TODOS: " + (cenarioDAME.inimigos.countLiving() + cenarioDAME.inimigos2.countLiving());
					}

					//ataque mob2
					if (inimigos2.x <= jogador.x - 2 || inimigos2.x >= jogador.x + 2)
					{
						counter3 += FlxG.elapsed;
									
								if (counter3 >= 1)
							{	
								counter3 = 0;
								FlxG.play(ataquemob2, 1, false); 
							}	
							
								if (counter3 >= 1.2)
							{
								counter3 = 0;	
								FlxG.stream("../assets/sons/hitimpactheroi.mp3", 1, false);
								FlxG.stream("../assets/sons/dor heroi.mp3", 1, false);
							}
						
						jogador.health -= 0.05;
					}
					
					//morte heroi
					if (jogador.health <= 0)
					{
						jogador.kill();
						
						counter += FlxG.elapsed;
						
						if (counter >= 1)
							{
								FlxG.fade(0xff222222, 2, gameover);
							}
					}
					
				}
			}			
			

				
			
		//função retorno game over
		private function gameover():void
			{
				//envia para tela de game over
				FlxG.switchState(new GameOver());
			}	
		
		//função retorno voce venceu	
		private function venceu():void
			{
				//envia para tela de voce venceu
				FlxG.switchState(new Venceu());
			}
		
		//funcao destroy	
		override public function destroy():void
			{
			
				FlxG.pauseSounds();//sons
				cenario.destroy();//cenario fundo
				cenarioDAME.destroy();//block
				jogador.destroy();//jogador
				barraheroHP.destroy();//barraHP heroi
				hikari.destroy();//nome heroi
				inimigo.destroy();//boss
				barraenemyHP.destroy();//barra HP boss
				irakih.destroy();//nome boss
				score.destroy();//pontuação
				cristal.destroy();//cristal
				
				
				super.destroy();
			}	
	}

}