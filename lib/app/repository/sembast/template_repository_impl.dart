import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/repository/template_repository.dart';
import 'package:omelet/common/sembast/sembast_repository_base.dart';

class TemplateRepositorySembast extends SembastRepositoryBase<Template>
    implements TemplateRepository {
  TemplateRepositorySembast() : super('template', (e) => Template.fromMap(e));
}
