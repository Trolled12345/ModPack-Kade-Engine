package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		
		animation.add('bf-tabi', [0, 1], 0, false, isPlayer);
		animation.add('bf-tabi-crazy', [0, 1], 0, false, isPlayer);
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('face', [8, 9], 0, false, isPlayer);
		animation.add('dad', [6, 7], 0, false, isPlayer);
		animation.add('bf-old', [2, 3], 0, false, isPlayer);
		animation.add('gf', [4, 5], 0, false, isPlayer);
		animation.add('agoti', [10, 11], 0, false, isPlayer);
		animation.add('agoti-crazy', [12, 13], 0, false, isPlayer);
		animation.add('tabi', [14, 15], 0, false, isPlayer);
		animation.add('tabi-crazy', [16, 17], 0, false, isPlayer);
		animation.add('garcello', [18, 19], 0, false, isPlayer);
		animation.add('garcellotired', [20, 21], 0, false, isPlayer);
		animation.add('garcellodead', [22, 23], 0, false, isPlayer);
		animation.add('garcelloghosty', [24, 25], 0, false, isPlayer);
		animation.add('zardy', [26, 27], 0, false, isPlayer);		
		animation.add('Crewmate', [28, 29], 0, false, isPlayer);		
		

		antialiasing = true;
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
