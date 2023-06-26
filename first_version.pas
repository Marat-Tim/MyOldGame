uses graphabc;

type
  vrag = class
    x, y, z, u: integer;
    cx, cy: integer;
    d: integer := 1 + 1 + 1 + 1 + 1;
    ds: integer;
    
    procedure figuravraga(vragg: vrag);
    begin
      brush.Color := clred;
      rectangle(vragg.x, vragg.y, vragg.z, vragg.u);
      fillrectangle(vragg.x, vragg.y, vragg.z, vragg.u);
      brush.Color := clwhite;
      pen.Color := clblack;
      pen.Width := 3;
      circle(vragg.x + 10, vragg.y + 10, 3);
      circle(vragg.x + 30, vragg.y + 10, 3);
      ellipse(vragg.x + 5, vragg.y + 35, vragg.x + 35, vragg.y + 20);
      //floodfill(vragg.x + 20, vragg.y + 30, clred);
      brush.Color := clred;
      fillellipse(vragg.x + 5, vragg.y + 35, vragg.x + 35, vragg.y + 20);
      ellipse(vragg.x + 5, vragg.y + 35, vragg.x + 35, vragg.y + 20);
      brush.Color := clwhite;
      pen.Width := 1;
      brush.Color := clwhite;
    end;
    
    procedure dvvrag(vragg: vrag; vx, vy, vz, vu: integer; tri: boolean);
    begin
      if (vx > vragg.x) and (vy > vragg.y) and (vz < vragg.z) and (vu < vragg.u) then
      begin
        window.Clear;
        lockdrawing;
        for var i := 1 to 700 do
        begin
          brush.Color := clrandom;
          write('вы проиграли');
          
        end;
        redraw;
        tri := false;
        sleep(1500);
        window.Close;
      end;
      if ((vx + 10) >= (vragg.x + 20)) and ((vy + 10) <= (vragg.y + 20)) then
      begin
        vragg.x := vragg.x + vragg.d;
        vragg.y := vragg.y - vragg.d;
      end;
      if ((vx + 10) >= (vragg.x + 20)) and ((vy + 10) >= (vragg.y + 20)) then
      begin
        vragg.x := vragg.x + vragg.d;
        vragg.y := vragg.y + vragg.d;
      end;
      if ((vx + 10) <= (vragg.x + 20)) and ((vy + 10) <= (vragg.y + 20)) then
      begin
        vragg.x := vragg.x - vragg.d;
        vragg.y := vragg.y - vragg.d;
      end;
      if ((vx + 10) <= (vragg.x + 20)) and ((vy + 10) >= (vragg.y + 20)) then
      begin
        vragg.x := vragg.x - vragg.d;
        vragg.y := vragg.y + vragg.d;
      end;
      vragg.z := vragg.x + 40;
      vragg.u := vragg.y + 40;
    end;
  
  end;

const
  dxq = 1366;
  dyq = 705;
  sp = 15;
  yv = 275;

var
  x, y, z, u, fx, fy, fu, fz, dx, dy, s, speed, kolvo, dd, kv, inf: integer;
  vrag1: vrag := new vrag;
  p: integer := 47;
  tr: boolean := false;
  stroka: string := ' | игра: ***НЕ НАЙДЕНО*** | версия: 3.3.1 | количество ходов: ';
  stroka2: string := ' | нажмите «↑» чтобы увеличить скорость (за 2 фрукта) | нажмите «F1» чтобы увидеть контур фруктов';







procedure zastavka;
var
  i: integer;
