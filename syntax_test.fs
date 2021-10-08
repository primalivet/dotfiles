// one-liners
[1..100] |> List.sum |> printfn "sum=%d"

// no curly braces, semicolons or parentheses
let square x = x * x
let sq = square 42

// simple types in one line
type Person = {First:string; Last:string}

// complex types in a few lines
type Employee =
  | Worker of Person
  | Manager of Employee list

// type inference
let jdoe = {First="John"; Last="Doe"}
let worker = Worker jdoe

// impure code when needed
let mutable counter = 0

// create C# compatible classes and interfaces
type IEnumerator<'a> =
    abstract member Current : 'a
    abstract MoveNext : unit -> bool

// extension methods
type System.Int32 with
    member this.IsEven = this % 2 = 0

let i=20
if i.IsEven then printfn "'%i' is even" i

// UI code
open System.Windows.Forms
let form = new Form(Width = 400, Height = 300,
   Visible = true, Text = "Hello World")
form.TopMost <- true
form.Click.Add (fun args -> printfn "clicked!")
form.Show()
