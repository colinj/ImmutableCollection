unit ImmutableCollections;

interface

uses
  SysUtils,
  Classes;

type
  EImmutableCollectionException = class(Exception);
  ENoSuchElement = class(EImmutableCollectionException);
  EUnsupportedOperation = class(EImmutableCollectionException);

  IConsList<T> = interface
    function IsEmpty: Boolean;
    function Head: T;
    function Tail: IConsList<T>;
    function Length: Integer;
    function Cons(const aItem: T): IConsList<T>;
  end;

  TConsList<T> = class(TInterfacedObject, IConsList<T>)
  private
    class var FEmptyList: IConsList<T>;
  private
    FEmpty: Boolean;
    FHead: T;
    FTail: IConsList<T>;
    FLength: Integer;
    constructor Create(const aHead: T; const aTail: IConsList<T>); overload;
    procedure PopulateValues(const aHead: T; const aTail: IConsList<T>);
  public
    class constructor CreateClass;
    constructor CreateEmptyList; overload;
    constructor Create(const aHead: T); overload;
    constructor Create(const aItems: array of T); overload;
    function IsEmpty: Boolean;
    function Head: T;
    function Tail: IConsList<T>;
    function Length: Integer;
    function Cons(const aHead: T): IConsList<T>;
    class function EmptyList: IConsList<T>;
  end;

implementation

{ TImmutableList<T> }

class constructor TConsList<T>.CreateClass;
begin
  FEmptyList := TConsList<T>.CreateEmptyList;
end;

constructor TConsList<T>.CreateEmptyList;
begin
  inherited Create;
  FEmpty := True;
  FLength := 0;
end;

constructor TConsList<T>.Create(const aHead: T);
begin
  inherited Create;
  PopulateValues(aHead, FEmptyList);
end;

constructor TConsList<T>.Create(const aHead: T; const aTail: IConsList<T>);
begin
  inherited Create;
  PopulateValues(aHead, aTail);
end;

constructor TConsList<T>.Create(const aItems: array of T);
var
  I: Integer;
  NewTail: IConsList<T>;
begin
  inherited Create;

  NewTail := FEmptyList;
  for I := High(aItems) downto 1 do
    NewTail := NewTail.Cons(aItems[I]);

  PopulateValues(aItems[0], NewTail);
end;

function TConsList<T>.Head: T;
begin
  if not FEmpty then
    Result := FHead
  else
    raise ENoSuchElement.Create('Head of an empty list');
end;

function TConsList<T>.IsEmpty: Boolean;
begin
  Result := FEmpty;
end;

function TConsList<T>.Length: Integer;
begin
  Result := FLength;
end;

function TConsList<T>.Cons(const aHead: T): IConsList<T>;
begin
  Result := TConsList<T>.Create(aHead, Self);
end;

class function TConsList<T>.EmptyList: IConsList<T>;
begin
  Result := FEmptyList;
end;

procedure TConsList<T>.PopulateValues(const aHead: T; const aTail: IConsList<T>);
begin
  FEmpty := False;
  FHead := aHead;
  FTail := aTail;
  FLength := aTail.Length + 1;
end;

function TConsList<T>.Tail: IConsList<T>;
begin
  if not FEmpty then
    Result := FTail
  else
    raise EUnsupportedOperation.Create('Tail of an empty list');
end;

end.
