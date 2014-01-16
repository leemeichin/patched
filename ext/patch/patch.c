#include <ruby.h>

VALUE Patch = Qnil;
VALUE PatchClassMethods = Qnil;
VALUE PatchRefinements = Qnil;

VALUE Patch_included(VALUE self, VALUE recv) {
  return rb_mod_extend_object(recv, PatchClassMethods);
}

VALUE Patch_patch(VALUE self, VALUE class) {
  rb_need_block();

  VALUE refineMod = Patch__def_nested_module(2, Patch, rb_class2name(self), rb_class2name(class));

  rb_thread_t *th = GET_THREAD();
  rb_block_t *block = rb_vm_control_frame_block_ptr(th->cfp);

  rb_vm_invoke_proc(th, block->proc, self, 0, Qnil, block);
  rb_mod_refine(tmpMod, class);
}

VALUE Patch__def_nested_module(VALUE baseMod, int numModules, ...) {
  int i;
  VALUE tmpMod = baseMod;
  va_list modNames;

  va_start(modNames, numModules);

  for (int i = 0; i < count; i++) {
    tmpMod = rb_define_module_under(tmpMod, va_arg(modNames, char*));
  }

  va_end(modNames);

  return tmpMod;
}

void Init_patch() {
  Patch = rb_define_module("Patch");
  PatchClassMethods = rb_define_module_under(Patch, "ClassMethods");
  PatchRefinements = rb_define_module_under(PatchClassMethods, "Refinements");

  rb_define_module_function(Patch, "included", Patch_included, 1);
  rb_define_method(PatchClassMethods, "patch", Patch_patch, 1)
}
