import { NavLink } from "react-router-dom";
import { CreateIcon, HomeIcon, ProfileIcon, SearchIcon, SparkIcon, StudyIcon } from "@/components/icons/Icon";
import styles from "./Sidebar.module.css";

const navItems = [
  { to: "/", label: "首页", Icon: HomeIcon },
  { to: "/search", label: "搜索", Icon: SearchIcon },
  { to: "/create", label: "创作", Icon: CreateIcon },
  { to: "/learn", label: "学习", Icon: StudyIcon },
  { to: "/profile", label: "我的", Icon: ProfileIcon }
] as const;

const Sidebar = () => {
  return (
    <aside className={styles.sidebar}>
      <div className={styles.brand}>
        <div className={styles.logo}>
          <SparkIcon width={22} height={22} stroke="none" fill="#fff" />
        </div>
        <div className={styles.brandText}>
          <strong>智脉</strong>
          <span>ZHIMAI</span>
        </div>
      </div>
      <nav className={styles.nav}>
        {navItems.map(({ to, label, Icon }) => (
          <NavLink
            key={to}
            to={to}
            end={to === "/"}
            className={({ isActive }) => (isActive ? `${styles.link} ${styles.linkActive}` : styles.link)}
          >
            <Icon />
            {label}
          </NavLink>
        ))}
      </nav>
      <div className={styles.divider} />
      <div className={styles.footer}>
        <span>保持好奇</span>
        <div>连接每一次思考</div>
      </div>
    </aside>
  );
};

export default Sidebar;
