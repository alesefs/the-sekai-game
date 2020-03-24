package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 //ela vai extender a sprite por ser imagem fixa	 
	public class Assets6 extends FlxSprite
	{
		//imagem pro game over (tela preta)
		[Embed(source="../assets/Imagens/gameover2.png")]public static var imggameover:Class;
		
		//funcao principal do assets6 com parametros x e y
		public function Assets6(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(0, -200, imggameover);
		}		
	}

}