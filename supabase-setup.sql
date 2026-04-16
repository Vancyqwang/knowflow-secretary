-- ============================================================
-- 嘘嘘 (Xūxū) - 简化版数据库（无需登录）
-- ============================================================

-- 1. 每日学习记录
CREATE TABLE IF NOT EXISTS daily_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    domain TEXT NOT NULL DEFAULT '其他',
    content TEXT NOT NULL,
    duration_min INTEGER DEFAULT 30,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. 知识卡片
CREATE TABLE IF NOT EXISTS knowledge_cards (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    domain TEXT DEFAULT '其他',
    tags JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. 灵感箱
CREATE TABLE IF NOT EXISTS ideas (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content TEXT NOT NULL,
    status TEXT DEFAULT 'explore' CHECK (status IN ('explore','doing','done')),
    landed_at DATE,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 4. 项目作品集
CREATE TABLE IF NOT EXISTS projects (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    url TEXT,
    doc_path TEXT,
    image_url TEXT,
    completed_at DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 5. 心灵手账（日记 + 自我发现）
CREATE TABLE IF NOT EXISTS journal (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    type TEXT DEFAULT 'diary' CHECK (type IN ('diary','discovery')),
    prompt TEXT,
    content TEXT NOT NULL,
    mood TEXT DEFAULT '😌',
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 6. 学习方向（按半年周期）
CREATE TABLE IF NOT EXISTS periods (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    period TEXT NOT NULL,
    domains JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT now(),
    UNIQUE(period)
);

-- 开放所有表的读写权限（简化版，无需登录）
ALTER TABLE daily_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE knowledge_cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE ideas ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE journal ENABLE ROW LEVEL SECURITY;
ALTER TABLE periods ENABLE ROW LEVEL SECURITY;

-- 允许匿名访问所有操作
CREATE POLICY "allow_all" ON daily_logs FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON knowledge_cards FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON ideas FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON projects FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON journal FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all" ON periods FOR ALL USING (true) WITH CHECK (true);
