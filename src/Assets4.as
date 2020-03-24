package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 //ela vai extender a sprite por ser imagem fixa	 
	public class Assets4 extends FlxSprite
	{
		//imagem pro game over (tela preta)
		[Embed(source="../assets/Imagens/gameover.png")]public static var imggameover:Class;
		
		//funcao principal do assets2 com parametros x e y
		public function Assets4(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(0, 0, imggameover);
		}		
	}

}