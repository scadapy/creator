unit Tkinter;

{$mode objfpc}{$H+}

interface
 uses
  Classes, SysUtils, FileUtil, RTTIGrids, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, EditBtn, ValEdit, LCLType, ExtDlgs, Menus,
  ComCtrls;

procedure createTkinterPython();
implementation

uses PropertyForm,scadapy,linkForm,cmdprocedure,editor;

procedure createTkinterPython();
var
  i,j,rowCount,cl:Integer;
  AllData,orient:String;
begin
  // editor.EditorForm.
  editor.EditorForm.MemoSave.Clear;
  editor.EditorForm.MemoSave.Lines.Add('# -*- coding: utf-8 -*-');
  editor.EditorForm.MemoSave.Lines.Add('###########################################################################');


  editor.EditorForm.MemoSave.Lines.Add('## Python code generated with '+scadapy.Version+' '+ DateToStr(Date())+' ');


  editor.EditorForm.MemoSave.Lines.Add('## UDP server Tk-inter by Jack Mas');
  editor.EditorForm.MemoSave.Lines.Add('## http://scadapy.ln-group.ru/');
  editor.EditorForm.MemoSave.Lines.Add('##');
  editor.EditorForm.MemoSave.Lines.Add('## PLEASE DO ALL YOU NEED THIS FILE!');
  editor.EditorForm.MemoSave.Lines.Add('########################################################################### ');

  editor.EditorForm.MemoSave.Lines.Add('import sys');
  editor.EditorForm.MemoSave.Lines.Add('import os');
  editor.EditorForm.MemoSave.Lines.Add('import time');
  editor.EditorForm.MemoSave.Lines.Add('import datetime');
  editor.EditorForm.MemoSave.Lines.Add('import gc');
  editor.EditorForm.MemoSave.Lines.Add('from tkinter import *');
  editor.EditorForm.MemoSave.Lines.Add('import json');
  editor.EditorForm.MemoSave.Lines.Add('from datetime import datetime');
  editor.EditorForm.MemoSave.Lines.Add('from enum import Enum, IntEnum');
  editor.EditorForm.MemoSave.Lines.Add('import uuid');
  editor.EditorForm.MemoSave.Lines.Add('import socket');
  editor.EditorForm.MemoSave.Lines.Add('import struct');
  editor.EditorForm.MemoSave.Lines.Add('import threading');

  editor.EditorForm.MemoSave.Lines.Add('def PBarC(nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient):');
  editor.EditorForm.MemoSave.Lines.Add('     c = Canvas(root,width=widgLen,height=widgHigh,bg=canvasColor, highlightthickness=0, relief=''ridge'')');
  editor.EditorForm.MemoSave.Lines.Add('     c.place(x=x, y=y)');
  editor.EditorForm.MemoSave.Lines.Add('     ar=c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient');
  editor.EditorForm.MemoSave.Lines.Add('     if(orient==''pbHorizontal''):');
  editor.EditorForm.MemoSave.Lines.Add('         PBar(ar)');
  editor.EditorForm.MemoSave.Lines.Add('     if(orient==''pbVertical''):');
  editor.EditorForm.MemoSave.Lines.Add('         PBar(ar)');
  editor.EditorForm.MemoSave.Lines.Add('     return [c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient]');

  editor.EditorForm.MemoSave.Lines.Add('def PBar(arrayData):');
  editor.EditorForm.MemoSave.Lines.Add('     c,nowValue,x,y,widgLen,widgHigh,maxValue,barColor,canvasColor,orient=arrayData ');
  editor.EditorForm.MemoSave.Lines.Add('     c.delete("all")');
  editor.EditorForm.MemoSave.Lines.Add('     if(orient==''pbHorizontal''):');
  editor.EditorForm.MemoSave.Lines.Add('         if(nowValue > maxValue): nowValue=maxValue-1 ');
  editor.EditorForm.MemoSave.Lines.Add('         devValue=float(widgLen) / float(maxValue)');
  editor.EditorForm.MemoSave.Lines.Add('         mesureValue = devValue * nowValue');
  editor.EditorForm.MemoSave.Lines.Add('         c.create_rectangle(0,0,int(mesureValue),widgHigh,fill=barColor,outline=barColor)');
  editor.EditorForm.MemoSave.Lines.Add('         c.create_text(widgLen/2 -10,widgHigh-9,font="Arial 12",anchor="w",justify=CENTER,fill=''black'',text=str(nowValue)) ');
  editor.EditorForm.MemoSave.Lines.Add('     if(orient==''pbVertical''):');
  editor.EditorForm.MemoSave.Lines.Add('         if(nowValue > maxValue): nowValue=maxValue-1');
  editor.EditorForm.MemoSave.Lines.Add('         devValue=float(widgHigh) / float(maxValue)');
  editor.EditorForm.MemoSave.Lines.Add('         mesureValue = devValue * nowValue');
  editor.EditorForm.MemoSave.Lines.Add('         c.create_rectangle(widgLen,widgHigh,0,widgHigh-int(mesureValue),fill=barColor,outline=barColor)');
 // editor.EditorForm.MemoSave.Lines.Add('         c.create_text(widgLen/3,widgHigh/2,font="Verdana 12",anchor="w",justify=CENTER,fill=''black'',text=str(nowValue))');

  editor.EditorForm.MemoSave.Lines.Add('def TEditObject(x,y,w,h,fontName,colorName,fillName,valueVar):');
  editor.EditorForm.MemoSave.Lines.Add('     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline=fillName)');
  editor.EditorForm.MemoSave.Lines.Add('     aiFig=canv.create_text(x+5,y+(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)');
  editor.EditorForm.MemoSave.Lines.Add('     return aiFig');
  editor.EditorForm.MemoSave.Lines.Add('def TLabelObject(x,y,w,h,fontName,colorName,fillName,valueVar):');
  editor.EditorForm.MemoSave.Lines.Add('     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline=fillName)');
  editor.EditorForm.MemoSave.Lines.Add('     aiFig=canv.create_text(x,y+(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)');
  editor.EditorForm.MemoSave.Lines.Add('def TStaticTextObject(x,y,w,h,fontName,colorName,fillName,valueVar):');
  editor.EditorForm.MemoSave.Lines.Add('     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName,outline=''black'')');
  editor.EditorForm.MemoSave.Lines.Add('     aiFig=canv.create_text(x+5,y+h-(h/2),text=valueVar,font=fontName,anchor="w",justify=CENTER,fill=colorName)');
  editor.EditorForm.MemoSave.Lines.Add('def TDiscretObject(x,y,w,h,fillName):');
  editor.EditorForm.MemoSave.Lines.Add('     diFig=canv.create_rectangle(x,y,x+w,y+h,fill=fillName)');
  editor.EditorForm.MemoSave.Lines.Add('     return diFig');
  editor.EditorForm.MemoSave.Lines.Add('def SelectData(getData):');
  rowCount:=scadapy.MainFrame.GVarTree.RowCount;
        for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   editor.EditorForm.MemoSave.Lines.Add('     global '+scadapy.MainFrame.GVarTree.Cells[2, j]);
           end;
        editor.EditorForm.MemoSave.Lines.Add('     global AllData');
        for j:=1 to rowCount-1 do
          begin
              if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  then
                begin
                   editor.EditorForm.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=setVariables('+scadapy.MainFrame.GVarTree.Cells[2, j]+',getData,'''+scadapy.MainFrame.GVarTree.Cells[1, j]+''','''+scadapy.MainFrame.GVarTree.Cells[2, j]+''','''+scadapy.MainFrame.GVarTree.Cells[3, j]+''','''+scadapy.MainFrame.GVarTree.Cells[4, j]+''','''+scadapy.MainFrame.GVarTree.Cells[5, j]+''','''+scadapy.MainFrame.GVarTree.Cells[6, j]+''','''+scadapy.MainFrame.GVarTree.Cells[7,j]+''')');
                AllData:=AllData+scadapy.MainFrame.GVarTree.Cells[2, j]+','
                end;
          end;

        editor.EditorForm.MemoSave.Lines.Add('     AllData=['+AllData+']');


        editor.EditorForm.MemoSave.Lines.Add('def setVariables(mVar,getData,var1,var2,var3,var4,var5,var6,var7):');
        editor.EditorForm.MemoSave.Lines.Add('     try:');
        editor.EditorForm.MemoSave.Lines.Add('         x=getVariables(getData,var1,var2,var3,var4,var5,var6,var7)');
        editor.EditorForm.MemoSave.Lines.Add('         if(x!=None):');
        editor.EditorForm.MemoSave.Lines.Add('             mVar=x ');
        editor.EditorForm.MemoSave.Lines.Add('         else:');
        editor.EditorForm.MemoSave.Lines.Add('             mVar=mVar');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         pass');
        editor.EditorForm.MemoSave.Lines.Add('     return(mVar)');

        editor.EditorForm.MemoSave.Lines.Add('#-----------------------------------------------------------------------------------');
        editor.EditorForm.MemoSave.Lines.Add('def getVariables(getData,source,varName,address,count,sequence,dataType,multiply):');
        editor.EditorForm.MemoSave.Lines.Add('     varData=None');
        editor.EditorForm.MemoSave.Lines.Add('     if(json.loads( getData.decode("utf-8") )[''name''] == source):');
        editor.EditorForm.MemoSave.Lines.Add('         temp=json.loads( getData.decode("utf-8") )[''data'']');
        editor.EditorForm.MemoSave.Lines.Add('         if(temp!=''Error''):');
        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''float''):');

        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''1''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2=temp[int(address)]');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=round(float(temp2),2) ');



        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''2''): ');
        editor.EditorForm.MemoSave.Lines.Add('                     if(sequence==''12''):');
        editor.EditorForm.MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)])<<16)+int(temp[int(address)+1])),16))))');
        editor.EditorForm.MemoSave.Lines.Add('                         varData=temp2[0]');
        editor.EditorForm.MemoSave.Lines.Add('                     if(sequence==''21''):');
        editor.EditorForm.MemoSave.Lines.Add('                         temp2=(struct.unpack(''f'',struct.pack(''i'',int(hex(int(int(temp[int(address)+1])<<16)+int(temp[int(address)])),16))))');
        editor.EditorForm.MemoSave.Lines.Add('                         varData=temp2[0]');
        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''integer''):');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''1''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2=int(temp[int(address)])');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2= (int(temp[int(address)])<<16) + int(temp[int(address)+1])');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2=(int(temp[int(address)+1])<<16) + int(temp[int(address)]) ');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');

        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''intSigned''):');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''1''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2=(int(temp[int(address)]) + 2**15) % 2**16 - 2**15');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''12''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2= ((int(temp[int(address)])<<16) + int(temp[int(address)+1]) + 2**31) % 2**32 - 2**31');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('                 if(count==''2'' and sequence==''21''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2= ((int(temp[int(address)+1])<<16) + int(temp[int(address)]) + 2**31) % 2**32 - 2**31 ');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');


        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''bool''):');
        editor.EditorForm.MemoSave.Lines.Add('                     if(int(temp[int(address)]) > 0):');
        editor.EditorForm.MemoSave.Lines.Add('                         temp2=1');
        editor.EditorForm.MemoSave.Lines.Add('                     if(int(temp[int(address)]) == 0):');
        editor.EditorForm.MemoSave.Lines.Add('                         temp2=0');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''string''):');
        editor.EditorForm.MemoSave.Lines.Add('                     temp2=temp[ int(address)]');
        editor.EditorForm.MemoSave.Lines.Add('                     varData=temp2');
        editor.EditorForm.MemoSave.Lines.Add('             try:');
        editor.EditorForm.MemoSave.Lines.Add('                 mult=int(multiply)');
        editor.EditorForm.MemoSave.Lines.Add('             except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('                 mult=float(multiply)');
        editor.EditorForm.MemoSave.Lines.Add('             if(dataType==''integer'' or dataType==''float''):');
        editor.EditorForm.MemoSave.Lines.Add('                 varData=round(varData*mult,2)');

        editor.EditorForm.MemoSave.Lines.Add('             returnData=varData');
        editor.EditorForm.MemoSave.Lines.Add('             return returnData');
        editor.EditorForm.MemoSave.Lines.Add('         else:');
        editor.EditorForm.MemoSave.Lines.Add('             varData=''Error''');
        editor.EditorForm.MemoSave.Lines.Add('             return varData');
        editor.EditorForm.MemoSave.Lines.Add('     else:');
        editor.EditorForm.MemoSave.Lines.Add('         return None');
        editor.EditorForm.MemoSave.Lines.Add('def initDI(diName,diHandle):');
        editor.EditorForm.MemoSave.Lines.Add('     if(diName==0): ');
        editor.EditorForm.MemoSave.Lines.Add('          canv.itemconfig(diHandle,fill="lime")');
        editor.EditorForm.MemoSave.Lines.Add('     else:');
        editor.EditorForm.MemoSave.Lines.Add('          canv.itemconfig(diHandle,fill="red") ');
        editor.EditorForm.MemoSave.Lines.Add('def setDI(getData):');
        editor.EditorForm.MemoSave.Lines.Add('     try:');
        for j:=1 to rowCount-1 do
                 begin
                     if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and
                       (scadapy.MainFrame.GVarTree.Cells[6, j]='bool') and
                       (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  then
                       begin

                               editor.EditorForm.MemoSave.Lines.Add('         if(json.loads(getData.decode("utf-8") )[''name''] == '''+scadapy.MainFrame.GVarTree.Cells[1, j]+'''):');
                               editor.EditorForm.MemoSave.Lines.Add('             try:');
                               editor.EditorForm.MemoSave.Lines.Add('                 if(json.loads(getData.decode("utf-8") )[''con''][0]==1 or json.loads(getData.decode("utf-8") )[''q''][0]==0 ):');
                               editor.EditorForm.MemoSave.Lines.Add('                     initDI('+scadapy.MainFrame.GVarTree.Cells[2, j]+',h'+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                               editor.EditorForm.MemoSave.Lines.Add('                 else: ');
                               editor.EditorForm.MemoSave.Lines.Add('                     canv.itemconfig(h'+scadapy.MainFrame.GVarTree.Cells[2, j]+',fill="yellow")');
                               editor.EditorForm.MemoSave.Lines.Add('                 pass');
                               editor.EditorForm.MemoSave.Lines.Add('             except Exception as e:');
                               editor.EditorForm.MemoSave.Lines.Add('                pass');

                       end;
                 end;
        editor.EditorForm.MemoSave.Lines.Add('         pass');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         pass');


        editor.EditorForm.MemoSave.Lines.Add('def setAI(getData):');
        editor.EditorForm.MemoSave.Lines.Add('     try:');
        for j:=1 to rowCount-1 do
                 begin
                     if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and
                       (scadapy.MainFrame.GVarTree.Cells[6, j]<>'bool') and
                       (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  then
                       begin
                               editor.EditorForm.MemoSave.Lines.Add('         if(json.loads(getData.decode("utf-8") )[''name''] == '''+scadapy.MainFrame.GVarTree.Cells[1, j]+'''):');
                               editor.EditorForm.MemoSave.Lines.Add('             try:');
                               editor.EditorForm.MemoSave.Lines.Add('                  if(json.loads(getData.decode("utf-8") )[''con''][0]==1 or json.loads(getData.decode("utf-8") )[''q''][0]==0 ):');
                               editor.EditorForm.MemoSave.Lines.Add('                         canv.itemconfig(h'+scadapy.MainFrame.GVarTree.Cells[2, j]+',text='+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                               editor.EditorForm.MemoSave.Lines.Add('                  else: ');
                               editor.EditorForm.MemoSave.Lines.Add('                         canv.itemconfig(h'+scadapy.MainFrame.GVarTree.Cells[2, j]+',text=''---'')');


//                               editor.EditorForm.MemoSave.Lines.Add('                 canv.itemconfig(h'+scadapy.MainFrame.GVarTree.Cells[2, j]+',text=''---'')');
                               editor.EditorForm.MemoSave.Lines.Add('                  pass');
                               editor.EditorForm.MemoSave.Lines.Add('             except Exception as e:');
                               editor.EditorForm.MemoSave.Lines.Add('                 pass');


                       end;
                 end;
        editor.EditorForm.MemoSave.Lines.Add('         pass');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         pass');
        editor.EditorForm.MemoSave.Lines.Add('def setPBarMeter(getData):');
        editor.EditorForm.MemoSave.Lines.Add('     try:');
               for j:=1 to rowCount-1 do
                        begin
                            if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) and
                              (scadapy.MainFrame.GVarTree.Cells[6, j]<>'bool') and
                              (Length(scadapy.MainFrame.GVarTree.Cells[1, j])>0)  then
                              begin
                               editor.EditorForm.MemoSave.Lines.Add('         if(json.loads(getData.decode("utf-8") )[''name''] == '''+scadapy.MainFrame.GVarTree.Cells[1, j]+'''):');
                               editor.EditorForm.MemoSave.Lines.Add('              try:');
                               editor.EditorForm.MemoSave.Lines.Add('                   m'+scadapy.MainFrame.GVarTree.Cells[2, j]+'[1]='+scadapy.MainFrame.GVarTree.Cells[2, j]);
                               editor.EditorForm.MemoSave.Lines.Add('                   PBar(m'+scadapy.MainFrame.GVarTree.Cells[2, j]+')');
                               editor.EditorForm.MemoSave.Lines.Add('                   pass');
                               editor.EditorForm.MemoSave.Lines.Add('              except Exception as e:');
                               editor.EditorForm.MemoSave.Lines.Add('                   pass');
                               end;
                         end;
        editor.EditorForm.MemoSave.Lines.Add('         pass');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         pass');

        editor.EditorForm.MemoSave.Lines.Add('def udpserv(i=1):');
        editor.EditorForm.MemoSave.Lines.Add('     global udpdata ');
        editor.EditorForm.MemoSave.Lines.Add('     try:');
        editor.EditorForm.MemoSave.Lines.Add('         sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)');
        editor.EditorForm.MemoSave.Lines.Add('         server_address = ('''+editor.EditorForm.UDPIP.Text+''','+editor.EditorForm.UDPPort.Text+')');
        editor.EditorForm.MemoSave.Lines.Add('         print(''starting up on {} port {}''.format(*server_address))');
        editor.EditorForm.MemoSave.Lines.Add('         sock.bind(server_address)');
        editor.EditorForm.MemoSave.Lines.Add('         while True:');
        editor.EditorForm.MemoSave.Lines.Add('             data, address = sock.recvfrom(4096)');
        editor.EditorForm.MemoSave.Lines.Add('             udpdata=data');
        editor.EditorForm.MemoSave.Lines.Add('             print(''Get '',udpdata)');
        editor.EditorForm.MemoSave.Lines.Add('             try:');
        editor.EditorForm.MemoSave.Lines.Add('                 SelectData(udpdata)');
        editor.EditorForm.MemoSave.Lines.Add('                 setDI(udpdata)');
        editor.EditorForm.MemoSave.Lines.Add('                 setAI(udpdata)');
        editor.EditorForm.MemoSave.Lines.Add('                 setPBarMeter(udpdata)');
        editor.EditorForm.MemoSave.Lines.Add('             except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('                 print(e)');
        editor.EditorForm.MemoSave.Lines.Add('                 pass');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         print(e)');

        editor.EditorForm.MemoSave.Lines.Add('if __name__ == "__main__":');
        editor.EditorForm.MemoSave.Lines.Add('     root = Tk()');
        editor.EditorForm.MemoSave.Lines.Add('     root.title("'+scadapy.Version+' '+ scadapy.ProjectName+'") ');
        editor.EditorForm.MemoSave.Lines.Add('     if(os.name==''nt''): root.state("zoomed")  ');
        editor.EditorForm.MemoSave.Lines.Add('     else:  root.state("normal")');
        editor.EditorForm.MemoSave.Lines.Add('     root["bg"] = "white" ');
        editor.EditorForm.MemoSave.Lines.Add('     canv = Canvas(root,width='''+screen.Width.ToString+''',height='''+
                                                                                screen.Height.ToString+''',bg="'+
                                                                                editor.EditorForm.findColor(editor.EditorForm.MainCanvas.Color)+
                                                                                '",bd=0, highlightthickness=0, relief=''ridge'')');





        editor.EditorForm.MemoSave.Lines.Add('     canv.place(x=0, y=0)');
        editor.EditorForm.MemoSave.Lines.Add('     try: ');
{$IFDEF Windows}
        editor.EditorForm.MemoSave.Lines.Add('         im = PhotoImage(file='''+StringReplace(editor.EditorForm.ImageName,'\','\\',[rfReplaceAll])+''')');
        editor.EditorForm.MemoSave.Lines.Add('         canv.create_image(1, 1,anchor=NW, image=im) ');
{$ENDIF Windows}
{$IFDEF Unix}
  editor.EditorForm.MemoSave.Lines.Add('         im = PhotoImage(file='''+editor.EditorForm.ImageName+''')');
  editor.EditorForm.MemoSave.Lines.Add('         canv.create_image(1, 1,anchor=NW, image=im) ');

{$ENDIF Unix}

       editor.EditorForm.MemoSave.Lines.Add('     except:  ');
       editor.EditorForm.MemoSave.Lines.Add('         pass ');

  for j:=1 to rowCount-1 do
           begin
             if(Length(scadapy.MainFrame.GVarTree.Cells[2, j])>0) then
                   editor.EditorForm.MemoSave.Lines.Add('     '+scadapy.MainFrame.GVarTree.Cells[2, j]+'=''''');
           end;


  for i:=0 to 999 do
     if(editor.EditorForm.PBarObject[i]<>nil) and  (editor.EditorForm.PBarObject[i].Visible=True) then
     begin
         case editor.EditorForm.PBarObject[i].Orientation of
           pbVertical      : orient := 'pbVertical';
           pbHorizontal    : orient := 'pbHorizontal';
         else
           orient := 'pbHorizontal';
         end;
      editor.EditorForm.MemoSave.Lines.Add('     m'+editor.EditorForm.PBarObject[i].Name+'=PBarC(0,'+editor.EditorForm.PBarObject[i].Left.ToString+','+
                                            (editor.EditorForm.PBarObject[i].Top - editor.EditorForm.MainCanvas.Top).ToString+','+
                                             editor.EditorForm.PBarObject[i].Width.ToString+','+
                                             editor.EditorForm.PBarObject[i].Height.ToString+','+
                                             editor.EditorForm.PBarObject[i].Max.ToString+','''+
                                             editor.EditorForm.findColor(editor.EditorForm.PBarObject[i].Color)+''','''+
                                             editor.EditorForm.findColor(editor.EditorForm.PBarObject[i].Font.Color)+''','''+
                                             orient+''')');
     end;
     for i:=0 to 999 do
       if(editor.EditorForm.EditObject[i]<>nil) and  (editor.EditorForm.EditObject[i].Visible=True) then
       begin
         editor.EditorForm.MemoSave.Lines.Add('     h'+editor.EditorForm.EditObject[i].Caption+'=TEditObject('+editor.EditorForm.EditObject[i].Left.ToString+','+
                                              (editor.EditorForm.EditObject[i].Top - editor.EditorForm.MainCanvas.Top).ToString+','+
                                              editor.EditorForm.EditObject[i].Width.ToString+','+
                                              editor.EditorForm.EditObject[i].Height.ToString+',"'+
                                              editor.EditorForm.EditObject[i].Font.Name+' '+
                                              editor.EditorForm.EditObject[i].Font.Size.ToString +'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.EditObject[i].Font.Color)+'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.EditObject[i].Color)+'","---")');
                                            //  editor.EditorForm.EditObject[i].Text+'")');
       end;

    for i:=0 to 999 do
       if(editor.EditorForm.LabelObject[i]<>nil) and  (editor.EditorForm.LabelObject[i].Visible=True) then
       begin
          editor.EditorForm.MemoSave.Lines.Add('     TLabelObject('+editor.EditorForm.LabelObject[i].Left.ToString+','+
                                              (editor.EditorForm.LabelObject[i].Top - editor.EditorForm.MainCanvas.Top).ToString+','+
                                              editor.EditorForm.LabelObject[i].Width.ToString+','+
                                              editor.EditorForm.LabelObject[i].Height.ToString+',"'+
                                              editor.EditorForm.LabelObject[i].Font.Name+' '+
                                              editor.EditorForm.LabelObject[i].Font.Size.ToString +'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.LabelObject[i].Font.Color)+'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.LabelObject[i].Color)+'","'+
                                              editor.EditorForm.LabelObject[i].Caption+'")');
       end;

     for i:=0 to 999 do
       if(editor.EditorForm.StaticTextObject[i]<>nil) and  (editor.EditorForm.StaticTextObject[i].Visible=True) then
       begin
          editor.EditorForm.MemoSave.Lines.Add('     TStaticTextObject('+editor.EditorForm.StaticTextObject[i].Left.ToString+','+
                                              (editor.EditorForm.StaticTextObject[i].Top - editor.EditorForm.MainCanvas.Top).ToString+','+
                                              editor.EditorForm.StaticTextObject[i].Width.ToString+','+
                                              editor.EditorForm.StaticTextObject[i].Height.ToString+',"'+
                                              editor.EditorForm.StaticTextObject[i].Font.Name+' '+
                                              editor.EditorForm.StaticTextObject[i].Font.Size.ToString +'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.StaticTextObject[i].Font.Color)+'","'+
                                              editor.EditorForm.findColor(editor.EditorForm.StaticTextObject[i].Color)+'","'+
                                              editor.EditorForm.StaticTextObject[i].Caption+'")');
       end;

     for i:=0 to 999 do
       if(editor.EditorForm.DiscretObject[i]<>nil) and  (editor.EditorForm.DiscretObject[i].Visible=True) then
       begin
         editor.EditorForm.MemoSave.Lines.Add('     h'+editor.EditorForm.DiscretObject[i].Caption+'=TDiscretObject('+
                                               editor.EditorForm.DiscretObject[i].Left.ToString+','+
                                              (editor.EditorForm.DiscretObject[i].Top - editor.EditorForm.MainCanvas.Top).ToString+','+
                                              editor.EditorForm.DiscretObject[i].Width.ToString+','+
                                              editor.EditorForm.DiscretObject[i].Height.ToString+',"yellow")');
                                             // editor.EditorForm.findColor(editor.EditorForm.DiscretObject[i].Color)+'")');
       end;



        editor.EditorForm.MemoSave.Lines.Add('     AllData=''''');
        editor.EditorForm.MemoSave.Lines.Add('     try: ');
        editor.EditorForm.MemoSave.Lines.Add('         print( ''Starting tkinter server...'')');
        editor.EditorForm.MemoSave.Lines.Add('         modb = threading.Thread(target=udpserv,args=(1,)) ');
        editor.EditorForm.MemoSave.Lines.Add('         modb.daemon = True');
        editor.EditorForm.MemoSave.Lines.Add('         modb.start()');
        editor.EditorForm.MemoSave.Lines.Add('     except Exception as e:');
        editor.EditorForm.MemoSave.Lines.Add('         print(e)');
        editor.EditorForm.MemoSave.Lines.Add('     global hendl');
        editor.EditorForm.MemoSave.Lines.Add('     hendl=False');
        editor.EditorForm.MemoSave.Lines.Add('     root.mainloop()');

   try
    editor.EditorForm.MemoSave.Lines.SaveToFile(scadapy.ProjectPath+'tkrun.py');
   except
      ShowMessage('Error to save');
   end;
   // cmdprocedure.StartCommandW('tkrun.pyw');
     cmdprocedure.StartCommand('tkrun.py');
end;


end.

