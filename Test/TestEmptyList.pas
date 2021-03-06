unit TestEmptyList;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Immutable, SysUtils, Classes;

type
  // Test methods for class TImmutableList

  TTestEmptyList = class(TTestCase)
  strict private
    FEmptyList: IConsList<Integer>;
    procedure CallHead;
    procedure CallTail;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestIsEmpty;
    procedure TestHead;
    procedure TestTail;
    procedure TestLength;
    procedure TestCons;
    procedure TestEmptyList;
  end;

implementation

procedure TTestEmptyList.CallHead;
begin
  FEmptyList.Head;
end;

procedure TTestEmptyList.CallTail;
begin
  FEmptyList.Tail;
end;

procedure TTestEmptyList.SetUp;
begin
  FEmptyList := TConsList<Integer>.EmptyList;
end;

procedure TTestEmptyList.TearDown;
begin
  FEmptyList := nil;
end;

procedure TTestEmptyList.TestIsEmpty;
var
  ReturnValue: Boolean;
begin
  ReturnValue := FEmptyList.IsEmpty;
  // TODO: Validate method results
  CheckTrue(ReturnValue);
end;

procedure TTestEmptyList.TestHead;
begin
  CheckException(CallHead, ENoSuchElement);
end;

procedure TTestEmptyList.TestTail;
begin
  CheckException(CallTail, EUnsupportedOperation);
end;

procedure TTestEmptyList.TestLength;
var
  ReturnValue: Integer;
begin
  ReturnValue := FEmptyList.Length;
  CheckEquals(0, ReturnValue);
end;

procedure TTestEmptyList.TestCons;
var
  ReturnValue: IConsList<Integer>;
  aHead: Integer;
begin
  aHead := 10;
  ReturnValue := FEmptyList.Cons(aHead);
  // TODO: Validate method results
  CheckFalse(ReturnValue.IsEmpty, 'List should not be empty');
  Check(ReturnValue.Head = 10, 'Head not correct');
  CheckEquals(1, ReturnValue.Length, 'Length not correct');
  Check(ReturnValue.Tail = TConsList<Integer>.EmptyList, 'Tail not correct')
end;

procedure TTestEmptyList.TestEmptyList;
var
  ReturnValue: IConsList<Integer>;
begin
  ReturnValue := TConsList<Integer>.EmptyList;
  CheckTrue(ReturnValue.IsEmpty);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TTestEmptyList.Suite);
end.

