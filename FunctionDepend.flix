rel ObjectFile(file: Str)
rel Function(fn: Str)
rel FunctionCalls(from: Str, to: Str)

ObjectFile(file) :- Instance(file, "$cObjectFile").

Function(fn) :- Instance(fn, "$cFunction").

FunctionCalls(fnFrom, fnTo) :- Function(fnFrom), Function(fnTo),
                               CLinks(fnFrom, fnTo).
FunctionCalls(fnFrom, fnTo) :- FunctionCalls(fnFrom, mid), FunctionCalls(mid, fnTo).

rel FunctionCallsNamed(fnFrom: Str, fnTo: Str)

FunctionCallsNamed(fnFrom, fnTo) :- FunctionCalls(fnFromP, fnToP),
                                    Label(fnFromP, fnFrom),
                                    Label(fnToP, fnTo).

