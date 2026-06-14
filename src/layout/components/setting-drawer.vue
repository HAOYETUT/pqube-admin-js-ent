<!-- 主题设置抽屉 -->
<template>
  <div style="height: 100%; display: flex; flex-direction: column">
    <div class="pq-setting-segmented-wrapper">
      <PqSegmented
        :block="true"
        v-model="tabActive"
        :items="[
          { label: t('layout.setting.tabs.theme'), value: 'theme' },
          { label: t('layout.setting.tabs.layout'), value: 'layout' },
          { label: t('layout.setting.tabs.skin'), value: 'skin' }
        ]"
      />
    </div>
    <div class="pq-setting-wrapper">
      <SettingTheme v-if="tabActive === 'theme'" />
      <SettingLayout v-if="tabActive === 'layout'" />
      <SettingSkin v-if="tabActive === 'skin'" />
    </div>
  </div>
</template>

<script setup>
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import SettingTheme from './setting-theme.vue';
  import SettingLayout from './setting-layout.vue';
  import SettingSkin from './setting-skin.vue';

  const { t } = useI18n();

  /** 选项卡选中 */
  const tabActive = ref('theme');
</script>

<style lang="scss">
  @use 'pq-admin-ent/es/style/util.scss' as *;

  .pq-setting-wrapper {
    flex: 1;
    overflow: auto;
    box-sizing: border-box;
    padding: 10px 12px 18px 12px;
    $header-primary-bg: linear-gradient(
      12deg,
      elVar('color-primary'),
      elVar('color-primary', 'light-3') 28%,
      elVar('color-primary', 'light-5') 46%,
      elVar('color-primary', 'light-3') 72%,
      elVar('color-primary') 92%,
      elVar('color-primary', 'dark-2')
    );

    .pq-setting-title {
      font-size: 13px;
      padding: 0 6px;
      margin-bottom: 8px;
    }

    /* 主题风格 */
    .pq-setting-theme {
      display: flex;
      align-items: flex-start;
      flex-wrap: wrap;
      box-sizing: border-box;
      padding: 0 6px;

      .pq-setting-theme-item {
        flex-shrink: 0;
        width: 73px;
        line-height: 1;
        font-size: 13px;
        margin-bottom: 16px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }

      .pq-setting-theme-item-cover {
        width: 52px;
        height: 36px;
        font-size: 16px;
        margin-bottom: 12px;
        padding: 14px 0 0 24px;
        background: elVar('bg-color', 'page');
        box-shadow: 0 2px 6px rgba(80, 80, 80, 0.2);
        border-radius: elVar('border-radius', 'base');
        transition: background-color 0.2s;
        box-sizing: border-box;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        cursor: pointer;

        &:hover {
          box-shadow: 0 2px 6px rgba(80, 80, 80, 0.6);
        }

        &::before,
        &::after {
          content: '';
          width: 100%;
          height: 10px;
          background: elVar('bg-color');
          transition: background-color 0.2s;
          position: absolute;
          left: 0;
          top: 0;
        }

        &::after {
          width: 14px;
          height: 100%;
        }

        &.pq-setting-side-dark::after,
        &.pq-setting-head-dark::before,
        &.pq-setting-layout-mix::before,
        &.pq-setting-layout-mix::after {
          background: #262626;
        }

        &.pq-setting-head-light::before,
        &.pq-setting-head-dark::before,
        &.pq-setting-head-primary::before {
          z-index: 1;
        }

        &.pq-setting-side-light::before,
        &.pq-setting-side-dark:not(.pq-setting-layout-side)::before,
        &.pq-setting-head-light::after,
        &.pq-setting-head-dark::after,
        &.pq-setting-head-primary::after {
          opacity: 0.5;
        }

        &.pq-setting-head-primary::before {
          background: $header-primary-bg !important;
        }

        &.pq-setting-layout-top {
          padding-left: 18px;

          &::after {
            display: none;
          }
        }
      }
    }

    /* 主题色选择 */
    .pq-setting-colors {
      color: #fff;
      padding: 0 6px;
      margin-bottom: 18px;
      box-sizing: border-box;
      line-height: 0;
    }

    .pq-setting-color-item {
      width: 20px;
      height: 20px;
      line-height: 20px;
      border-radius: elVar('border-radius', 'small');
      margin: 8px 8px 0 0;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s;
      vertical-align: top;
      position: relative;
      text-align: center;
      cursor: pointer;

      &:hover {
        box-shadow: 0 2px 6px rgba(80, 80, 80, 0.2);
      }
    }

    .pq-setting-colors .pq-setting-color-item:last-child {
      margin-right: 0;
    }

    /* 主题配置项 */
    .pq-setting-item {
      display: flex;
      align-items: center;
      padding: 0 6px;
      box-sizing: border-box;
      border-radius: elVar('border-radius', 'base');
      transition: background-color 0.2s;
      margin-bottom: 6px;

      .pq-setting-item-title {
        flex: 1;
        line-height: 32px;
      }

      .pq-setting-item-control {
        line-height: 1;
      }

      &:hover {
        background: elVar('fill-color', 'light');
      }
    }

    .el-divider.el-divider--horizontal {
      width: calc(100% - 12px);
      margin: 14px auto 10px auto;
      opacity: 0.6;
    }

    /* 颜色选择器 */
    .pq-setting-colors .pq-setting-color-picker {
      margin-top: 8px;
      line-height: 0;
      width: auto;
      height: auto;

      .el-color-picker__trigger {
        padding: 0;
        width: 20px;
        height: 20px;
        border: none;
      }

      .el-color-picker__color {
        border: none;
      }

      &.is-empty-color .el-color-picker__color-inner {
        background: conic-gradient(
          from 90deg at 50% 50%,
          rgb(255, 0, 0) -19.41deg,
          rgb(255, 0, 0) 18.76deg,
          rgb(255, 138, 0) 59.32deg,
          rgb(255, 230, 0) 99.87deg,
          rgb(20, 255, 0) 141.65deg,
          rgb(0, 163, 255) 177.72deg,
          rgb(5, 0, 255) 220.23deg,
          rgb(173, 0, 255) 260.13deg,
          rgb(255, 0, 199) 300.69deg,
          rgb(255, 0, 0) 340.59deg,
          rgb(255, 0, 0) 378.76deg
        ) !important;

        * {
          display: none;
        }
      }
    }

    /* 常用布局 */
    .pq-setting-layout-list {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
      grid-gap: 22px 6px;
      box-sizing: border-box;
    }

    .pq-setting-layout-item {
      padding: 6px;
      box-sizing: border-box;
      word-break: break-all;
      cursor: pointer;
    }

    .pq-setting-layout-item-cover {
      width: 100%;
      height: 72px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: elVar('bg-color', 'page');
      border-radius: elVar('border-radius', 'base');
      border: 1px solid elVar('border-color');
      box-sizing: border-box;
      transition: all 0.3s;
      overflow: hidden;

      & > div {
        width: 100%;
        height: 100%;
      }

      &:hover {
        transform: scale(1.06);
        box-shadow: 0 2px 12px rgba(80, 80, 80, 0.2);
      }

      * {
        pointer-events: none;
      }
    }

    .pq-setting-layout-item-label {
      margin-top: 8px;
      font-size: 13px;
      max-height: 36px;
      line-height: 18px;
      text-align: center;
      padding: 0 8px;
      box-sizing: border-box;
      transition: all 0.3s;
      overflow: hidden;

      &::before {
        content: '';
        width: 6px;
        height: 6px;
        margin: 0 4px 0 -8px;
        display: inline-block;
        background: transparent;
        transition: all 0.3s;
        vertical-align: 1px;
        border-radius: 50%;
      }
    }

    .pq-setting-layout-item-cover-img {
      width: 100%;
      height: 100%;
    }

    .pq-setting-layout-item.is-active .pq-setting-layout-item-label {
      color: elVar('color-primary');

      &::before {
        background: elVar('color-primary');
      }
    }

    .pq-setting-layout-list + .pq-setting-item {
      margin-top: 14px;
    }

    /* 背景上传 */
    .pq-setting-bg-upload {
      width: 28px;
      height: 28px;
      font-size: 15px;
      color: elVar('text-color', 'placeholder');
      border: 1px dashed elVar('border-color');
      border-radius: elVar('border-radius', 'base');
      box-sizing: border-box;
      transition: (color 0.2s, border-color 0.2s);

      &:hover {
        color: elVar('color-primary');
        border-color: elVar('color-primary');
      }
    }

    .el-upload {
      display: flex;
    }

    /* 背景颜色选择 */
    .pq-setting-bg-picker {
      display: flex;
      width: auto;
      height: auto;
      margin-right: 1.5px;

      .el-color-picker__trigger {
        padding: 0;
        width: 25px;
        height: 25px;
      }

      .el-color-picker__color {
        border: none;
      }

      .el-color-picker__color-inner * {
        display: none;
      }
    }

    /* 布局缩略图 */
    .pq-setting-layout-cover-bg-dark {
      background: #262626;
    }

    .pq-setting-layout-cover-bg-light {
      background: elVar('bg-color');
    }

    .pq-setting-layout-cover-bg-primary {
      background: $header-primary-bg;
    }

    .pq-setting-layout-cover-bg-blue {
      background: #6d87f1;
    }

    .pq-setting-layout-cover-bg-blue-dark {
      background: #2f54eb;
    }

    .pq-setting-layout-cover-border-lighter {
      border-color: elVar('border-color', 'lighter');
    }

    .pq-setting-layout-cover-bg-fill {
      background: elVar('fill-color');
    }

    .pq-setting-layout-cover-bg-fill-light {
      background: elVar('border-color', 'light');
    }

    .pq-setting-layout-cover-bg-fill-dark {
      background: elVar('border-color');
    }
  }

  /* 选项卡 */
  .pq-setting-segmented-wrapper {
    flex-shrink: 0;
    padding: 10px 14px 6px 14px;
    box-sizing: border-box;
  }

  /* 底栏 */
  .pq-setting-footer {
    padding: 6px 6px 0 6px;
  }
</style>
