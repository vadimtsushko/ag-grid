part of agGrid;

@JS()
@anonymous
class BaseParam {
  external ColumnDef get colDef;
  external GridApi get api;
}

class RendererParam extends BaseParam{
}