<template>
  <pq-page>
    <excel-export />
    <excel-import />
  </pq-page>
</template>

<script setup>
  import ExcelExport from './components/excel-export.vue';
  import ExcelImport from './components/excel-import.vue';

  defineOptions({ name: 'ExtensionExcel' });
</script>