begin
  i := 254;
  window.Caption := ' СДЕЛАНО С ПОМОЩЬЮ «PascalABC.net» ';
  sleep(1000);
  while i <> 0 do
  begin
    i := i - 2;
    pen.Width := 10;
    pen.Color := rgb(i, i, i);
    line(120 + 15, 550, 120 + 15, 380);
    arc(120 + 15, 432, 50, 270, 450);
    line(220, 550, 250, 450);
    line(250, 450, 280, 550);
    line(235, 508, 264, 508);
    line(330, 450, 390, 450);
    line(330, 450, 330, 500);
    line(330, 500, 390, 500);
    line(390, 500, 390, 550);
    line(390, 550, 330, 550);
    arc(480, 500, 50, 60, 300);
    line(550, 550, 580, 450);
    line(580, 450, 610, 550);
    line(565, 508, 595, 508);
    line(660, 550, 660, 380);
    pen.Color := rgb(i, i, 255);
    line(710, 550, 750, 380);
    line(750, 380, 790, 550);
    line(726, 481, 772, 481);
    pen.Color := rgb(i, 255, i);;
    line(840, 550, 840, 380);
    arc(840, 417, 35, 270, 450);
    arc(840, 500, 50, 270, 450);
    pen.Color := rgb(255, i, i);;
    line(940, 520, 940, 410);
    arc(970, 520, 30, 180, 330);
    arc(970, 410, 30, 390, 450 + 90);
    pen.Color := rgb(i, i, i);;
    line(1040, 550, 1048, 550);
    line(1080, 550, 1080, 450);
    line(1080, 450, 1140, 550);
    line(1140, 550, 1140, 450);
    line(1190, 550, 1190, 450);
    line(1190, 550, 1230, 550);
    line(1190, 450, 1230, 450);
    line(1190, 500, 1230, 500);
    line(1300, 450, 1300, 550);
    line(1270, 450, 1330, 450);
  end;
  
  sleep(1000);
  while i <> 255 do
  begin
    i := i + 3;
    pen.Width := 10;
    pen.Color := rgb(i, i, i);
    line(120 + 15, 550, 120 + 15, 380);
    arc(120 + 15, 432, 50, 270, 450);
    line(220, 550, 250, 450);
    line(250, 450, 280, 550);
    line(235, 508, 264, 508);
    line(330, 450, 390, 450);
    line(330, 450, 330, 500);
    line(330, 500, 390, 500);
    line(390, 500, 390, 550);
    line(390, 550, 330, 550);
    arc(480, 500, 50, 60, 300);
    line(550, 550, 580, 450);
    line(580, 450, 610, 550);
    line(565, 508, 595, 508);
    line(660, 550, 660, 380);
    pen.Color := rgb(i, i, 255);
    line(710, 550, 750, 380);
    line(750, 380, 790, 550);
    line(726, 481, 772, 481);
    pen.Color := rgb(i, 255, i);;
    line(840, 550, 840, 380);
    arc(840, 417, 35, 270, 450);
    arc(840, 500, 50, 270, 450);
    pen.Color := rgb(255, i, i);;
    line(940, 520, 940, 410);
    arc(970, 520, 30, 180, 330);
    
    arc(970, 410, 30, 390, 450 + 90);
    pen.Color := rgb(i, i, i);;
    line(1040, 550, 1048, 550);
    line(1080, 550, 1080, 450);
    line(1080, 450, 1140, 550);
    line(1140, 550, 1140, 450);
    line(1190, 550, 1190, 450);
    line(1190, 550, 1230, 550);
    line(1190, 450, 1230, 450);
    line(1190, 500, 1230, 500);
    line(1300, 450, 1300, 550);
    line(1270, 450, 1330, 450);
  end;
  window.Clear;
  pen.Color := clblack;
  pen.Width := 1;
  sleep(2000);
end;




procedure pobeda;
begin
  window.Clear;
  lockdrawing;
  brush.Color := clyellow;
  for var i := 1 to 700 do
    write('вы победили!!! ');
  Redraw;
  tr := false;
end;

