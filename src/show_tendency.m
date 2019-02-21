function varargout = show_tendency(varargin)
% SHOW_TENDENCY MATLAB code for show_tendency.fig
%      SHOW_TENDENCY, by itself, creates a new SHOW_TENDENCY or raises the existing
%      singleton*.
%
%      H = SHOW_TENDENCY returns the handle to a new SHOW_TENDENCY or the handle to
%      the existing singleton*.
%
%      SHOW_TENDENCY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_TENDENCY.M with the given input arguments.
%
%      SHOW_TENDENCY('Property','Value',...) creates a new SHOW_TENDENCY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_tendency_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_tendency_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_tendency

% Last Modified by GUIDE v2.5 13-Feb-2019 14:47:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_tendency_OpeningFcn, ...
                   'gui_OutputFcn',  @show_tendency_OutputFcn, ...
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


% --- Executes just before show_tendency is made visible.
function show_tendency_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_tendency (see VARARGIN)

% Choose default command line output for show_tendency
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%%%火势预测
flame_trend=textread('../var/flame.txt','%f','delimiter', ',');
average_flame = mean(flame_trend) ;
forecast_flame = mean(flame_trend(length(flame_trend)-5:length(flame_trend))) ;
if forecast_flame>average_flame
    set(handles.flame,'String','火势有增强趋势');
else
    set(handles.flame,'String','火势已经被控制');
end

%%%烟雾预测
frost_trend=textread('../var/frost.txt','%f','delimiter', ',');
average_frost = mean(frost_trend) ;
forecast_frost = mean(frost_trend(length(frost_trend)-5:length(frost_trend))) ;
if forecast_frost>average_frost
    set(handles.frost,'String','烟雾有变大趋势');
else
    set(handles.frost,'String','烟雾被控制');
end

% UIWAIT makes show_tendency wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_tendency_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function flame_Callback(hObject, eventdata, handles)
% hObject    handle to flame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: get(hObject,'String') returns contents of flame as text
%        str2double(get(hObject,'String')) returns contents of flame as a double


% --- Executes during object creation, after setting all properties.
function flame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frost_Callback(hObject, eventdata, handles)
% hObject    handle to frost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: get(hObject,'String') returns contents of frost as text
%        str2double(get(hObject,'String')) returns contents of frost as a double


% --- Executes during object creation, after setting all properties.
function frost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirm.
function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(show_tendency);
