package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa
	//sim o boss se move, mas para o programa a imagem é aquela inteira
	//com os sprites dentro dela
	public class Boss extends FlxSprite
	{
		//imagem do boss
		[Embed(source = "../assets/Imagens/Irakih.png")] public static var boss:Class;
		
		//som de ataque do boss
		[Embed(source = "../assets/sons/ataqueboss.mp3")]public static var atkboss:Class;
		
		//som dos passos do boss (so usar na aula de som)
		//[Embed(source = "../assets/sons/passoboss.mp3")] public static var andarboss:Class;
		
		//boolean para saber se o boss ta morto ou vivo
		public var morto:Boolean = false;
		
		//função do boss com parametros x e y
		public function Boss(X:int, Y:int) 
		{
			//atualização do boss
			super(X, Y);
			
			//carregando a imagem como sprites
			loadGraphic(boss, true, true, 31, 60);
			
			//lado inicial em que o boss vai aparecer
			facing = FlxObject.LEFT;
			
			//animações criadas apartir da imagem do boss
			
			//addAnimation("nome do movimento", [array dos sprites do movimento],
			//framerate(FPS), boolean para loop da animação)
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [2, 3, 4, 5], 5, true);
			addAnimation("ataque", [6, 7], 3, false);
			
			//ele iniciara em "idle" [parado] o play é o inicializador
			play("idle");
			
			//aumento de pixel para não desfocar
			offset.x = 2;
			offset.y = 2;
			
		}
		
		
		//função kill serve para atualizar e dizer como vai ficar o boss
		//quando ele morrer.
		override public function kill():void //função morrer	
		{
			
			morto = true; //quando morto o boolean da do inicio da pagina
			
			frame = 0; // numero de FPS 
			
			//velocidades x e y
			velocity.x = 0; 
			velocity.y = 0;
			
			//angulo de rotação do boss quando morto (90º deixa ele deitado)
			angle = 90;
		}
		
	}

}