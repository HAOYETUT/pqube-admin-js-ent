<template>
  <pq-page>
    <demo-badge />
    <demo-group />
    <demo-tab />
    <demo-component />
  </pq-page>
</template>

<script setup>
  import DemoBadge from './components/demo-badge.vue';
  import DemoGroup from './components/demo-group.vue';
  import DemoTab from './components/demo-tab.vue';
  import DemoComponent from './components/demo-component.vue';

  defineOptions({ name: 'Example' });
</script>
