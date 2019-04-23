function varargout = Maplab(varargin)
% MAPLAB MATLAB code for Maplab.fig
%      MAPLAB, by itself, creates a new MAPLAB or raises the existing
%      singleton*.
%
%      H = MAPLAB returns the handle to a new MAPLAB or the handle to
%      the existing singleton*.
%
%      MAPLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPLAB.M with the given input arguments.
%
%      MAPLAB('Property','Value',...) creates a new MAPLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Maplab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Maplab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Maplab

% Last Modified by GUIDE v2.5 22-Apr-2019 15:02:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Maplab_OpeningFcn, ...
                   'gui_OutputFcn',  @Maplab_OutputFcn, ...
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


% --- Executes just before Maplab is made visible.
function Maplab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Maplab (see VARARGIN)

% Choose default command line output for Maplab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Maplab wait for user response (see UIRESUME)
% uiwait(handles.figure1);

img = imread('sample.png');
imshow(img);

if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
else
    set(handles.calcButton,'Enable','on')
end


% --- Outputs from this function are returned to the command line.
function varargout = Maplab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in startLoc.
function startLoc_Callback(hObject, eventdata, handles)
% hObject    handle to startLoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns startLoc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from startLoc
if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
elseif (strcmp(handles.startLoc.String(handles.startLoc.Value), handles.endLoc.String(handles.endLoc.Value)))
    set(handles.calcButton, 'Enable', 'off')
else
    set(handles.calcButton,'Enable','on')
end

% --- Executes during object creation, after setting all properties.
function startLoc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startLoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in endLoc.
function endLoc_Callback(hObject, eventdata, handles)
% hObject    handle to endLoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns endLoc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from endLoc

if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
elseif (strcmp(handles.startLoc.String(handles.startLoc.Value), handles.endLoc.String(handles.endLoc.Value)))
    set(handles.calcButton, 'Enable', 'off')
else
    set(handles.calcButton,'Enable','on')
end

% --- Executes during object creation, after setting all properties.
function endLoc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endLoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcButton.
function calcButton_Callback(hObject, eventdata, handles)
% hObject    handle to calcButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

assembleGraph(handles)


% --- Executes on button press in shortBox.
function shortBox_Callback(hObject, eventdata, handles)
% hObject    handle to shortBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of shortBox
if handles.shortBox.Value == 1 
    handles.longBox.Value = 0;
    handles.allBox.Value = 0;
end

if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
elseif (strcmp(handles.startLoc.String(handles.startLoc.Value), handles.endLoc.String(handles.endLoc.Value)))
    set(handles.calcButton, 'Enable', 'off')
else
    set(handles.calcButton,'Enable','on')
end

% --- Executes on button press in longBox.
function longBox_Callback(hObject, eventdata, handles)
% hObject    handle to longBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of longBox
if handles.longBox.Value == 1 
    handles.shortBox.Value = 0;
    handles.allBox.Value = 0;
end

if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
elseif (strcmp(handles.startLoc.String(handles.startLoc.Value), handles.endLoc.String(handles.endLoc.Value)))
    set(handles.calcButton, 'Enable', 'off')
else
    set(handles.calcButton,'Enable','on')
end

% --- Executes on slider movement.
function wantSlider_Callback(hObject, eventdata, handles)
% hObject    handle to wantSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function wantSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wantSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in allBox.
function allBox_Callback(hObject, eventdata, handles)
% hObject    handle to allBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of allBox
if handles.allBox.Value == 1 
    handles.shortBox.Value = 0;
    handles.longBox.Value = 0;
end

if((handles.startLoc.Value == 1 || handles.endLoc.Value == 1)&&(handles.longBox.Value == 0 ||handles.shortBox.Value == 0 ||handles.allBox.Value == 0))
    set(handles.calcButton,'Enable','off')
    
else
    set(handles.calcButton,'Enable','on')
end
