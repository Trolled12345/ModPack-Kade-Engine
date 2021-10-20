local normal1 = false
local normal2 = false

local lockzoom = false
local swayingsmall = false
local swayinglarge = false
local swayingbigger = false
local swayingbiggest = false
local swayingbiggest2 = false

local camerabeat = false

function start (song)
    hudX = getHudX()
    hudY = getHudY()

	RedBG = makeSprite('RedBG','redbg', true)
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
	BlackBG = makeSprite('BlackFade','blackbg', true)
	InvertBG = makeSprite('InvertBG','invertbg', true)
	WhiteFade = makeSprite('WhiteBG','whitefade', false)
	BlackFade = makeSprite('BlackFade','blackfade', false)
	
	setActorX(200,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(2,'blackfade')
	
	setActorX(200,'whitefade')
	setActorY(500,'whitefade')
	setActorAlpha(0,'whitefade')
	setActorScale(2,'whitefade')
	
	setActorX(50,'redbg')
	setActorY(450,'redbg')
	setActorAlpha(0,'redbg')
	setActorScale(2,'redbg')
	
	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(2,'whitebg')
	
	setActorX(200,'blackbg')
	setActorY(500,'blackbg')
	setActorAlpha(0,'blackbg')
	setActorScale(2,'blackbg')
	
	setActorX(50,'invertbg')
	setActorY(450,'invertbg')
	setActorAlpha(0,'invertbg')
	setActorScale(2,'invertbg')
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()

	if lockzoom then
		setCamZoom(1)
	end
	
	if shakenote then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 3 * math.sin((currentBeat * 10 + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 3 * math.cos((currentBeat * 10 + i*0.25) * math.pi) + 10, i)
		end
	end

	if shakehud then
		for i=0,7 do
			setHudPosition(50 * math.sin((currentBeat * 15 + i*0.25) * math.pi), 50 * math.cos((currentBeat * 15 + i*0.25) * math.pi))
			setCamPosition(-50 * math.sin((currentBeat * 15 + i*0.25) * math.pi), -50 * math.cos((currentBeat * 15 + i*0.25) * math.pi))
		end
	end

	if sustainshake then
		for i=0,7 do
			setHudPosition(10 * math.sin((currentBeat * 15 + i*0.25) * math.pi), 10 * math.cos((currentBeat * 15 + i*0.25) * math.pi))
		end
	end

	if finalshake then
		for i=0,7 do
			setHudPosition(8 * math.sin((currentBeat * 15 + i*0.25) * math.pi), 8 * math.cos((currentBeat * 15 + i*0.25) * math.pi))
			setCamPosition(8 * math.sin((currentBeat * 15 + i*0.25) * math.pi), 8 * math.cos((currentBeat * 15 + i*0.25) * math.pi))
		end
	end
	
    if sway then
        camHudAngle = 8 * math.sin((currentBeat))
    end
	
	if hudup then
		setHudPosition(0, hudY - 1)
	end
	
	if huddown then
		setHudPosition(0, hudY + 1)
	end

	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
		end
	end
	if swayinglarge then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
		end
	end
	if swayingbigger then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*5) * math.pi) + 10 ,i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi) + 10,i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi) + 10,i)
		end
	end
	if swayingbiggest2 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin(currentBeat) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi) + 10,i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin(currentBeat) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi) + 10,i)
		end
	end
end


function beatHit (beat)
	if camerabeat then
		setCamZoom(1)
	end
end

