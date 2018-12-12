
-----------------------------------Implementing Widget and Background---------------------------------------------------
local widget = require("widget")
water=display.newImage("1.jpg",display.contentWidth-100,display.contentHeight-190)
water:toBack()




--------------------------------------Group Creation------------------------------------------------------------------

local fosil = display.newGroup()
local slider_group = display.newGroup()
local radio_group = display.newGroup()
-------------------------------------------SOUNDS   FOR   TOUCHES------------------------------------------------------------------------
caudal_sound = audio.loadSound( "oceanlap.wav" )
pelvic_sound = audio.loadSound( "water11.wav" )
mouth_sound = audio.loadSound( "mouth.wav" )
soft_sound = audio.loadSound( "soft.wav" )
ana_sound = audio.loadSound( "ana.wav" )

--------------------------------------------------------FISH  BODY ----------------------------------------------------------------------------
local opt ={
  frames={
  {x=13,y=7,width=148,height=71},
}
}
local sheet1= graphics.newImageSheet("fos.png",opt);

local body_seq=
{
  start=1
}
body_sprite=display.newSprite(sheet1,body_seq)
body_sprite.x=220
body_sprite.y=77
body_sprite:play();
---------------------------------------------------MOUTH  FRAMES, SEQUENCE , SLIDER IS IMPLEMENTED-------------------------------------------------------------
local mouth_frames=                  --- FRAMES
  {
  frames={
  {x=0,y=80,width=70,height=65},
  {x=70,y=80,width=51,height=65},
  {x=126,y=80,width=47,height=70},
  {x=180,y=80,width=49,height=65},}
  }
  local sheet2= graphics.newImageSheet("fos.png",mouth_frames);

  local mouth_seq = {               --- SEQUENCE
  {name="touch_mouth1",frames={2,3,4,5,4,3,2,1},time = 1000, loopCount = 1},
  { name = "mouth_1", frames = {1}},
  {name = "mouth_2" , frames = {2}},
  {name = "mouth_3", frames = {3}},
  {name = "mouth_4", frames = {4}}
   }
   mouth_sprite1=display.newSprite(sheet2,mouth_seq)
   mouth_sprite1.x=163
   mouth_sprite1.y=95

local function sliderListener (event)    -- LISTENER FOR MOUTH SLIDER---
  slider1_value = event.value

  print("slider at mouth"..slider1_value)
  if (slider1_value <25) then
    mouth_sprite1:setSequence("mouth_1")
    mouth_sprite1:play()
  elseif(slider1_value > 25 and slider1_value < 50) then
    mouth_sprite1:setSequence("mouth_2")
    mouth_sprite1:play()
  elseif(slider1_value > 50 and slider1_value < 75) then
    mouth_sprite1:setSequence("mouth_3")
    mouth_sprite1:play()
  elseif(slider1_value > 75 and slider1_value == 100) then
    mouth_sprite1:setSequence("mouth_4")
    mouth_sprite1:play()
  end
end
local mouth_slide = display.newText("Mouth",240 , 153, native.systemFont, 16)
mouth_slide:setFillColor(0,1,0)
  local slider1 = widget.newSlider(            -------- MOUTH SLIDER-------
{
  top= 140,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener = sliderListener})
---------------------------------------------------CAUDAL_FIN  FRAMES, SEQUENCE , SLIDER IS IMPLEMENTED-----------------------------------------------------------
local caudal_fin_frames=                          --------------CAUDAL_FIN  FRAMES----------------
  {
    frames={
  {x=13,y=152,width=57,height=49},
  {x=85,y=152,width=57,height=49},
  {x=148,y=152,width=57,height=49},
  {x=211,y=152,width=57,height=49},
  {x=274,y=152,width=50,height=49},
  }
  }
  local sheet2= graphics.newImageSheet("fos.png",caudal_fin_frames);

  local caudal_seq = {                          ---------------- SEQUENCE FOR CAUDAL FIN------------------------
    {name="caudal_touch",frames={2,3,4,5,4,3,2,1},time = 1000, loopCount = 3},
    {name = "caudal_fin_1", frames = {1}},
    {name = "caudal_fin_2" , frames = {2}},
    {name = "caudal_fin_3", frames = {3}},
    {name = "caudal_fin_4", frames = {4}},
    {name = "caudal_fin_5", frames = {5}},
  }
   caudal_sprite = display.newSprite(sheet2,caudal_seq)
   caudal_sprite.x=317
   caudal_sprite.y=85

