<template>
  <div
    class="pq-icon-color-secondary"
    :style="{ width: '68px', margin: '0 auto', fontSize: '12px' }"
  >
    <div :style="{ display: 'flex', alignItems: 'center' }">
      <IconCheckbox size="md" />
      <div>男</div>
    </div>
    <div :style="{ display: 'flex', alignItems: 'center', marginTop: '2px' }">
      <IconCheckbox size="md" :checked="true" />
      <div>女</div>
    </div>
    <div :style="{ display: 'flex', alignItems: 'center', marginTop: '2px' }">
      <IconCheckbox size="md" />
      <div>保密</div>
    </div>
  </div>
</template>

<script setup>
  import { IconCheckbox } from 'pq-admin-ent/es/pq-pro-form-builder/components/icons/index';
</script>
