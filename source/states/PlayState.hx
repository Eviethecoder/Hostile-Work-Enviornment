package states;

import data.Paths;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import objects.Button;

class PlayState extends FlxState
{
	public static var instance:PlayState;

	public var countnumber:Float = 0;

	var text:FlxText;

	override public function create()
	{
		super.create();
		instance = this;
		var button:Button = new Button(0.0);
		button.scale.set(0.3, 0.3);
		button.updateHitbox();
		button.screenCenter();
		add(button);
		text = new FlxText("Hello World", 32);
		text.setFormat(Paths.font("Hwe_font-Regular.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		text.screenCenter();
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		text.text = '$countnumber';
	}
}
