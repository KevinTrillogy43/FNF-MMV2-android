function onCreatePost()
    detectCharacter('dad')
    detectCharacter('gf')
    detectCharacter('boyfriend')
end
function onUpdate()
    if luaSpriteExists('boyfriendIhyCape') then
        setProperty('boyfriendIhyCape.x',getProperty('boyfriend.x') + 20)
        setProperty('boyfriendIhyCape.y',getProperty('boyfriend.y') - 30)
    end
    if luaSpriteExists('dadIhyCape') then
        setProperty('dadIhyCape.x',getProperty('dad.x'))
        setProperty('dadIhyCape.x',getProperty('dad.y'))
    end
end
function createCape(character)
    local name = character..'IhyCape'
    makeAnimatedLuaSprite(name,'characters/MM_IHY_Boyfriend_AssetsFINAL',0,0)
    scaleObject('IhyCape', 2.0, 2.0);
    addAnimationByPrefix(name,'anim','Capejajacomoelcharter',24,true)
    addLuaSprite(name,false)
    setObjectOrder(name,getObjectOrder(character..'Group')-1)
end
function detectCharacter(character)
    if getProperty(character..'.curCharacter') == 'bfihy' then
        createCape(character)
        if character == 'dad'  then
            setProperty('dadIhyCape.flipX',getProperty('dad.flipX'))
        end
    else
        removeLuaSprite(character,true)
    end
end
function onEvent(name,v1,v2)
    if name == 'Change Character' then
        if v1 == 'bfihy' then
            if v2 == '1' or v2 == 'dad' then
                detectCharacter('dad')
            elseif v2 == '2' or v2 == 'gf' then
                detectCharacter('gf')
            else
                detectCharacter('boyfriend')
            end
        end
    end
end