<!-- 增删改查构建器 -->
<template>
  <PqCrudBuilder
    v-bind="{ ...emitProps, ...$props }"
    :templateData="templateData || defaultTemplateData"
    :pageConfigFormItems="pageConfigFormItems || defaultPageConfigFormItems"
    :fieldEditFormItems="fieldEditFormItems || defaultFieldEditFormItems"
    :crudComponent="crudComponent || ProCrud"
    :proFormComponent="proFormComponent || ProForm"
    :proFormBuilderComponent="proFormBuilderComponent || ProFormBuilder"
    :codeEditerComponent="codeEditerComponent || CodeEditer"
    :jsonEditerComponent="jsonEditerComponent || JsonEditer"
    :codeViewerComponent="codeViewerComponent || CodeViewer"
    :headerTools="headerTools ?? defaultHeaderRightTools"
  >
    <template v-for="name in Object.keys($slots)" #[name]="slotProps">
      <slot :name="name" v-bind="slotProps || {}"></slot>
    </template>
  </PqCrudBuilder>
</template>

<script setup>
  import { useComponentEvents } from 'pq-admin-ent/es/utils/hook';
  import {
    crudBuilderProps,
    crudBuilderEmits
  } from 'pq-admin-ent/es/pq-crud-builder/props';
  import {
    defaultPageConfigFormItems,
    defaultFieldEditFormItems
  } from 'pq-admin-ent/es/pq-crud-builder/util';
  import ProCrud from '@/components/ProCrud/index.vue';
  import ProForm from '@/components/ProForm/index.vue';
  import ProFormBuilder from '@/components/ProFormBuilder/index.vue';
  import CodeEditer from '@/components/ProFormBuilder/components/code-editer.vue';
  import JsonEditer from '@/components/ProFormBuilder/components/json-editer.vue';
  import CodeViewer from '@/components/CodeViewer/index.vue';
  import { defaultTemplateData } from './components/template-data';

  defineOptions({ name: 'ProCrudBuilder' });

  defineProps(crudBuilderProps);

  const emit = defineEmits(crudBuilderEmits);

  const { emitProps } = useComponentEvents(crudBuilderEmits, emit);

  /** 顶栏右侧按钮布局 */
  const defaultHeaderRightTools = ['import', 'export', 'clear', 'code'];
</script>
