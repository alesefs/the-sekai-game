package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a sprite por ser imagem fixa 
	public class Assets5 extends FlxSprite
	{
		//imagem do cristal sekai
		[Embed(source="../assets/Imagens/cristal.png")] public static var cristal:Class;
		
		//funcao principal do assets2 com parametros x e y
		public function Assets5(x:Number, y:Number) 
		{
			//o super para atualizar a imagem
			super(2700, 50, cristal);	
			scale.x = 0.25; //escala em x para imagem cristal
			scale.y = 0.35; //escala em y para imagem cristal
		}
		
	}

}