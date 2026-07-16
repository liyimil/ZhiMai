-- 智脉本地演示数据。仅写入固定的 demo ID，可重复执行，不会删除业务数据。
SET NAMES utf8mb4;
USE zhiguang;
START TRANSACTION;

INSERT INTO users
    (id, phone, email, password_hash, nickname, avatar, bio, zg_id, gender, birthday, school, tags_json, created_at, updated_at)
VALUES
    (101, '18800000101', 'linxi@demo.zhimai.local', NULL, '林溪', NULL, '后端工程师，关注稳定性、缓存与分布式系统。', 'linxi_dev', 'female', '1997-04-12', '同济大学', JSON_ARRAY('后端', 'Java', '分布式系统'), NOW(), NOW()),
    (102, '18800000102', 'zhouye@demo.zhimai.local', NULL, '周野', NULL, '产品设计师，喜欢把复杂问题讲清楚。', 'zhouye_design', 'male', '1996-09-08', '浙江大学', JSON_ARRAY('产品', '设计', '用户研究'), NOW(), NOW()),
    (103, '18800000103', 'suchen@demo.zhimai.local', NULL, '苏晨', NULL, 'AI 应用开发者，持续记录 RAG 落地经验。', 'suchen_ai', 'male', '1998-02-21', '上海交通大学', JSON_ARRAY('AI', 'RAG', 'Python'), NOW(), NOW()),
    (104, '18800000104', 'tangning@demo.zhimai.local', NULL, '唐宁', NULL, '前端工程师，关注可访问性和设计系统。', 'tangning_web', 'female', '1999-06-17', '南京大学', JSON_ARRAY('前端', 'TypeScript', '可访问性'), NOW(), NOW()),
    (105, '18800000105', 'luyan@demo.zhimai.local', NULL, '陆言', NULL, '技术写作者，研究如何让知识更容易被理解。', 'luyan_writes', 'male', '1995-11-03', '武汉大学', JSON_ARRAY('写作', '知识管理', '沟通'), NOW(), NOW()),
    (106, '18800000106', 'jianghe@demo.zhimai.local', NULL, '江禾', NULL, '数据库工程师，习惯从执行计划开始排查。', 'jianghe_db', 'female', '1997-12-26', '华中科技大学', JSON_ARRAY('数据库', 'MySQL', '性能优化'), NOW(), NOW()),
    (107, '18800000107', 'chenyu@demo.zhimai.local', NULL, '陈屿', NULL, '独立开发者，实践小团队产品交付方法。', 'chenyu_builds', 'male', '1994-05-30', '电子科技大学', JSON_ARRAY('独立开发', '工程管理', '创业'), NOW(), NOW()),
    (108, '18800000108', 'wenqing@demo.zhimai.local', NULL, '闻晴', NULL, '终身学习者，分享复盘、阅读和职业成长。', 'wenqing_learns', 'female', '2000-01-15', '北京师范大学', JSON_ARRAY('学习方法', '职业成长', '阅读'), NOW(), NOW())
ON DUPLICATE KEY UPDATE
    phone = VALUES(phone), email = VALUES(email), nickname = VALUES(nickname), bio = VALUES(bio),
    zg_id = VALUES(zg_id), gender = VALUES(gender), birthday = VALUES(birthday), school = VALUES(school),
    tags_json = VALUES(tags_json), updated_at = NOW();

INSERT INTO know_posts
    (id, tag_id, tags, title, description, content_url, creator_id, is_top, type, visible, img_urls, status, create_time, update_time, publish_time)
