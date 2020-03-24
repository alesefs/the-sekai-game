package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 //ela vai extender a sprite por ser imagem fixa
	public class Assets2 extends FlxSprite
	{
		//imagem pro opcoes e historia
		[Embed(source = "../assets/Imagens/menu2.png")] public static var imagemmenu2:Class;

		//funcao principal do assets2 com parametros x e y
		public function Assets2(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(0, 0, imagemmenu2);
		}	
	}

}