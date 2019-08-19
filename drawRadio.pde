void drawRadio ()
{

  stroke (255, 0, 0);
  strokeWeight(10);
  fill (0);
  rect (75, 150, 325, 150);
  rect (75, 350, 325, 150);
  rect (75, 550, 325, 150);
  rect (75, 750, 325, 150);
  textAlign(LEFT, CENTER);
  if (songPlaying)
    stroke(0, 255, 0);
  else
    stroke (0);
  ellipse (290, 105, 10, 10);
  fill(255);
  textSize(40);
  text("FM RADIO", 75, 100);
  textAlign (CENTER, CENTER);
  textFont(digitalFont);
  fill(255, 0, 0);
  textSize(65);
  text ("ELECTRONIC", 238, 225);
  text ("JAZZ", 238, 425);
  text ("POP", 238, 625);
  text ("OFF", 238, 825);
}

void mousePressed ()
{
  if (choiceMade)
  {
    if ((mouseX>75 && mouseX<400) && (mouseY>150 && mouseY<300))
    {
      if (songPlaying)
      {
        if (playpopSound)
          popsound.pause();
        if (playjazzSound)
          jazzsound.pause();
        if (playelectronicSound)
          electronicsound.pause();
      }

      popsound = minim.loadFile("pop.mp3", 512);
      popsound.play();
      playpopSound = true;
      songPlaying = true;
    }
    if ((mouseX>75 && mouseX<400) && (mouseY>350 && mouseY<500))
    {
      if (songPlaying)
      {
        if (playpopSound)
          popsound.pause();
        if (playjazzSound)
          jazzsound.pause();
        if (playelectronicSound)
          electronicsound.pause();
      }

      jazzsound = minim.loadFile("jazz.mp3", 512);
      jazzsound.play();
      playjazzSound = true;
      songPlaying = true;
    }
    if ((mouseX>75 && mouseX<400) && (mouseY>550 && mouseY<700))
    {
      if (songPlaying)
      {
        if (playpopSound)
          popsound.pause();
        if (playjazzSound)
          jazzsound.pause();
        if (playelectronicSound)
          electronicsound.pause();
      }

      electronicsound = minim.loadFile("classical.mp3", 512);
      electronicsound.play();
      playelectronicSound = true;
      songPlaying = true;
    }
    if ((mouseX>75 && mouseX<400) && (mouseY>750 && mouseY<900))
    {

      if (playpopSound)
        popsound.pause();
      if (playjazzSound)
        jazzsound.pause();
      if (playelectronicSound)
        electronicsound.pause();
      songPlaying = false;
    }
  }
}
