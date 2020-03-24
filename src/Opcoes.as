package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import flash.display.*;
	/**
	 * ...
	 * @author alehssandro
	 */
	
	//ela vai extender a state por ser imagem fixa 
	public class Opcoes extends FlxState 
	{
		//chama a imagem de fundo na classe assets2
		public static var imagemmenu2:Assets2;
		
		//botoes --> controles, instrucoes, creditos, menu
		public static var botaocontroles:FlxButton;
		public static var botaoinstruçoes:FlxButton;
		public static var botaocreditos:FlxButton;
		public static var botaomenu:FlxButton;
		
		//som de fundo
		[Embed(source = "../assets/sons/menu.mp3")] private var som2menump3:Class; 
		
		//função principal 
		public function Opcoes() 
		{
			super();
		}
		
		//função create
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//adiciona imagem de fundo no stage
			imagemmenu2 = new Assets2(0, 0);
			add(imagemmenu2);
			
			//mostra mouse
			FlxG.mouse.show();
			
			//adiciona botao controles
			botaocontroles = new FlxButton(20, 150, "CONTROLES", controles);
			botaocontroles.color = 0xEEE8AA;
			botaocontroles.label.color = 0x0000FF;
			add(botaocontroles);
			
			//adiciona botao inistruçoes
			botaoinstruçoes = new FlxButton(120, 150, "INSTRUCOES", instrucao);
			botaoinstruçoes.color = 0xEEE8AA;
			botaoinstruçoes.label.color = 0x0000FF;
			add(botaoinstruçoes);
			
			//adiciona botao creditos
			botaocreditos = new FlxButton(220, 150, "CREDITOS", creditos); 
			botaocreditos.color = 0xEEE8AA;
			botaocreditos.label.color = 0x0000FF;
			add(botaocreditos);
			
			//adiciona botao menu
			botaomenu = new FlxButton(120, 180, "MENU", menu1);
			botaomenu.color = 0xEEE8AA;
			botaomenu.label.color = 0x0000FF;
			add(botaomenu);	
			
			//toca trilha de fundo
			FlxG.play(som2menump3, .5, true);
			
			//atualiza o create
			super.create();
		}
		
		//metodo para função retorno
		private function controles():void
			{
			   FlxG.mouse.show();
			   
			   FlxG.fade(0xff222222, 2, controles2);
			}
	
		//metodo para função retorno
		private function instrucao():void
			{
			   FlxG.mouse.show();
			   FlxG.fade(0xff222222, 2, instrucao2);
			   
			}
		
		//metodo para função retorno	
		private function creditos():void
			{
			   FlxG.mouse.show();
			   FlxG.fade(0xff222222, 2, creditos2);
			}
		
		//metodo para função retorno	
		private function menu1():void
			{
			   FlxG.mouse.show();
			   FlxG.fade(0xff222222, 2, menu2);
			}			
		
		//função retorno controles
		private function controles2():void
			{
				//envia para controles 
				FlxG.switchState(new Controles);
			}
		
		//função retorno instruçoes	
		private function instrucao2():void
			{
				//envia para instruçoes
				FlxG.switchState(new Instrucoes);
			}
		
		//função retorno creditos
		private function creditos2():void
			{
				//envia para creditos
				FlxG.switchState(new Creditos);
			}	
			
		//função retorno menu					   
		private function menu2():void
			{
				//envia para menu
				FlxG.switchState(new Menu);
			}	
			
			
		//função destruir	
		override public function destroy():void
			{
				
				FlxG.pauseSounds();//sons 
				imagemmenu2.destroy();//imsgem fundo
				botaocontroles.destroy();//botao controles
				botaoinstruçoes.destroy();//botao instruçoes
				botaocreditos.destroy();//botao creditos
				botaomenu.destroy();//botao menu
				
				//atualiza destroy
				super.destroy();
			}
		
	}

}