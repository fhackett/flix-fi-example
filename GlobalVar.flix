
rel Object(object: Str)
rel LinkedMoreThanOnce(object: Str)
rel ObjectName(object: Str, name: Str)
rel GlobalVarName(name: Str)

Object(objectt) :- Instance(objectt, "$cObject").

def neq(a: Str, b: Str): Bool = a != b

LinkedMoreThanOnce(object) :- CLinks(from1, object), CLinks(from2, object), from1 != from2.

ObjectName(object, name) :- Label(object, name).

GlobalVarName(name) :- Object(object), LinkedMoreThanOnce(object), ObjectName(object, name).

