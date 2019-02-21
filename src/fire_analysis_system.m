function varargout = fire_analysis_system(varargin)
% FIRE_ANALYSIS_SYSTEM MATLAB code for fire_analysis_system.fig
%      FIRE_ANALYSIS_SYSTEM, by itself, creates a new FIRE_ANALYSIS_SYSTEM or raises the existing
%      singleton*.
%
%      H = FIRE_ANALYSIS_SYSTEM returns the handle to a new FIRE_ANALYSIS_SYSTEM or the handle to
%      the existing singleton*.
%
%      FIRE_ANALYSIS_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRE_ANALYSIS_SYSTEM.M with the given input arguments.
%
%      FIRE_ANALYSIS_SYSTEM('Property','Value',...) creates a new FIRE_ANALYSIS_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fire_analysis_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fire_analysis_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fire_analysis_system

% Last Modified by GUIDE v2.5 13-Feb-2019 19:33:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fire_analysis_system_OpeningFcn, ...
                   'gui_OutputFcn',  @fire_analysis_system_OutputFcn, ...
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


% --- Executes just before fire_analysis_system is made visible.
function fire_analysis_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fire_analysis_system (see VARARGIN)

% Choose default command line output for fire_analysis_system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes fire_analysis_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fire_analysis_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
welcome;



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run main.m
close(during_the_analysis);
end_of_analysis;
flame_number=textread('../var/frame_number.txt','%d');
for i = 1:flame_number
    axes(handles.original_flame);
    imshow([original_flame_Path num2str(i) '.jpg']);
    axes(handles.processed_flame)
    imshow([processed_flame_Path num2str(i) '.jpg']);
    axes(handles.processed_frost_original)
    imshow([processed_frost_Path num2str(i) '.jpg']);
    pause(0.01);
end


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close_system;


% --- Executes on button press in tendency.
function tendency_Callback(hObject, eventdata, handles)
% hObject    handle to tendency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_tendency;


% --- Executes on button press in show_video.
function show_video_Callback(hObject, eventdata, handles)
% hObject    handle to show_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_result;


% --- Executes during object creation, after setting all properties.
function flame_tendency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flame_tendency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate flame_tendency


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function conduct_Callback(hObject, eventdata, handles)
% hObject    handle to conduct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run main.m
close(during_the_analysis);
end_of_analysis;
flame_number=textread('../var/frame_number.txt','%d');
for i = 1:flame_number
    axes(handles.original_flame);
    imshow([original_flame_Path num2str(i) '.jpg']);
    axes(handles.processed_flame)
    imshow([processed_flame_Path num2str(i) '.jpg']);
    axes(handles.processed_frost_original)
    imshow([processed_frost_Path num2str(i) '.jpg']);
    pause(0.01);
end


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function close_win_Callback(hObject, eventdata, handles)
% hObject    handle to close_win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close_system;


% --------------------------------------------------------------------
function guide_Callback(hObject, eventdata, handles)
% hObject    handle to guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidebook;


% --------------------------------------------------------------------
function introduction_Callback(hObject, eventdata, handles)
% hObject    handle to introduction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
introduction;


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function author_Callback(hObject, eventdata, handles)
% hObject    handle to author (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
author;


% --------------------------------------------------------------------
function version_Callback(hObject, eventdata, handles)
% hObject    handle to version (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
released_ID;


% --------------------------------------------------------------------
function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function show_result_Callback(hObject, eventdata, handles)
% hObject    handle to show_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_result;


% --------------------------------------------------------------------
function show_tendency_Callback(hObject, eventdata, handles)
% hObject    handle to show_tendency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
show_tendency;
