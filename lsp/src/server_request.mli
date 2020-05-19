open Import
open Types

type _ t =
  | WorkspaceApplyEdit :
      ApplyWorkspaceEditParams.t
      -> ApplyWorkspaceEditResponse.t t
  | WorkspaceFolders : WorkspaceFolder.t list t
  | WorkspaceConfiguration : ConfigurationParams.t -> Json.t list t
  | ClientRegisterCapability : RegistrationParams.t -> unit t
  | ClientUnregisterCapability : UnregistrationParams.t -> unit t
  | ShowMessageRequest :
      ShowMessageRequestParams.t
      -> MessageActionItem.t option t
  | UnknownRequest : string * Json.t option -> unit t

type packed = E : 'r t -> packed

val yojson_of_result : 'a t -> 'a -> Json.t option

val to_jsonrpc_request : _ t -> id:Jsonrpc.Id.t -> Jsonrpc.Request.t

val of_jsonrpc : Jsonrpc.Request.t -> (packed, string) Result.t

val response_of_json : 'a t -> Json.t -> 'a