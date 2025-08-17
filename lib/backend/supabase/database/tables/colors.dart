import '../database.dart';

class ColorsTable extends SupabaseTable<ColorsRow> {
  @override
  String get tableName => 'colors';

  @override
  ColorsRow createRow(Map<String, dynamic> data) => ColorsRow(data);
}

class ColorsRow extends SupabaseDataRow {
  ColorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String get hex => getField<String>('hex')!;
  set hex(String value) => setField<String>('hex', value);

  int? get red => getField<int>('red');
  set red(int? value) => setField<int>('red', value);

  int? get green => getField<int>('green');
  set green(int? value) => setField<int>('green', value);

  int? get blue => getField<int>('blue');
  set blue(int? value) => setField<int>('blue', value);

  int? get hue => getField<int>('hue');
  set hue(int? value) => setField<int>('hue', value);

  int? get satHsl => getField<int>('sat_hsl');
  set satHsl(int? value) => setField<int>('sat_hsl', value);

  int? get lightHsl => getField<int>('light_hsl');
  set lightHsl(int? value) => setField<int>('light_hsl', value);

  int? get satHsv => getField<int>('sat_hsv');
  set satHsv(int? value) => setField<int>('sat_hsv', value);

  int? get valHsv => getField<int>('val_hsv');
  set valHsv(int? value) => setField<int>('val_hsv', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);
}
