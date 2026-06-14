<template>
  <PqCronPanel v-bind="{ ...emitProps, ...$props }">
    <template v-for="name in Object.keys($slots)" #[name]="slotProps">
      <slot :name="name" v-bind="slotProps || {}"></slot>
    </template>
  </PqCronPanel>
</template>

<script setup>
  import {
    cronPanelProps,
    cronPanelEmits
  } from 'pq-admin-ent/es/pq-cron-panel/props';
  import { useComponentEvents } from 'pq-admin-ent/es/utils/hook';

  defineProps(cronPanelProps);

  const emit = defineEmits(cronPanelEmits);

  const { emitProps } = useComponentEvents(cronPanelEmits, emit);
</script>
