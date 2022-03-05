import Http "http_module";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

// Create a simple Counter actor.
actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  
  public shared query func http_request(request : Http.HttpRequest) : async Http.HttpResponse{
       var dis : Text = "<html><body><h1>currentValue:" # Nat.toText(currentValue) # "</h1></body></html>";
      {
        body = Text.encodeUtf8(dis);
        headers = [];
        streaming_strategy = null;
        status_code = 200;
      }
  };
}
