part of agGrid;

@JS()
@anonymous
class BaseParam {
  external ColumnDef get colDef;
  external GridApi get api;
}

@JS()
@anonymous
class RendererParam extends BaseParam {
  external RowNode get node;
}

