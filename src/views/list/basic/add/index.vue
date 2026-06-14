<template>
  <div>
    <pq-card style="border-radius: 0">
      <pq-text type="heading" size="lg">添加用户</pq-text>
      <pq-text type="placeholder" style="margin-top: 6px">
        填写用户基本信息后点击保存按钮
      </pq-text>
    </pq-card>
    <pq-page>
      <pq-card>
        <edit-form />
      </pq-card>
    </pq-page>
  </div>
</template>

<script setup>
  import EditForm from '../components/edit-form.vue';

  defineOptions({ name: 'ListBasicAdd' });
</script>