function stepHit (step)
	if step == 1 then
	end
	if step == 216 then
		tweenFadeOut('girlfriend',0,0.01)
		tweenFadeIn(WhiteBG,1,0.01)
		showOnlyStrums = true
		setCamZoom(2)
		swayingsmall = true	
	end
	-- FIRST JITTER EFFECT
	if step == 217 then
		tweenFadeOut(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 218 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeOut(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 219 then
		tweenFadeOut(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 220 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeOut(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 222 then
		tweenFadeOut(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 224 then
		tweenFadeOut(WhiteBG,0,0.01)
		tweenFadeOut(RedBG,0,0.01)
		tweenFadeIn('girlfriend',1,0.01)
		setCamZoom(2)
		camerabeat = true
	end
	if step == 988 then
	swayingsmall = false
	camerabeat = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			setActorY(_G['defaultStrum'..i..'Y'],i)
		end	
	end
	if step == 1244 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		shakenote = true
		shakehud = true
	end
	if step == 1245 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 1246 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 1247 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 1248 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
		shakenote = false
		shakehud = false
		swayinglarge = true
		camerabeat = true
		setCamPosition(0,0)
		setHudPosition(0,0)
	end
	if step == 2012 then
		swayinglarge = false
		camerabeat = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			setActorY(_G['defaultStrum'..i..'Y'],i)
		end	
	end
	if step == 2288 then
		tweenFadeOut('dad',0,2)
		tweenFadeIn(BlackBG,1,2)
	end
	if step == 2336 then
		shakenote = true
	end
	if step == 2395 then
		tweenFadeOut(BlackBG,0,0.01)
		tweenFadeIn('dad',1,0.2)
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		shakehud = true
	end
	if step == 2396 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2397 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2398 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2399 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2400 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
		shakehud = false
		shakenote = false
		swayingbigger = true
		camerabeat = true
		setCamPosition(0,0)
		setHudPosition(0,0)
	end
	if step == 2656 then
		swayingbigger = false
		swayingbiggest = true
	end
	if step == 2912 then
		tweenFadeIn('dad',0,0.6)
		camerabeat = false
		swayingbiggest = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
	if step == 2928 then
		tweenFadeIn(BlackFade,1,0.6)
	end
	if step == 2956 then
		tweenFadeIn(BlackFade,0,0.4)
		tweenFadeIn('dad',1,0.4)
	end
	if step == 2960 then
		setCamZoom(2)
		shakenote = true
	end
	if step == 2962 then
		setCamZoom(2)
	end
	if step == 2964 then
		setCamZoom(2)
	end
	if step == 2966 then
		setCamZoom(2)
	end
	if step == 2968 then
		setCamZoom(2)
	end
	if step == 2969 then
		setCamZoom(2)
	end
	if step == 2970 then
		setCamZoom(2)
	end
	if step == 2971 then
		setCamZoom(2)
	end
	if step == 2972 then
		setCamZoom(2)
	end
	if step == 2973 then
		setCamZoom(2)
	end
	if step == 2974 then
		setCamZoom(2)
	end
	if step == 2975 then
		setCamZoom(2)
	end
	if step == 2976 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
		shakehud = true
	end
	if step == 2977 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2978 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2979 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2980 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2981 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2982 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2983 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2984 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2985 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2986 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2987 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2988 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2989 then
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		setCamZoom(2)
	end
	if step == 2990 then
		tweenFadeIn(WhiteBG,0,0.01)
		tweenFadeIn(RedBG,1,0.01)
		setCamZoom(2)
	end
	if step == 2991 then
		swayingbigger = true
		shakehud = false
		shakenote = false
		camerabeat = true
		setCamPosition(0,0)
		setHudPosition(0,0)
	end
	if step == 3272 then
		camHudAngle = 5
	end
	if step == 3276 then
		camHudAngle = 10
	end
	if step == 3280 then
		camHudAngle = -10
		sustainshake = true
	end
	if step == 3292 then
		camHudAngle = -5
		sustainshake = false
	end
	if step == 3294 then
		camHudAngle = -10
		sustainshake = true
	end
	if step == 3308 then
		camHudAngle = 10
		sustainshake = false
	end
	if step == 3312 then
		camHudAngle = -5
		sustainshake = true
	end
	if step == 3324 then
		camHudAngle = -10
	end
	if step == 3340 then
		camHudAngle = -5
		sustainshake = false
	end
	if step == 3342 then
		camHudAngle = 5
		sustainshake = true
	end
	if step == 3356 then
		camHudAngle = -5
		sustainshake = false
	end
	if step == 3358 then
		camHudAngle = 10
		sustainshake = true
	end
	if step == 3372 then
		camHudAngle = -5
		sustainshake = false
	end
	if step == 3376 then
		camHudAngle = 5
		sustainshake = true
	end
	if step == 3396 then
		camHudAngle = 0
		sustainshake = false
	end
	if step == 3400 then
		camHudAngle = 10
		sustainshake = true
	end
	if step == 3404 then
		camHudAngle = 5
	end
	if step == 3408 then
		camHudAngle = -10
	end
	if step == 3420 then
		camHudAngle = 10
	end
	if step == 3436 then
		camHudAngle = -10
		sustainshake = false
	end
	if step == 3438 then
		camHudAngle = 5
		sustainshake = true
	end
	if step == 3460 then
		camHudAngle = 0
		sustainshake = false
	end
	if step == 3466 then
		camHudAngle = -5
	end
	if step == 3468 then
		camHudAngle = -10
	end
	if step == 3470 then
		camHudAngle = 5
		sustainshake = true
	end
	if step == 3492 then
		camHudAngle = 0
		sustainshake = false
	end
	if step == 3496 then
		camHudAngle = -5
	end
	if step == 3498 then
		camHudAngle = 10
	end
	if step == 3500 then
		camHudAngle = -10
	end
	if step == 3505 then
		camHudAngle = 0
	end
		
	if step == 3752 then
		camHudAngle = 30
		cameraAngle = 30
		tweenFadeIn(BlackBG,1,0.01)
		tweenFadeIn(RedBG,0,0.01)
		tweenFadeIn('girlfriend',0,0.01)
	end
	if step == 3756 then
		camHudAngle = 300
		cameraAngle = 300
	end
	if step == 3760 then
		camHudAngle = 0
		cameraAngle = 0
		sway = true
	end
	if step == 4016 then
		swayingbigger = false
		swayingbiggest2 = true
		finalshake = true
		tweenFadeIn(WhiteFade,1,0.01)
		tweenFadeIn(BlackBG,0,0.01)
	end
	if step == 4017 then
		tweenFadeOut(WhiteFade,0,0.6)
		tweenFadeIn(InvertBG,1,0.01)
	end
	if step == 4273 then
		swayingbiggest2 = false
		camerabeat = false
		sway = false
		setCamPosition(0,0)
		setHudPosition(0,0)	
		camHudAngle = 0
		tweenFadeIn(WhiteBG,1,0.01)
		tweenFadeOut(InvertBG,0,0.01)
		tweenFadeIn('girlfriend',0,0.01)
		tweenFadeOut('dad',0,0.5)
		showOnlyStrums = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
	end
	if step == 4276 then
		tweenFadeOut(WhiteBG,0,1)
		tweenFadeIn('girlfriend',1,1)
	end
	if step == 4280 then
		setCamPosition(0,0)
		setHudPosition(0,0)
		finalshake = false
	end
	if step == 4288 then
		tweenFadeIn(BlackFade,1,1)
		for i=0,7 do
			tweenFadeIn(i,0,1)
		end
	end
	if step == 4296 then
		hudup = true
	end
	if step == 4309 then
		hudup = false
	end
end