module http_module {
  public type HeaderFiled = (Text, Text);
  public type HttpRequest = {
      url : Text;
      method : Text;
      body : [Nat8];
      headers : [HeaderFiled];
  };
  public type HttpResponse = {
      body : Blob;
      headers : [HeaderFiled];
      streaming_strategy : ?StreamingStrategy;
      status_code : Nat16;
  };

  public type Key = Text;
  public type Path = Text;
  public type ChunkId = Nat;
  public type SetAssetContentArguments = {
      key : Key;
      sha256 : ?[Nat8];
      chunk_ids : [ChunkId];
      content_encoding : Text;
  };
  public type SteamingCallbackHttpResponse = {
      token : ?StreamingCallbackToken;
      body : [Nat8];
  };
  public type StreamingCallbackToken = {
      key : Text;
      sha256 : ?[Nat8];
      index : Nat;
      content_encoding : Text;
  };
  public type StreamingStrategy = {
      #Callback : {
          token : StreamingCallbackToken;
          callback : shared query StreamingCallbackToken -> async SteamingCallbackHttpResponse;
      };
  };
};