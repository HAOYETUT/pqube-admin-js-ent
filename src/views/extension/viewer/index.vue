<template>
  <pq-page>
    <demo-basic />
    <demo-advanced />
    <demo-paper />
    <demo-map />
  </pq-page>
</template>

<script setup>
  import DemoBasic from './components/demo-basic.vue';
  import DemoAdvanced from './components/demo-advanced.vue';
  import DemoPaper from './components/demo-paper.vue';
  import DemoMap from './components/demo-map.vue';

  defineOptions({ name: 'ExtensionViewer' });
</script>
