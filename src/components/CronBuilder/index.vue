<!-- Cron 表达式生成器 -->
<template>
  <PqCronBuilder v-bind="{ ...emitProps, ...$props }">
    <template v-for="name in Object.keys($slots)" #[name]="slotProps">
      <slot :name="name" v-bind="slotProps || {}"></slot>
    </template>
  </PqCronBuilder>
</template>

<script setup>
  import {
    cronBuilderProps,
    cronBuilderEmits
  } from 'pq-admin-ent/es/pq-cron-builder/props';
  import { useComponentEvents } from 'pq-admin-ent/es/utils/hook';

  defineOptions({ name: 'CronBuilder' });

  defineProps(cronBuilderProps);

  const emit = defineEmits(cronBuilderEmits);

  const { emitProps } = useComponentEvents(cronBuilderEmits, emit);
</script>