procedure figurafructa;
begin
  brush.Color := cllime;
  pen.Width := 1;
  pen.Color := cllime;
  arc(fx + 20, fy + 25, 25, 90, 270);
  arc(fx + 30, fy + 25, 25, 270, 450);
  line(fx + 20, fy + 50, fx + 25, fy + 40);
  line(fx + 30, fy + 50, fx + 25, fy + 40);
  line(fx + 20, fy, fx + 30, fy);
  floodfill(fx + 20, fy + 25, cllime);
  pen.Color := clbrown;
  pen.Width := 2;
  line(fx + 25, fy, fx + 25, fy - 10);
  pen.Width := 1;
  pen.Color := cllime;
  line(fx + 25, fy - 10, fx + 35, fy - 6);
  line(fx + 25, fy - 2, fx + 35, fy - 6);
  floodfill(fx + 30, fy - 6, cllime);
  if (kv mod 2 <> 0) then
  begin
    pen.Color := clblack;
    drawrectangle(fx, fy, fz, fu);
    pen.Color := cllime;
  end;
end;

procedure figura;
begin
  pen.Color := clyellow;
  brush.Color := clyellow;
  drawrectangle(x, y, z, u);
  fillrectangle(x, y, z, u);
  pen.Color := clblack;
  brush.Color := clblack;
  circle(x + 4, y + 4, 2);
  circle(x + 15, y + 4, 2);
  pen.Width := 3;
  arc(x + 9, y + 10, 7, 180, 360);
  pen.Width := 1;
end;


procedure info;
begin
  window.Clear;
  pen.Color := clblack;
  brush.Color := clwhite;
  line(0, 575, window.Width, 575);
  textout(510, 580, '«W*A*S*D» - управление');
  textout(510, 600, '«ENTER» - выйти из игры');
  textout(510, 620, '«↑» - увеличить скорость (за 2 фрукта)');
  textout(510, 640, '«↓» - приравнивает вашу скорость к одному (при втором нажатии возвращает нормальную)');
  textout(510, 660, '«F1» - показывает контур яблок');
  textout(510, 680, '«Ctrl» - пропускает ход');
end;


procedure friuts;
begin
  if (x > fx) and (z < fz) and (y > fy) and (u < fu) then
  begin
    window.Clear;
    graphabc.LockDrawing;
    vrag1.dvvrag(vrag1, x, y, z, u, tr);
    vrag1.figuravraga(vrag1);
    s := s + 1;
    fx := random(100, DXQ - 100);
    fy := random(100, DYQ - 100);
    fz := fx + 50;
    fu := fy + 50;
    figura;
    figurafructa;
    pen.Color := clblack;
    graphabc.Redraw;
    Brush.Color := CLWHITE;
    pen.Color := cllime;
    window.Caption := 'Фрукты: ' + inttostr(s) + ' из ' + sp + STROKA + inttostr(kolvo) + ' | ваша скорость ' + dd + ' | скорость врага ' + vrag1.d + stroka2;
    pen.Color := clblack;
    if (s = sp) then pobeda;
    
  end;
end;

procedure Moving;
begin
  window.Clear;
  lockdrawing;
  figurafructa;
  vrag1.dvvrag(vrag1, x, y, z, u, tr);
  vrag1.figuravraga(vrag1);
  //if (x >= 5) and (x <= 1340) and (y >= 5) and (y <= 675) then
  if x < 0 then
  begin
    x := window.Width - 20;
    z := x + 20;
  end else
  if (x + 20) > window.Width then
  begin
    x := 1;
    z := x + 20;
  end else
  if y < 0 then
  begin
    y := window.Height - 20;
    u := y + 20;
  end else
  if (y + 20) > window.Height then
  begin
    y := 1;
    u := y + 20;
  end else
  begin
    x := x + dx;
    y := y + dy;
    z := z + dx;
    u := u + dy;
  end;
  figura;
  pen.Color := rgb(0, 0, 0);
  Redraw;
  Brush.Color := CLWHITE;
  pen.Color := cllime;
  window.Caption := 'Фрукты: ' + inttostr(s) + ' из ' + sp + STROKA + inttostr(kolvo) + ' | ваша скорость ' + dd + ' | скорость врага ' + vrag1.d + stroka2;
  pen.Color := clblack;
  if (s = sp) then pobeda;
