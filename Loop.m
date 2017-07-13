function varargout = Loop(varargin)
% Loop MATLAB code for Loop.fig
%      Loop, by itself, creates a new Loop or raises the existing
%      singleton*.
%
%      H = Loop returns the handle to a new Loop or the handle to
%      the existing singleton*.
%
%      Loop('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Loop.M with the given input arguments.
%
%      Loop('Property','Value',...) creates a new Loop or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Loop_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Loop_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Loop

% Last Modified by GUIDE v2.5 14-Jun-2017 17:28:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Loop_OpeningFcn, ...
                   'gui_OutputFcn',  @Loop_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end





% End initialization code - DO NOT EDIT



% --- Executes just before Loop is made visible.
function Loop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Loop (see VARARGIN)

% Choose default command line output for Loop
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using Loop.
%if strcmp(get(hObject,'Visible'),'off')
 %   plot(rand(5));
%end


[a b c d e]=textread('D:\Program Files\NanoScope\9.1\Relaxor_settings.txt','%f %f %f %f %f',1)
set(handles.edit1, 'String', (b));
set(handles.edit2, 'String', (c));
set(handles.edit3, 'String', (d));
set(handles.edit6, 'String', (e));
% UIWAIT makes Loop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Loop_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    clc    
    handles.timer = timer('ExecutionMode','fixedRate',...
                        'Period', 0.1,...
                        'TimerFcn', {@GUIUpdate,handles});
    handles.output = hObject;
    guidata(hObject, handles);
    start(handles.timer)
   % axes(handles.axes1);
   % cla;

   %   popup_sel_index = get(handles.popupmenu1, 'Value');
   % switch popup_sel_index
     %   case 1
    %        plot(rand(5));
            
    

function GUIUpdate(obj,event,handles)
% timerfcn for the timer.  If figure is deleted, so is timer.

    global Res;
    %cla;
    clc;
    filename = 'D:\Program Files\NanoScope\9.1\Relaxor.txt';
    A = importdata(filename);
    Res=A;
    plot(handles.axes1,A(:,1),A(:,2),'-r');drawnow;
    loglog(handles.axes2,A(:,1),A(:,2),'-r');drawnow;
%     tf = iscell(A);
%     if tf~=1
%         siz=size(A);
%         sizR=size(Res);
%         if sizR(1)==0
%             Res=A;
%         else
%             if siz(1)~=0
%                 if A(:,1)~=Res(sizR(1),1)
%                     Res(sizR(1)+1,1)=A(:,1);
%                     Res(sizR(1)+1,2)=A(:,2);
%                     Res(sizR(1)+1,3)=A(:,3);
%                     plot(handles.axes1,Res(:,1),Res(:,2),'-r');drawnow;
%                     plot(handles.axes2,Res(:,1),Res(:,3),'-r');drawnow;
%                 end
%             end
%         end
%     end    

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.timer)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileID = fopen('D:\Program Files\NanoScope\9.1\Relaxor_settings.txt','w');
fprintf(fileID,'%1.0f\t%3.3f\t%3.3f\t%3.3f\t%3.3fn',1,8,0.05,0.1,0.1);
fclose(fileID);
pause(1)
fileID = fopen('D:\Program Files\NanoScope\9.1\Relaxor_settings.txt','w');
fprintf(fileID,'%1.0f\t%3.3f\t%3.3f\t%3.3f\t%3.3f\n',0,8,0.05,0.1,0.1);
fclose(fileID);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
max_v=str2num(get(handles.edit1, 'string'));
step_V=str2num(get(handles.edit2, 'string'));
pulse_time=str2num(get(handles.edit3, 'string'));
wait_time=str2num(get(handles.edit6, 'string'));
fileID = fopen('D:\Program Files\NanoScope\9.1\Relaxor_settings.txt','w');
fprintf(fileID,'%1.0f\t%1.0f\t%3.3f\t%3.3f\t%3.3f\n',0,0,pulse_time,wait_time,max_v);
fclose(fileID);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Res;
Res=[];


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Res;
k=get(handles.FolderPath, 'string');
max_v=(get(handles.edit1, 'string'));
pulse_time=(get(handles.edit3, 'string'));
s = strcat(k,'P', max_v,'VT',pulse_time,'S.txt');
save(s,'Res','-ascii');



function FolderPath_Callback(hObject, eventdata, handles)
% hObject    handle to FolderPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FolderPath as text
%        str2double(get(hObject,'String')) returns contents of FolderPath as a double


% --- Executes during object creation, after setting all properties.
function FolderPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FolderPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.timer);
max_v=str2num(get(handles.edit1, 'string'));
step_V=str2num(get(handles.edit2, 'string'));
pulse_time=str2num(get(handles.edit3, 'string'));
wait_time=str2num(get(handles.edit6, 'string'));
fileID = fopen('D:\Program Files\NanoScope\9.1\Relaxor_settings.txt','w');
fprintf(fileID,'%1.0f\t%1.0f\t%3.3f\t%3.3f\t%3.3f\n',0,1,pulse_time,wait_time,max_v);
fclose(fileID);
pause(10);
handles.timer = timer('ExecutionMode','fixedRate',...
                        'Period', 0.1,...
                        'TimerFcn', {@GUIUpdate,handles});
    handles.output = hObject;
    guidata(hObject, handles);
    start(handles.timer);


% --- Executes on key press with focus on pushbutton13 and none of its controls.
function pushbutton13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)