VALUES
    (900000000000000101, 1, JSON_ARRAY('产品', '迭代', '团队协作'), '从需求到上线：小团队的两周迭代方法', '用清晰目标和可运行薄切片，建立稳定的交付节奏。', '/demo/posts/small-team-release.md', 107, 1, 'image_text', 'public', JSON_ARRAY('/demo/covers/design.svg'), 'published', NOW() - INTERVAL 15 DAY, NOW(), NOW() - INTERVAL 2 HOUR),
    (900000000000000102, 2, JSON_ARRAY('前端', '可访问性', '清单'), '写给前端开发者的可访问性清单', '从键盘操作到焦点管理，补齐组件默认行为。', '/demo/posts/accessibility-checklist.md', 104, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/engineering.svg'), 'published', NOW() - INTERVAL 14 DAY, NOW(), NOW() - INTERVAL 8 HOUR),
    (900000000000000103, 3, JSON_ARRAY('Redis', '缓存', '性能'), 'Redis 热点 Key 的发现与治理', '先定位流量来源，再选择本地缓存、拆分或限流。', '/demo/posts/redis-hot-key.md', 101, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/engineering.svg'), 'published', NOW() - INTERVAL 13 DAY, NOW(), NOW() - INTERVAL 1 DAY),
    (900000000000000104, 4, JSON_ARRAY('Spring Boot', '稳定性', '排障'), 'Spring Boot 接口稳定性排查路径', '从请求链路时间分布开始，逐层找到真实瓶颈。', '/demo/posts/spring-api-debug.md', 101, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/engineering.svg'), 'published', NOW() - INTERVAL 12 DAY, NOW(), NOW() - INTERVAL 2 DAY),
    (900000000000000105, 5, JSON_ARRAY('RAG', 'AI', '知识库'), '用 RAG 做知识问答前要想清楚的五件事', '围绕数据边界、切分、召回和答案约束建立评估。', '/demo/posts/rag-five-questions.md', 103, 1, 'image_text', 'public', JSON_ARRAY('/demo/covers/ai.svg'), 'published', NOW() - INTERVAL 11 DAY, NOW(), NOW() - INTERVAL 3 DAY),
    (900000000000000106, 6, JSON_ARRAY('技术写作', '表达', '结构'), '高质量技术文章如何组织结构', '帮助读者完成从不了解到能实践的认知变化。', '/demo/posts/technical-writing.md', 105, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/writing.svg'), 'published', NOW() - INTERVAL 10 DAY, NOW(), NOW() - INTERVAL 4 DAY),
    (900000000000000107, 7, JSON_ARRAY('复盘', '学习方法', '成长'), '一周复盘模板：让学习真正留下来', '用四个问题识别有效方法，并修正下一周行动。', '/demo/posts/weekly-review.md', 108, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/learning.svg'), 'published', NOW() - INTERVAL 9 DAY, NOW(), NOW() - INTERVAL 5 DAY),
    (900000000000000108, 8, JSON_ARRAY('知识管理', '笔记', '输出'), '从零搭建个人知识库的最小闭环', '让输入、加工、连接、输出和回顾形成循环。', '/demo/posts/knowledge-base.md', 105, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/learning.svg'), 'published', NOW() - INTERVAL 8 DAY, NOW(), NOW() - INTERVAL 6 DAY),
    (900000000000000109, 9, JSON_ARRAY('设计系统', '组件库', '一致性'), '设计系统不是组件库：建立一致性的三个层次', '从基础规则、组件模式到产品原则理解设计系统。', '/demo/posts/design-system.md', 102, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/design.svg'), 'published', NOW() - INTERVAL 7 DAY, NOW(), NOW() - INTERVAL 7 DAY),
    (900000000000000110, 10, JSON_ARRAY('MySQL', '索引', 'SQL'), '数据库索引失效的常见场景', '通过执行计划和数据分布判断索引为何没有生效。', '/demo/posts/database-index.md', 106, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/engineering.svg'), 'published', NOW() - INTERVAL 6 DAY, NOW(), NOW() - INTERVAL 8 DAY),
    (900000000000000111, 11, JSON_ARRAY('代码评审', '协作', '工程质量'), '如何做一场不浪费时间的代码评审', '优先讨论正确性与风险，把风格问题交给工具。', '/demo/posts/code-review.md', 104, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/engineering.svg'), 'published', NOW() - INTERVAL 5 DAY, NOW(), NOW() - INTERVAL 9 DAY),
    (900000000000000112, 12, JSON_ARRAY('职业成长', '项目', '作品集'), '毕业前值得完成的三个真实项目', '用真实反馈、工程质量和实验记录证明能力。', '/demo/posts/real-projects.md', 108, 0, 'image_text', 'public', JSON_ARRAY('/demo/covers/career.svg'), 'published', NOW() - INTERVAL 4 DAY, NOW(), NOW() - INTERVAL 10 DAY)
ON DUPLICATE KEY UPDATE
    tags = VALUES(tags), title = VALUES(title), description = VALUES(description), content_url = VALUES(content_url),
    creator_id = VALUES(creator_id), is_top = VALUES(is_top), type = VALUES(type), visible = VALUES(visible),
    img_urls = VALUES(img_urls), status = VALUES(status), update_time = NOW(), publish_time = VALUES(publish_time);

INSERT INTO following (id, from_user_id, to_user_id, rel_status, created_at, updated_at) VALUES
    (7001, 101, 103, 1, NOW(3) - INTERVAL 12 DAY, NOW(3)),
    (7002, 101, 106, 1, NOW(3) - INTERVAL 11 DAY, NOW(3)),
    (7003, 102, 104, 1, NOW(3) - INTERVAL 10 DAY, NOW(3)),
    (7004, 102, 105, 1, NOW(3) - INTERVAL 9 DAY, NOW(3)),
    (7005, 103, 101, 1, NOW(3) - INTERVAL 8 DAY, NOW(3)),
    (7006, 103, 105, 1, NOW(3) - INTERVAL 7 DAY, NOW(3)),
    (7007, 104, 102, 1, NOW(3) - INTERVAL 6 DAY, NOW(3)),
    (7008, 104, 108, 1, NOW(3) - INTERVAL 5 DAY, NOW(3)),
    (7009, 105, 102, 1, NOW(3) - INTERVAL 5 DAY, NOW(3)),
    (7010, 105, 108, 1, NOW(3) - INTERVAL 4 DAY, NOW(3)),
    (7011, 106, 101, 1, NOW(3) - INTERVAL 4 DAY, NOW(3)),
    (7012, 106, 103, 1, NOW(3) - INTERVAL 3 DAY, NOW(3)),
    (7013, 107, 102, 1, NOW(3) - INTERVAL 3 DAY, NOW(3)),
    (7014, 107, 104, 1, NOW(3) - INTERVAL 2 DAY, NOW(3)),
    (7015, 108, 105, 1, NOW(3) - INTERVAL 2 DAY, NOW(3)),
    (7016, 108, 107, 1, NOW(3) - INTERVAL 1 DAY, NOW(3))
ON DUPLICATE KEY UPDATE rel_status = VALUES(rel_status), updated_at = NOW(3);

INSERT INTO follower (id, to_user_id, from_user_id, rel_status, created_at, updated_at)
SELECT id + 10000, to_user_id, from_user_id, rel_status, created_at, updated_at
FROM following
WHERE id BETWEEN 7001 AND 7016
ON DUPLICATE KEY UPDATE rel_status = VALUES(rel_status), updated_at = NOW(3);

COMMIT;
