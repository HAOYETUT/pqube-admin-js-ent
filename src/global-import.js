/** 全局安装(开发环境) */
import PqmentPlus from 'element-plus';
import PqAdminPlus from 'pq-admin-ent';
import 'element-plus/theme-chalk/src/index.scss';
import 'pq-admin-ent/es/style/index.scss';
import 'cropperjs/dist/cropper.css';
import 'xgplayer/dist/index.min.css';
import * as components from '@/components/lite';

const installer = {
  install(app) {
    app.use(PqmentPlus);
    app.use(PqAdminPlus);
  }
};

export default installer;

/** 让 vite 能扫描到公共组件用到的依赖, 避免首次运行时频繁更新依赖刷新页面 */
export { components };