end;

procedure keydown(key: integer);
begin
  kolvo := kolvo + 1;
  if kolvo mod yv = 0 then
    vrag1.d := vrag1.d + 1;
  
  case key of
    
    VK_a:
      begin
        if (speed mod 2 = 0) then
        begin
          dx := -dd - (s div 5);
          dy := 0;
          moving;
          friuts;
        end else
        begin
          dx := -1;
          dy := 0;
          moving;
          friuts;
        end;
      end;
    
    VK_d:
      begin
        if (speed mod 2 = 0) then
        begin
          dx := dd + (s div 5);
          dy := 0;
          moving;
          friuts;
        end else
        begin
          dx := 1;
          dy := 0;
          moving;
          friuts;
        end;
      end;
    
    VK_w:
      begin
        if (speed mod 2 = 0) then
        begin
          dx := 0;
          dy := -dd - (s div 5);
          moving;
          friuts;
        end
        else begin
          dx := 0;
          dy := -1;
          moving;
          friuts;
        end;
      end;
    
    VK_s:
      begin
        if (speed mod 2
        = 0) then
        begin
          dx := 0;
          dy := dd + (s div 5);
          moving;
          friuts;
        end else
        begin
          dx := 0;
          dy := 1;
          moving;
          friuts;
        end;
      end;
    
    VK_enter: window.Close;
    
    VK_space: speed := speed + 1;
    
    VK_up: begin if s >= 2 then begin s := s - 2; dd := dd + 1; window.Caption := 'Фрукты: ' + inttostr(s) + ' из ' + sp + STROKA + inttostr(kolvo) + ' | ваша скорость ' + dd + ' | скорость врага ' + vrag1.d + stroka2; end; end;
    
    VK_f1:
      begin
        kv := kv + 1;
        window.Clear;
        pen.Color := clblack;
        lockdrawing;
        figurafructa;
        vrag1.figuravraga(vrag1);
        figura;
        redraw;
      end;
    
    VK_controlkey: begin dx := 0; dy := 0; moving; friuts; end;
  
  
  end;
end;

procedure igra;
begin
  tr := true;
  window.Clear;
  onkeydown := keydown;
  randomize;
  kolvo := 0;
  x := 10;
  y := 10;
  z := 30;
  u := 30;
  s := 0;
  dd := 20 - 10;
  vrag1.x := 600;
  vrag1.y := 50;
  vrag1.z := vrag1.x + 40;
  vrag1.u := vrag1.y + 40;
  fx := random(100, dxq - 100);
  fy := random(100, dyq - 100);
  fz := fx + 50;
  fu := fy + 50;
  figura;
  moving;
  figurafructa;
  vrag1.figuravraga(vrag1);
  Brush.Color := CLWHITE;
  pen.Color := cllime;
  window.Caption := 'Фрукты: ' + inttostr(s) + ' из ' + sp + STROKA + inttostr(kolvo) + ' | ваша скорость ' + dd + ' | скорость врага ' + vrag1.d + stroka2;
  pen.Color := clblack;
end;

procedure mousedown(mbx, mby, mb: integer);
begin
  window.Caption := inttostr(mbx) + ' ' + inttostr(mby);
  if tr = false then
  begin
    if (mbx >= 400) and (mbx <= 785) and (mby >= 220) and (mby <= 320) and (mb = 1) then igra
    else
    if (mbx >= 400) and (mbx <= 785) and (mby >= 370) and (mby <= 470) and (mb = 1) then window.Close;
  end;
end;

