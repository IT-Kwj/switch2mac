#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_27 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _142 = false;
    bool _126 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    bool _47 = _41 > 0.0;
    bool _49 = _43 > 0.0;
    bool _51 = _41 >= 0.0;
    bool _53 = isnan(_41);
    bool _55 = _51 || _53;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = _43 >= 0.0;
    bool _63 = isnan(_43);
    bool _65 = _61 || _63;
    bool _67 = isnan(0.0);
    bool _69 = _65 || _67;
    float _71 = _59 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _73 = _69 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _76 = ~as_type<int>(_71);
    int _78 = _76 + 1;
    int _80 = _78 + 1;
    int _82 = _80;
    float _84 = _73;
    float _86 = _71;
    if (!_47)
    {
        int _88 = -as_type<int>(_71);
        _82 = _88;
    }
    int _90 = _82;
    int _92 = ~as_type<int>(_73);
    int _94 = _92 + 1;
    int _96 = _94 + 1;
    int _98 = _96;
    if (!_49)
    {
        int _100 = -as_type<int>(_73);
        _98 = _100;
    }
    int _102 = _98;
    float _104 = float(_90);
    float _106 = float(_102);
    out.gl_Position.x = _104;
    out.gl_Position.y = _106;
    bool _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _110 = !_108;
    float _112 = as_type<float>(_102);
    float _114 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _128;
    float _130;
    float _132;
    float _134;
    float _136;
    float _138;
    float _140;
    if (!_110)
    {
        bool _116 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _118 = !_116;
        if (!_118)
        {
            bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _122 = !_120;
            if (!_122)
            {
                bool _124 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _126 = _124;
                if (!_126)
                {
                    _128 = 0.0;
                    _130 = 1.0;
                    _132 = 0.0;
                    _134 = -1.0;
                    _136 = 0.0;
                    _138 = 0.0;
                    _140 = -1.0;
                    _142 = true;
                }
            }
            else
            {
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 1.0;
                _136 = 0.0;
                _138 = 0.0;
                _140 = 1.0;
                _142 = true;
            }
        }
        else
        {
            _128 = 1.0;
            _130 = 0.0;
            _132 = -1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
            _142 = true;
        }
    }
    if ((!_142) || _126)
    {
        bool _144;
        if (!_126)
        {
            _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_144) || _126)
        {
            if (!_126)
            {
                bool _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _148 = 0.0;
                if (!_146)
                {
                    _148 = 0.0;
                }
                float _150 = _148;
                float _152 = 0.0;
                _134 = _150;
                if (!_146)
                {
                    _152 = -1.0;
                }
                float _154 = _152;
                _136 = _154;
                if (!_146)
                {
                    _84 = 1.0;
                }
                float _156 = _84;
                float _158 = 0.0;
                _130 = _156;
                if (!_146)
                {
                    _158 = 0.0;
                }
                float _160 = _158;
                _132 = _160;
                if (!_146)
                {
                    _112 = 1.0;
                }
                float _162 = _112;
                _138 = _162;
                if (!_146)
                {
                    _86 = 0.0;
                }
                float _164 = _86;
                _128 = _164;
                if (!_146)
                {
                    _114 = 0.0;
                }
                float _166 = _114;
                bool _168 = !_146;
                _140 = _166;
                _142 = _168;
            }
            if ((!_142) || _126)
            {
                _126 = false;
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 0.0;
                _136 = 1.0;
                _138 = -1.0;
                _140 = 0.0;
                _142 = true;
            }
        }
        else
        {
            _128 = -1.0;
            _130 = 0.0;
            _132 = 1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
        }
    }
    _142 = false;
    float _170 = _128;
    float _172 = _130;
    float _174 = _132;
    float _176 = _134;
    float _178 = _136;
    float _180 = _138;
    float _182 = _140;
    float _184 = _106 * _170;
    float _186 = fma(_106, _172, _174);
    float _188 = fma(_104, _176, _178);
    float _190 = fma(_104, _180, _184);
    float _192 = _186 * _186;
    float _194 = _190 + _182;
    float _196 = fma(_188, _188, _192);
    out.m_25.x = (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _188 * _200;
    float _204 = _186 * _200;
    float _206 = _194 * _200;
    out.m_27.x = _202;
    out.m_27.y = _204;
    out.m_27.z = _206;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _142 = false;
    bool _126 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    bool _47 = _41 > 0.0;
    bool _49 = _43 > 0.0;
    bool _51 = _41 >= 0.0;
    bool _53 = isnan(_41);
    bool _55 = _51 || _53;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = _43 >= 0.0;
    bool _63 = isnan(_43);
    bool _65 = _61 || _63;
    bool _67 = isnan(0.0);
    bool _69 = _65 || _67;
    float _71 = _59 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _73 = _69 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _76 = ~as_type<int>(_71);
    int _78 = _76 + 1;
    int _80 = _78 + 1;
    int _82 = _80;
    float _84 = _73;
    float _86 = _71;
    if (!_47)
    {
        int _88 = -as_type<int>(_71);
        _82 = _88;
    }
    int _90 = _82;
    int _92 = ~as_type<int>(_73);
    int _94 = _92 + 1;
    int _96 = _94 + 1;
    int _98 = _96;
    if (!_49)
    {
        int _100 = -as_type<int>(_73);
        _98 = _100;
    }
    int _102 = _98;
    float _104 = float(_90);
    float _106 = float(_102);
    out.gl_Position.x = _104;
    out.gl_Position.y = _106;
    bool _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _110 = !_108;
    float _112 = as_type<float>(_102);
    float _114 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _128;
    float _130;
    float _132;
    float _134;
    float _136;
    float _138;
    float _140;
    if (!_110)
    {
        bool _116 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _118 = !_116;
        if (!_118)
        {
            bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _122 = !_120;
            if (!_122)
            {
                bool _124 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _126 = _124;
                if (!_126)
                {
                    _128 = 0.0;
                    _130 = 1.0;
                    _132 = 0.0;
                    _134 = -1.0;
                    _136 = 0.0;
                    _138 = 0.0;
                    _140 = -1.0;
                    _142 = true;
                }
            }
            else
            {
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 1.0;
                _136 = 0.0;
                _138 = 0.0;
                _140 = 1.0;
                _142 = true;
            }
        }
        else
        {
            _128 = 1.0;
            _130 = 0.0;
            _132 = -1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
            _142 = true;
        }
    }
    if ((!_142) || _126)
    {
        bool _144;
        if (!_126)
        {
            _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_144) || _126)
        {
            if (!_126)
            {
                bool _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _148 = 0.0;
                if (!_146)
                {
                    _148 = 0.0;
                }
                float _150 = _148;
                float _152 = 0.0;
                _134 = _150;
                if (!_146)
                {
                    _152 = -1.0;
                }
                float _154 = _152;
                _136 = _154;
                if (!_146)
                {
                    _84 = 1.0;
                }
                float _156 = _84;
                float _158 = 0.0;
                _130 = _156;
                if (!_146)
                {
                    _158 = 0.0;
                }
                float _160 = _158;
                _132 = _160;
                if (!_146)
                {
                    _112 = 1.0;
                }
                float _162 = _112;
                _138 = _162;
                if (!_146)
                {
                    _86 = 0.0;
                }
                float _164 = _86;
                _128 = _164;
                if (!_146)
                {
                    _114 = 0.0;
                }
                float _166 = _114;
                bool _168 = !_146;
                _140 = _166;
                _142 = _168;
            }
            if ((!_142) || _126)
            {
                _126 = false;
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 0.0;
                _136 = 1.0;
                _138 = -1.0;
                _140 = 0.0;
                _142 = true;
            }
        }
        else
        {
            _128 = -1.0;
            _130 = 0.0;
            _132 = 1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
        }
    }
    _142 = false;
    float _170 = _128;
    float _172 = _130;
    float _174 = _132;
    float _176 = _134;
    float _178 = _136;
    float _180 = _138;
    float _182 = _140;
    float _184 = _106 * _170;
    float _186 = fma(_106, _172, _174);
    float _188 = fma(_104, _176, _178);
    float _190 = fma(_104, _180, _184);
    float _192 = _186 * _186;
    float _194 = _190 + _182;
    float _196 = fma(_188, _188, _192);
    out.m_25.x = (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _188 * _200;
    float _204 = _186 * _200;
    float _206 = _194 * _200;
    out.m_27.x = _202;
    out.m_27.y = _204;
    out.m_27.z = _206;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _142 = false;
    bool _126 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    bool _47 = _41 > 0.0;
    bool _49 = _43 > 0.0;
    bool _51 = _41 >= 0.0;
    bool _53 = isnan(_41);
    bool _55 = _51 || _53;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = _43 >= 0.0;
    bool _63 = isnan(_43);
    bool _65 = _61 || _63;
    bool _67 = isnan(0.0);
    bool _69 = _65 || _67;
    float _71 = _59 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _73 = _69 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _76 = ~as_type<int>(_71);
    int _78 = _76 + 1;
    int _80 = _78 + 1;
    int _82 = _80;
    float _84 = _73;
    float _86 = _71;
    if (!_47)
    {
        int _88 = -as_type<int>(_71);
        _82 = _88;
    }
    int _90 = _82;
    int _92 = ~as_type<int>(_73);
    int _94 = _92 + 1;
    int _96 = _94 + 1;
    int _98 = _96;
    if (!_49)
    {
        int _100 = -as_type<int>(_73);
        _98 = _100;
    }
    int _102 = _98;
    float _104 = float(_90);
    float _106 = float(_102);
    out.gl_Position.x = _104;
    out.gl_Position.y = _106;
    bool _108 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _110 = !_108;
    float _112 = as_type<float>(_102);
    float _114 = (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _128;
    float _130;
    float _132;
    float _134;
    float _136;
    float _138;
    float _140;
    if (!_110)
    {
        bool _116 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _118 = !_116;
        if (!_118)
        {
            bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _122 = !_120;
            if (!_122)
            {
                bool _124 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _126 = _124;
                if (!_126)
                {
                    _128 = 0.0;
                    _130 = 1.0;
                    _132 = 0.0;
                    _134 = -1.0;
                    _136 = 0.0;
                    _138 = 0.0;
                    _140 = -1.0;
                    _142 = true;
                }
            }
            else
            {
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 1.0;
                _136 = 0.0;
                _138 = 0.0;
                _140 = 1.0;
                _142 = true;
            }
        }
        else
        {
            _128 = 1.0;
            _130 = 0.0;
            _132 = -1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
            _142 = true;
        }
    }
    if ((!_142) || _126)
    {
        bool _144;
        if (!_126)
        {
            _144 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_144) || _126)
        {
            if (!_126)
            {
                bool _146 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _148 = 0.0;
                if (!_146)
                {
                    _148 = 0.0;
                }
                float _150 = _148;
                float _152 = 0.0;
                _134 = _150;
                if (!_146)
                {
                    _152 = -1.0;
                }
                float _154 = _152;
                _136 = _154;
                if (!_146)
                {
                    _84 = 1.0;
                }
                float _156 = _84;
                float _158 = 0.0;
                _130 = _156;
                if (!_146)
                {
                    _158 = 0.0;
                }
                float _160 = _158;
                _132 = _160;
                if (!_146)
                {
                    _112 = 1.0;
                }
                float _162 = _112;
                _138 = _162;
                if (!_146)
                {
                    _86 = 0.0;
                }
                float _164 = _86;
                _128 = _164;
                if (!_146)
                {
                    _114 = 0.0;
                }
                float _166 = _114;
                bool _168 = !_146;
                _140 = _166;
                _142 = _168;
            }
            if ((!_142) || _126)
            {
                _126 = false;
                _128 = 0.0;
                _130 = 1.0;
                _132 = 0.0;
                _134 = 0.0;
                _136 = 1.0;
                _138 = -1.0;
                _140 = 0.0;
                _142 = true;
            }
        }
        else
        {
            _128 = -1.0;
            _130 = 0.0;
            _132 = 1.0;
            _134 = 1.0;
            _136 = 0.0;
            _138 = 0.0;
            _140 = 0.0;
        }
    }
    _142 = false;
    float _170 = _128;
    float _172 = _130;
    float _174 = _132;
    float _176 = _134;
    float _178 = _136;
    float _180 = _138;
    float _182 = _140;
    float _184 = _106 * _170;
    float _186 = fma(_106, _172, _174);
    float _188 = fma(_104, _176, _178);
    float _190 = fma(_104, _180, _184);
    float _192 = _186 * _186;
    float _194 = _190 + _182;
    float _196 = fma(_188, _188, _192);
    out.m_25.x = (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _188 * _200;
    float _204 = _186 * _200;
    float _206 = _194 * _200;
    out.m_27.x = _202;
    out.m_27.y = _204;
    out.m_27.z = _206;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

