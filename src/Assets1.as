package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class Assets1 extends FlxSprite
	{
		//imagem pro menu principal
		[Embed(source = "../assets/Imagens/menu.png")] public static var imagemmenu:Class;

		
		//funcao principal do assets1 com parametros x e y
		public function Assets1(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(0, 0, imagemmenu);
		}

	}

}