procedure mousemove(rx, ry, mousebutton: integer);
begin
  if tr = false then
  begin
    if (rx >= 400) and (rx <= 785) and (ry >= 220) and (ry <= 320) then
    begin
      lockdrawing;
      window.Caption := '<ИГРАТЬ>';
      brush.Color := rgb(255, 255, 0);
      pen.Width := 1;
      fillrectangle(400, 320, 785, 220);
      drawrectangle(400, 320, 785, 220);
      pen.Width := 3;
      line(495, 305, 495, 230);
      arc(495, 250, 20, 270, 450);
      line(545, 305, 545, 230);
      line(545, 305, 575, 305);
      line(605, 305, 620, 230);
      line(620, 230, 635, 305);
      line(611, 275, 629, 275);
      line(665, 230, 680, 270);
      line(695, 230, 665, 305);
      redraw;
    end else
    if (rx >= 400) and (rx <= 785) and (ry >= 370) and (ry <= 470) then
    begin
      floodfill(451, 406, rgb(255, 0, 0));
      window.Caption := '<ВЫХОД>';
    end else
    begin
      lockdrawing;
      window.Caption := '< >';
      floodfill(451, 406, rgb(90, 20, 0));
      brush.Color := rgb(125, 125, 40);
      pen.Width := 1;
      fillrectangle(400, 320, 785, 220);
      drawrectangle(400, 320, 785, 220);
      pen.Width := 3;
      line(495, 305, 495, 230);
      arc(495, 250, 20, 270, 450);
      line(545, 305, 545, 230);
      line(545, 305, 575, 305);
      line(605, 305, 620, 230);
      line(620, 230, 635, 305);
      line(611, 275, 629, 275);
      line(665, 230, 680, 270);
      line(695, 230, 665, 305);
      redraw;
    end;
  end;
end;

procedure nachigra;
begin
  window.Clear;
  window.Caption := '<Проведите мышкой по экрану>';
  floodfill(1, 1, clgreen);
  brush.Color := rgb(125, 125, 40);
  fillrectangle(400, 320, 785, 220);
  drawrectangle(400, 320, 785, 220);
  brush.Color := rgb(90, 20, 0);
  fillrectangle(400, 470, 785, 370);
  drawrectangle(400, 470, 785, 370);
  pen.Width := 3;
  line(495, 305, 495, 230);
  arc(495, 250, 20, 270, 450);
  line(545, 305, 545, 230);
  line(545, 305, 575, 305);
  line(605, 305, 620, 230);
  line(620, 230, 635, 305);
  line(611, 275, 629, 275);
  line(665, 230, 680, 270);
  line(695, 230, 665, 305);
  
  line(495, 380, 495, 455);
  line(495, 380, 515, 380);
  line(495, 455, 515, 455);
  line(495, 415, 515, 415);
  line(545, 380, 575, 455);
  line(575, 380, 545, 455);
  line(620, 380, 620, 455);
  line(613, 380, 627, 380);
  line(613, 455, 627, 455);
  line(680, 380, 680, 455);
  line(660, 380, 700, 380);
  
  pen.Width := 5;
  pen.Color := clwhite;
  arc(420 + p + 15, 105, 35, 45, 315);
  line(444 + p + 15, 131, 444 + p + 15, 116);
  line(444 + p + 15, 116, 424 + p + 15, 116);
  
  line(495 + p, 142, 515 + p, 68);
  line(515 + p, 68, 535 + p, 142);
  line(503 + p, 114, 526 + p, 114);
  
  line(575 + p, 68, 575 + p, 142);
  line(575 + p, 68, 600 + p, 142);
  line(600 + p, 142, 625 + p, 68);
  line(625 + p, 68, 625 + p, 142);
  
  line(665 + p, 70, 665 + p, 142);
  line(665 + p, 70, 700 + p, 70);
  line(665 + p, 141, 700 + p, 141);
  line(665 + p, 105, 700 + p, 105);
  
  pen.Width := 1;
  
  line(365 + p, 68, 720 + p, 68);
  line(365 + p, 142, 720 + p, 142);
  
  brush.Color := clwhite;
  
  fillrectangle(13, 688, 104, 666);
  textout(20, 670, 'НАСТРОЙКИ');
  
  pen.Color := clblack;
  
  onmousedown := mousedown;
  onmousemove := mousemove;
end;

begin
  window.Maximize;
  zastavka;
  nachigra();
end.