<!-- 配置式增删改查 -->
<template>
  <PqCrud
    v-bind="{ ...emitProps, ...$props }"
    ref="crudRef"
    :httpRequest="request"
    :proFormComponent="proFormComponent || ProForm"
  >
    <template v-for="name in Object.keys($slots)" #[name]="slotProps">
      <slot :name="name" v-bind="slotProps || {}"></slot>
    </template>
  </PqCrud>
</template>

<script setup>
  import { ref } from 'vue';
  import {
    useComponentEvents,
    useComponentExpose
  } from 'pq-admin-ent/es/utils/hook';
  import { crudProps, crudEmits } from 'pq-admin-ent/es/pq-crud/props';
  import ProForm from '@/components/ProForm/index.vue';
  import request from '@/utils/request';

  defineOptions({ name: 'ProCrud' });

  defineProps(crudProps);

  const emit = defineEmits(crudEmits);

  const { emitProps } = useComponentEvents(crudEmits, emit);

  /** 增删改查组件 */
  const crudRef = ref(null);

  const exposeValues = useComponentExpose(
    crudRef,
    ['getTableSelections'],
    ['tableRef']
  );

  defineExpose({ ...exposeValues, crudRef });
</script>
