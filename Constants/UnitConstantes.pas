unit UnitConstantes;

interface
   function PegarVersao():String;

implementation

function PegarVersao():String;
begin
  Result := '0.7.0';
end;

end.
