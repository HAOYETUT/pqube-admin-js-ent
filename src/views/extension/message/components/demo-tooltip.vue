<template>
  <pq-card header="文本提示">
    <option-item label="使用">
      <pq-tooltip content="PqAdminPlus" placement="top" :offset="8">
        <el-button>Dark</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        effect="light"
        :offset="8"
      >
        <el-button>Light</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        :offset="8"
        transition="el-zoom-in-left"
        :gpu-acceleration="false"
      >
        <el-button>进入动画</el-button>
      </pq-tooltip>
    </option-item>
    <option-item label="边框">
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        :offset="8"
        effect="light"
        :popper-style="{
          '--pq-tooltip-light-color': 'var(--el-color-primary)',
          '--pq-tooltip-light-arrow-bg': 'var(--pq-tooltip-light-bg)',
          '--pq-tooltip-light-border': '1.5px solid var(--el-color-primary)',
          '--pq-popper-arrow-size': '11px',
          '--pq-popper-arrow-offset': '-5.33px'
        }"
      >
        <el-button class="pq-btn-icon">信息</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        :offset="8"
        effect="light"
        :popper-style="{
          '--pq-tooltip-light-color': 'var(--el-color-danger)',
          '--pq-tooltip-light-arrow-bg': 'var(--pq-tooltip-light-bg)',
          '--pq-tooltip-light-border': '1.5px solid var(--el-color-danger)',
          '--pq-popper-arrow-size': '11px',
          '--pq-popper-arrow-offset': '-5.33px'
        }"
      >
        <el-button class="pq-btn-icon">错误</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        :offset="8"
        effect="light"
        :popper-style="{
          '--pq-tooltip-light-color': 'var(--el-color-warning)',
          '--pq-tooltip-light-arrow-bg': 'var(--pq-tooltip-light-bg)',
          '--pq-tooltip-light-border': '1.5px solid var(--el-color-warning)',
          '--pq-popper-arrow-size': '11px',
          '--pq-popper-arrow-offset': '-5.33px'
        }"
      >
        <el-button class="pq-btn-icon">警告</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        :offset="8"
        effect="light"
        :popper-style="{
          '--pq-tooltip-light-color': 'var(--el-color-success)',
          '--pq-tooltip-light-arrow-bg': 'var(--pq-tooltip-light-bg)',
          '--pq-tooltip-light-border': '1.5px solid var(--el-color-success)',
          '--pq-popper-arrow-size': '11px',
          '--pq-popper-arrow-offset': '-5.33px'
        }"
      >
        <el-button class="pq-btn-icon">成功</el-button>
      </pq-tooltip>
    </option-item>
    <option-item label="主题">
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        effect="danger"
        :offset="8"
      >
        <el-button class="pq-btn-icon">错误</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        effect="warning"
        :offset="8"
      >
        <el-button class="pq-btn-icon">警告</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        effect="success"
        :offset="8"
      >
        <el-button class="pq-btn-icon">成功</el-button>
      </pq-tooltip>
      <pq-tooltip
        content="PqAdminPlus"
        placement="top"
        bg="linear-gradient( 135deg, #43CBFF 10%, #9708CC 100%)"
        arrow-bg="#7556E0"
        :offset="8"
      >
        <el-button class="pq-btn-icon">Custom</el-button>
      </pq-tooltip>
    </option-item>
  </pq-card>
</template>

<script setup>
  import OptionItem from '@/views/extension/avatar/components/option-item.vue';
</script>
