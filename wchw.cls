\ProvidesClass{wchw}
%
\LoadClass{article}
%
% option to load shortvrb and/or other code-related stuff
\newif\if@usecode
\DeclareOption{code}{\@usecodetrue}
\DeclareOption{no-code}{\@usecodefalse}
\ExecuteOptions{no-code}
%
\ProcessOptions\relax
%
\PassOptionsToPackage{letterpaper,margin=1in}{geometry}
\RequirePackage{geometry}
%
\if@usecode
  \PassOptionsToPackage{listings}{wcsetup}
\fi
\RequirePackage{wcsetup}
\if@usecode
  \AtBeginDocument{\lstMakeShortInline|}
\fi
%
% Environment for question prompts
%
\newenvironment{prompt}{\par\itshape}{\par}
%
% Macros for typesetting questions with (optionally) random-access numbering.
%
% Usage:
% \begin{questions}
%   \question[20]
%     Why is there air?
%   \question[23]
%     What would happen if there were no air?
%     \begin{questions}
%       \question
%         Describe the effect on the aviation industry.
%       \question
%         Describe the effect on the balloon industry.
%      \end{questions}
% \end{questions}
% 
% Macro names may conflict with exam.cls, but that class is semantically incompatible anyway.
%
% Adapted from: http://tex.stackexchange.com/a/27578/37357.
\newenvironment{questions}%
{\begin{enumerate}\providecommand{\question}[1][\value{enum\romannumeral\@enumdepth}+1]{\setcounter{enum\romannumeral\@enumdepth}{##1-1}\item}}%
{\end{enumerate}}
%
% Multicolumn questions
\RequirePackage{multicol}
\newenvironment{cquestions}[1][2]%
{\newif\ifwasvmode\ifvmode\wasvmodetrue\else\wasvmodefalse\fi%
\begin{questions}\multicolsep=0pt\ifwasvmode\else\medskip\fi\begin{multicols}{#1}\raggedcolumns}%
{\end{multicols}\end{questions}}
%
% vim: syn=tex
