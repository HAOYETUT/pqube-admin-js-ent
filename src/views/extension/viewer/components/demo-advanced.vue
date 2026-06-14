<template>
  <pq-card header="可自定义任意内容">
    <pq-viewer ref="viewerRef" style="height: 560px; max-width: 900px">
      <demo-top-layout
        :style="{
          width: '800px',
          background: 'var(--pq-layout-bg)',
          pointerEvents: 'auto'
        }"
      />
    </pq-viewer>
    <div style="margin-top: 12px">
      <el-button class="pq-btn-icon" @click="handleCallViewer('zoomIn')">
        放大
      </el-button>
      <el-button class="pq-btn-icon" @click="handleCallViewer('zoomOut')">
        缩小
      </el-button>
      <el-button class="pq-btn-icon" @click="handleCallViewer('rotateLeft')">
        向左旋转
      </el-button>
      <el-button class="pq-btn-icon" @click="handleCallViewer('rotateRight')">
        向右旋转
      </el-button>
      <el-button class="pq-btn-icon" @click="handleCallViewer('autoIntoView')">
        自适应缩放
      </el-button>
      <el-button class="pq-btn-icon" @click="handleCallViewer('reset')">
        重置
      </el-button>
    </div>
  </pq-card>
</template>

<script setup>
  import { ref } from 'vue';
  import DemoTopLayout from '../../layout/components/demo-top-layout.vue';

  /** 查看器组件 */
  const viewerRef = ref(null);

  /** 调用查看器组件方法 */
  const handleCallViewer = (methodName) => {
    if (viewerRef.value) {
      viewerRef.value[methodName]();
    }
  };
</script>
