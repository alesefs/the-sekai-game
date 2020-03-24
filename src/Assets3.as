package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	 //ela vai extender a sprite por ser imagem fixa
	public class Assets3 extends FlxSprite
	{
		//imagem pro creditos, controles e instruçoes
		[Embed(source="../assets/Imagens/menu3.png")] public static var imagemmenu3:Class;
		
		//funcao principal do assets3 com parametros x e y
		public function Assets3(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(0, 0, imagemmenu3);

		}

	}

}