local function sliderListener1 (event)              ------------------- LISTENER FOR CAUDAL SLIDER---------------
  slider2_value = event.value
  print("slider at caudal"..slider2_value)
  if(slider2_value > 20 and slider2_value < 40) then
    caudal_sprite:setSequence("caudal_fin_2")
    caudal_sprite:play()
  elseif(slider2_value > 40 and slider2_value < 60) then
    caudal_sprite:setSequence("caudal_fin_3")
    caudal_sprite:play()
  elseif(slider2_value > 60 and slider2_value < 80) then
    caudal_sprite:setSequence("caudal_fin_4")
    caudal_sprite:play()
  elseif(slider2_value > 80 and slider2_value <100) then
    caudal_sprite:setSequence("caudal_fin_4")
    caudal_sprite:play()
  end
end
local Caudal_slide = display.newText("Caudal Fin",240 , 183, native.systemFont, 16)
Caudal_slide:setFillColor(0,1,0)
  local slider2 = widget.newSlider(               --------------------- CAUDAL FIN SLIDER-----------------------
{
  top= 170,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener = sliderListener1})

---------------------------------------------------PELVIC_FIN FRAMES, SEQUENCE , SLIDER IS IMPLEMENTED-----------------------------------------------------
local pelvic_fin_frames=
  {
  frames={                                          -------------------PELVIC_FIN FRAMES---------------
  {x=13,y=218,width=49,height=27},
  {x=70,y=219,width=49,height=25},
  {x=122,y=218,width=51,height=23}
  }
  }
  local sheet2= graphics.newImageSheet("fos.png",pelvic_fin_frames);

  local pelvic_fin_seq = {                           ---------------------PELVIC_FIN SEQUENCE---------------
    {name = "pelvic_touch" , frames = {2,3,3,2,1},time = 1000, loopCount = 1},
    {name = "pelvic_fin_1", frames = {1}},
    {name = "pelvic_fin_2" , frames = {2}},
    {name = "pelvic_fin_3", frames = {3}}
    }
   pelvic_sprite = display.newSprite(sheet2,pelvic_fin_seq)
   pelvic_sprite.x=213
   pelvic_sprite.y=111
local function sliderListener2(event)               ------------------- LISTENER FOR PELVIC SLIDER----------------
  slider3_value = event.value
  print("slider at pelvicFin"..slider3_value)
  if(slider3_value > 33 and slider3_value < 66) then
    pelvic_sprite:setSequence("pelvic_fin_2")
    pelvic_sprite:play()
  elseif(slider3_value > 66 and slider3_value < 100) then
    pelvic_sprite:setSequence("pelvic_fin_3")
    pelvic_sprite:play()
  end
end
local pelvic_slide = display.newText("pelvic Fin",240 , 213, native.systemFont, 16)
pelvic_slide:setFillColor(0,1,0)
  local slider3 = widget.newSlider(               ------------------------- PELVIC FIN SLIDER-----------------------
{
  top= 200,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener = sliderListener2})

  ---------------------------------------------------ANAL_FIN FRAMES, SEQUENCE , SLIDER IS IMPLEMENTED-----------------------------------------------------

local anal_fin_frames=
  {
    frames={                                         ----------ANAL_FIN FRAMES----------------
      {x=179,y=218,width=69,height=28},
      {x=250,y=219,width=69,height=29}
  }
  }
  local sheet2= graphics.newImageSheet("fos.png",anal_fin_frames);
  local anal_fin_seq = {                                   ----------ANAL_FIN SEUENCE----------------
  {name = "anal_touch", frames = {1,2,2,1},time = 1000, loopCount = 1},
  {name = "anal_fin_1", frames = {1}},
  {name = "anal_fin_2" , frames = {2}}
  }
  anal_sprite = display.newSprite(sheet2,anal_fin_seq)
  anal_sprite.x=285
  anal_sprite.y=112
