function varargout = deNoise(varargin)
% DENOISE MATLAB code for deNoise.fig
%      DENOISE, by itself, creates a new DENOISE or raises the existing
%      singleton*.
%
%      H = DENOISE returns the handle to a new DENOISE or the handle to
%      the existing singleton*.
%
%      DENOISE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DENOISE.M with the given input arguments.
%
%      DENOISE('Property','Value',...) creates a new DENOISE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before deNoise_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to deNoise_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help deNoise

% Last Modified by GUIDE v2.5 18-Oct-2018 22:22:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deNoise_OpeningFcn, ...
                   'gui_OutputFcn',  @deNoise_OutputFcn, ...
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


% --- Executes just before deNoise is made visible.
function deNoise_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to deNoise (see VARARGIN)

% Choose default command line output for deNoise
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes deNoise wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = deNoise_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function openFile_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.*','Choose Image');
Img=imread([pathname filename]);

axes(handles.axes1);
imshow(Img);
axes(handles.axes3);
histogram(Img);

handles.ImgOri=Img;
resSTR=sprintf(recogImg(Img));
set(handles.RsltSTR,'String',resSTR);

if(resSTR=='gaussian')
    ResImg=DCTfunc(Img);
    set(handles.mthdSTR,'String','DCT');
elseif(resSTR=='salt & pepper')
    ResImg=midFunc(Img);
    set(handles.mthdSTR,'String','mid fliter');
else
    ResImg=Waveletfunc(Img);
    set(handles.mthdSTR,'String','Wavelet');
end
axes(handles.axes2);
imshow(ResImg);
axes(handles.axes4);
histogram(ResImg);
guidata(hObject,handles);
