(* ::Package:: *)

Print["Butools V2.0"]
BuTools`Packages={"Moments","MC"};
Do[
	Get[StringJoin["BuTools`",p,"`"]];
	WriteString["stdout",p];
	WriteString["stdout","\t"];
,{p,BuTools`Packages}];
WriteString["stdout","\n"];
BuTools`Verbose=False;
BuTools`CheckInput=True;
BuTools`CheckPrecision=N[10^-12];
Print["Global variables: BuTools`Verbose = ",BuTools`Verbose, ", BuTools`CheckInput = ",BuTools`CheckInput,", BuTools`CheckPrecision = ",BuTools`CheckPrecision];