local function sliderListener3 (event)              ----------------------------LISTENER FOR ANAL_FIN SLIDER-----------------------
  slider4_value = event.value
  print("slider at analFin"..slider4_value)
  if (slider4_value < 50) then
    anal_sprite:setSequence("anal_fin_1")
    anal_sprite:play()
  elseif(slider4_value > 50 and slider4_value < 100) then
    anal_sprite:setSequence("anal_fin_2")
    anal_sprite:play()
  end
end
local ana_slide = display.newText("Anal Fin",240 , 243, native.systemFont, 16)
ana_slide:setFillColor(0,1,0)
  local slider4 = widget.newSlider(                     -------------------ANAL_FIN SLIDER--------------------------------
{
  top= 230,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener = sliderListener3})

  ---------------------------------------------------SOFT_RAY FRAMES, SEQUENCE , SLIDER IS IMPLEMENTED-----------------------------------------------------
  local soft_ray_frames=
  {
    frames={                                    ------------SOFT_RAY FRAMES---------------
    {x=144,y=254,width=29,height=29},
    {x=177,y=256,width=29,height=28},
    {x=210,y=258,width=29,height=28}
  }
  }
  local sheet2= graphics.newImageSheet("fos.png",soft_ray_frames);

  local soft_ray_seq = {                      ------------SOFT_RAY SEQUENCE---------------
  {name = "soft_touch", frames = {2,3,2,3,1},time = 1000, loopCount = 2},
  {name = "soft_ray_1", frames = {1}},
  {name = "soft_ray_2" , frames = {2}},
  {name = "soft_ray_3" , frames = {3}}
  }
   soft_ray_sprite = display.newSprite(sheet2,soft_ray_seq)
   soft_ray_sprite.x=280
   soft_ray_sprite.y=54

local function sliderListener5 (event)              ---------LISTENER FOR SOFT_RAY SLIDER-------------
  slider5_value = event.value
  print("slider at softRay"..slider5_value)
  if(slider5_value < 30) then
  soft_ray_sprite:setSequence("soft_ray_1")
    soft_ray_sprite:play()
  elseif(slider5_value > 30 and slider5_value < 65) then
    soft_ray_sprite:setSequence("soft_ray_2")
    soft_ray_sprite:play()
  elseif(slider5_value > 65 and slider5_value < 100) then
    soft_ray_sprite:setSequence("soft_ray_3")
    soft_ray_sprite:play()
  end
end
local soft_ray_slide = display.newText("Soft Ray",240 , 273, native.systemFont, 16)
 soft_ray_slide:setFillColor(0,1,0)
local slider5 = widget.newSlider(                  ---------------SOFT_RAY SLIDER-------------------
{
  top= 260,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener = sliderListener5})

 ---------------------------------------------------------------UPPER_FIN -----------------------------------------------------------------------------------
  local upper_fin=
{
  frames={
  {x=13,y=256,width=63,height=29},
}
}
local sheet2= graphics.newImageSheet("fos.png",upper_fin);

local seq=
{
  start=1
}
local fin=display.newSprite(sheet2,seq)
fin.x=255
fin.y=43
fin:play();
--------------------------------------------------------------HORIZONTAL _SLIDER------------------------------------------------------------------------------
function sliderListener6 (event)
    print ("slider at ".. event.value .."%")
    print (event.value)
    fosil.x=(event.value*3-150)
  end
  hor_move=display.newText("Hor Move",240,303,native.systemFont,16)
  hor_move:setFillColor(0,1,0)
 local  slider6 = widget.newSlider(
  {
  top= 286,
  left = 290,
  width= 150,
  value= 1,
  orientation = "horizontal",
  handleWidth= 30,
  handleHeight = 30,
  listener=sliderListener6 })

---------------------------------------------------------------------------RADIOBUTTONS RECTANGLE-------------------------------------------------------------
 local radioRect = display.newRoundedRect( 89,225,140,120,12)
local paint = { 1, 0, 0.5 }
radioRect.alpha=0.3
radioRect.stroke=paint
radioRect.strokeWidth=7
radioRect:setFillColor(.6,0,0)


local new1 = display.newRect(150,80,900,100)
new1.alpha = 0.01

local new = display.newRect(315,230,250,170)
new.alpha = 0.01



