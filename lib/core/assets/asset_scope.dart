class AssetScope {
  AssetScope({required this.name}); final String name;
  final Map<String,int> _references={}; final Map<String,void Function()> _disposers={}; bool _disposed=false;
  int referenceCount(String id)=>_references[id]??0;
  void retain(String id,void Function() dispose){if(_disposed)throw StateError('AssetScope disposed');_references[id]=referenceCount(id)+1;_disposers[id]=dispose;}
  void release(String id){final count=referenceCount(id);if(count<=1){_references.remove(id);_disposers.remove(id)?.call();}else{_references[id]=count-1;}}
  void dispose(){if(_disposed)return;_disposed=true;for(final dispose in _disposers.values){dispose();}_disposers.clear();_references.clear();}
}
