import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import '../../../domain/dto/entities/user/user_lead_entity.dart';
import '../../../domain/dto/params/user_lead_param.dart';
import '../../../domain/repositories/user_leads_repository.dart';

class UserLeadsRepositoryImpl extends UserLeadsRepository {
  final Database database;

  final Dio dio;

  const UserLeadsRepositoryImpl({
    required this.database,
    required this.dio,
  });

  static const String table = 'user_leads';

  @override
  Future<void> store(UserLeadParam param) async {
    await database.insert(table, param.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await database.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<UserLeadEntity>> index() async {
    final result = await database.query(table, where: 'sync_date IS NULL');
    return result.map((e) => UserLeadEntity.fromJson(e)).toList();
  }

  @override
  Future<void> sync() async {
    final values = await index();

    if (values.isEmpty) {
      return;
    }

    dio.post(
      '/cars/leads',
      data: values.map((e) => e.toJson()).toList(),
    );

    await database.update(
      table,
      {
        'sync_date': DateTime.now().toIso8601String(),
      },
      where: 'sync_date IS NULL',
    );
  }
}