local function onSwitchPress1( event )       -------------------------SLIDER RADIO BUTTON LISTENER----------------------------

  new1 = display.newRect(150,80,900,100)      ----------------- INTIALIZING A TRANSPARENT RECTANGLE----------------------
  new1.alpha = 0.01
  new1:addEventListener("touch",function() return true end )  -----------ADDING TOUCH EVENT TO DISPLAY RECTANGLE-----------
  new:removeSelf()                  ---------------REMOVING TOUCH'S TRANSPARENT RECTANGLE IF ANY ---------------

end

local function onSwitchPress( event )

                                                 -------------------------TOUCH RADIO BUTTON LISTERNER----------------------------
  new = display.newRect(315,230,250,170)         ----------------- INTIALIZING A TRANSPARENT RECTANGLE----------------------
  new.alpha = 0.01
  new:addEventListener("touch",function() return true end )   -----------ADDING TOUCH EVENT TO DISPLAY RECTANGLE-----------
  new1:removeSelf()                               ---------------REMOVING SLIDER'S TRANSPARENT RECTANGLE IF ANY ---------------




----------------------------------------------------------TOUCH EVENTS  STARTED----------------------------------------------------------------------------
  local function touch_play( event )
      mouth_sprite1:setSequence("touch_mouth1")
      mouth_sprite1:play()
       audio.play(mouth_sound,{loops=0,channel=10})
      return
  end
  mouth_sprite1:addEventListener("touch",touch_play)
  local function caudal_play( event )
      caudal_sprite:setSequence("caudal_touch")
      caudal_sprite:play()
      audio.play(caudal_sound,{loops=0,channel=10})
      return
  end
  caudal_sprite:addEventListener("touch",caudal_play)
  local function pelvic_play( event )
      pelvic_sprite:setSequence("pelvic_touch")
      pelvic_sprite:play()
      audio.play(pelvic_sound,{loops=0,channel=10})
    return
  end
  pelvic_sprite:addEventListener("touch",pelvic_play)
  local function anal_play( event )
      anal_sprite:setSequence("anal_touch")
      anal_sprite:play()
       audio.play(ana_sound,{loops=0,channel=10})
    return
  end
  anal_sprite:addEventListener("touch",anal_play)
  local function soft_play( event )
      soft_ray_sprite:setSequence("soft_touch")
      soft_ray_sprite:play()
       audio.play(soft_sound,{loops=0,channel=10})
    return
  end
  soft_ray_sprite:addEventListener("touch",soft_play)
end

 --------------------------------------TOUCH EVENTS ENDED------------------------------------------------------------------------------------------------------



local touch1 = display.newText("Touch",100 , 250, native.systemFont, 22)
touch1:setFillColor(0,1,0)
local radio1 = widget.newSwitch(                                  ---------------TOUCH RADIO BUTTON INTIALIZED-----------------------
    {
        left = 30,
        top = 235,
        style = "radio",
        id = "Radio1",
        onPress = onSwitchPress,


    }

)
local slide = display.newText("Slider", 100, 200, native.systemFont, 22)
slide:setFillColor(0,1,0)
local radio2 = widget.newSwitch(                                 ---------------SLIDER  RADIO BUTTON INTIALIZED-----------------------
    {
        left = 30,
        top = 185,
        style = "radio",
        id = "Radio2",
        onPress = onSwitchPress1,
        initialSwitchState = true


    }
)
------------------------------------------------------------GROUP FOR RADIO BUTTONS, SLIDERS AND FISH PARTS------------------------------------------------------------
radio_group:insert(touch1)
radio_group:insert(slide)
radio_group:insert(radio1)
radio_group:insert(radio2)


slider_group:insert(slider1)
slider_group:insert(slider2)
slider_group:insert(slider3)
slider_group:insert(slider4)
slider_group:insert(slider5)
slider_group:insert(slider6)
slider_group:insert(mouth_slide)
slider_group:insert(Caudal_slide)
slider_group:insert(pelvic_slide)
slider_group:insert(ana_slide)
slider_group:insert(soft_ray_slide)
slider_group:insert(hor_move)

fosil:insert(fin);
fosil:insert(body_sprite);
fosil:insert(mouth_sprite1);
fosil:insert(caudal_sprite);
fosil:insert(pelvic_sprite);
fosil:insert(anal_sprite);
fosil:insert(soft_ray_sprite);


--------------------------------------------------------------------------------------------------------------------------------------------------------------
