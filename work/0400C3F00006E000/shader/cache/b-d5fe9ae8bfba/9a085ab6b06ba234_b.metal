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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c11 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_32 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_30.z;
    float _48 = in.m_30.x;
    float _50 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _52 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _50;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _56 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _54;
    float _58 = _52 * _52;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _60;
    float _64 = fma(_56, _56, _58);
    float _66 = in.m_32.x;
    float _68 = in.m_32.y;
    float _70 = in.m_32.z;
    float _72 = in.m_32.w;
    float _74 = fma(_62, _62, _64);
    float _76 = _46 + (-0.2599999904632568359375);
    float _78 = sqrt(_74);
    float _80 = _76 * _76;
    float _82 = fma(_48, _48, _80);
    float _84 = rsqrt(_82);
    float _86 = _70 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    bool _90 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _92 = isnan(_78);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _98 = _94 || _96;
    float _100 = _72 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _102 = fma(_66, (*spvDescriptorSet0.vp_c11)._m0[21].x, _86);
    float _104 = fma(_68, (*spvDescriptorSet0.vp_c11)._m0[21].y, _100);
    float _106 = _84 * _48;
    float _108 = _76 * _84;
    float _110 = fma(_106, _102, _48);
    float _112 = fma(_108, _86, _46);
    float _114 = _106;
    if (!_98)
    {
        _114 = 1.0;
    }
    float _116 = _114;
    bool _118 = !_98;
    float _120 = _116;
    if (!_118)
    {
        bool _122 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _124 = isnan(_78);
        bool _126 = _122 || _124;
        bool _128 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _130 = _126 || _128;
        if (!_130)
        {
            float _132 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _134 = _78 + _132;
            float _136 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _138 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _136;
            float _140 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _142 = _140 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _144 = 1.0 / _138;
            float _146 = _134 * _144;
            float _148 = fma(_146, _142, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _120 = _148;
            _150 = true;
        }
        else
        {
            bool _152 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _154 = isnan(_78);
            bool _156 = _152 || _154;
            bool _158 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _160 = _156 || _158;
            if (!_160)
            {
                float _162 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _164 = _78 + _162;
                float _166 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _168 = _166 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _170 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _172 = _170 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _174 = 1.0 / _168;
                float _176 = _164 * _174;
                float _178 = fma(_176, _172, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _120 = _178;
                _150 = true;
            }
            else
            {
                _120 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _150 = false;
    float _180 = _120;
    float _182 = in.m_30.y;
    float _184 = _180 + (-1.0);
    float _186 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _188 = _104 + _182;
    float _190 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _192 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _194 = fma(_188, _180, _186);
    float _196 = fma(_110, _180, _190);
    float _198 = fma(_112, _180, _192);
    float _200 = _194 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _202 = _194 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _204 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[1].x, _200);
    float _206 = _194 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[0].x, _202);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[1].z, _204);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[2].x, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[0].z, _208);
    float _216 = _210 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[2].z, _212);
    float _220 = _214 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _222 = _216 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _224 = _218 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _226 = _216 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _228 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[1].x, _222);
    float _232 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[0].x, _226);
    float _234 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[2].x, _228);
    float _236 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[1].z, _230);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[0].z, _232);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[2].z, _234);
    float _242 = _236 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _248 = _242 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _250 = _242 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _256 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[7].x, _248);
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[8].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[9].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[10].x, _254);
    float _264 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[7].z, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[8].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[9].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[10].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _274 = _266 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _272;
    out.gl_Position.y = _274;
    out.gl_Position.z = _276;
    out.gl_Position.w = _278;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_30.z;
    float _48 = in.m_30.x;
    float _50 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _52 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _50;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _56 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _54;
    float _58 = _52 * _52;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _60;
    float _64 = fma(_56, _56, _58);
    float _66 = in.m_32.x;
    float _68 = in.m_32.y;
    float _70 = in.m_32.z;
    float _72 = in.m_32.w;
    float _74 = fma(_62, _62, _64);
    float _76 = _46 + (-0.2599999904632568359375);
    float _78 = sqrt(_74);
    float _80 = _76 * _76;
    float _82 = fma(_48, _48, _80);
    float _84 = rsqrt(_82);
    float _86 = _70 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    bool _90 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _92 = isnan(_78);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _98 = _94 || _96;
    float _100 = _72 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _102 = fma(_66, (*spvDescriptorSet0.vp_c11)._m0[21].x, _86);
    float _104 = fma(_68, (*spvDescriptorSet0.vp_c11)._m0[21].y, _100);
    float _106 = _84 * _48;
    float _108 = _76 * _84;
    float _110 = fma(_106, _102, _48);
    float _112 = fma(_108, _86, _46);
    float _114 = _106;
    if (!_98)
    {
        _114 = 1.0;
    }
    float _116 = _114;
    bool _118 = !_98;
    float _120 = _116;
    if (!_118)
    {
        bool _122 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _124 = isnan(_78);
        bool _126 = _122 || _124;
        bool _128 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _130 = _126 || _128;
        if (!_130)
        {
            float _132 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _134 = _78 + _132;
            float _136 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _138 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _136;
            float _140 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _142 = _140 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _144 = 1.0 / _138;
            float _146 = _134 * _144;
            float _148 = fma(_146, _142, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _120 = _148;
            _150 = true;
        }
        else
        {
            bool _152 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _154 = isnan(_78);
            bool _156 = _152 || _154;
            bool _158 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _160 = _156 || _158;
            if (!_160)
            {
                float _162 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _164 = _78 + _162;
                float _166 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _168 = _166 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _170 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _172 = _170 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _174 = 1.0 / _168;
                float _176 = _164 * _174;
                float _178 = fma(_176, _172, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _120 = _178;
                _150 = true;
            }
            else
            {
                _120 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _150 = false;
    float _180 = _120;
    float _182 = in.m_30.y;
    float _184 = _180 + (-1.0);
    float _186 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _188 = _104 + _182;
    float _190 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _192 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _194 = fma(_188, _180, _186);
    float _196 = fma(_110, _180, _190);
    float _198 = fma(_112, _180, _192);
    float _200 = _194 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _202 = _194 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _204 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[1].x, _200);
    float _206 = _194 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[0].x, _202);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[1].z, _204);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[2].x, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[0].z, _208);
    float _216 = _210 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[2].z, _212);
    float _220 = _214 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _222 = _216 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _224 = _218 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _226 = _216 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _228 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[1].x, _222);
    float _232 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[0].x, _226);
    float _234 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[2].x, _228);
    float _236 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[1].z, _230);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[0].z, _232);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[2].z, _234);
    float _242 = _236 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _248 = _242 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _250 = _242 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _256 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[7].x, _248);
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[8].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[9].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[10].x, _254);
    float _264 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[7].z, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[8].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[9].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[10].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _274 = _266 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _272;
    out.gl_Position.y = _274;
    out.gl_Position.z = _276;
    out.gl_Position.w = _278;
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
    bool _150 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = in.m_30.z;
    float _48 = in.m_30.x;
    float _50 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _52 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _50;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _56 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _54;
    float _58 = _52 * _52;
    float _60 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _62 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _60;
    float _64 = fma(_56, _56, _58);
    float _66 = in.m_32.x;
    float _68 = in.m_32.y;
    float _70 = in.m_32.z;
    float _72 = in.m_32.w;
    float _74 = fma(_62, _62, _64);
    float _76 = _46 + (-0.2599999904632568359375);
    float _78 = sqrt(_74);
    float _80 = _76 * _76;
    float _82 = fma(_48, _48, _80);
    float _84 = rsqrt(_82);
    float _86 = _70 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    bool _90 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _92 = isnan(_78);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _98 = _94 || _96;
    float _100 = _72 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _102 = fma(_66, (*spvDescriptorSet0.vp_c11)._m0[21].x, _86);
    float _104 = fma(_68, (*spvDescriptorSet0.vp_c11)._m0[21].y, _100);
    float _106 = _84 * _48;
    float _108 = _76 * _84;
    float _110 = fma(_106, _102, _48);
    float _112 = fma(_108, _86, _46);
    float _114 = _106;
    if (!_98)
    {
        _114 = 1.0;
    }
    float _116 = _114;
    bool _118 = !_98;
    float _120 = _116;
    if (!_118)
    {
        bool _122 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _124 = isnan(_78);
        bool _126 = _122 || _124;
        bool _128 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _130 = _126 || _128;
        if (!_130)
        {
            float _132 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _134 = _78 + _132;
            float _136 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _138 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _136;
            float _140 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _142 = _140 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _144 = 1.0 / _138;
            float _146 = _134 * _144;
            float _148 = fma(_146, _142, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _120 = _148;
            _150 = true;
        }
        else
        {
            bool _152 = _78 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _154 = isnan(_78);
            bool _156 = _152 || _154;
            bool _158 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _160 = _156 || _158;
            if (!_160)
            {
                float _162 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _164 = _78 + _162;
                float _166 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _168 = _166 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _170 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _172 = _170 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _174 = 1.0 / _168;
                float _176 = _164 * _174;
                float _178 = fma(_176, _172, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _120 = _178;
                _150 = true;
            }
            else
            {
                _120 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _150 = false;
    float _180 = _120;
    float _182 = in.m_30.y;
    float _184 = _180 + (-1.0);
    float _186 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _188 = _104 + _182;
    float _190 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _192 = _184 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _194 = fma(_188, _180, _186);
    float _196 = fma(_110, _180, _190);
    float _198 = fma(_112, _180, _192);
    float _200 = _194 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _202 = _194 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _204 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[1].x, _200);
    float _206 = _194 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _208 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[0].x, _202);
    float _210 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[1].z, _204);
    float _212 = fma(_196, (*spvDescriptorSet0.vp_c7)._m0[2].x, _206);
    float _214 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[0].z, _208);
    float _216 = _210 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[2].z, _212);
    float _220 = _214 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _222 = _216 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _224 = _218 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _226 = _216 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _228 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _230 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[1].x, _222);
    float _232 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[0].x, _226);
    float _234 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[2].x, _228);
    float _236 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[1].z, _230);
    float _238 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[0].z, _232);
    float _240 = fma(_224, (*spvDescriptorSet0.vp_c4)._m0[2].z, _234);
    float _242 = _236 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _248 = _242 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _250 = _242 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _256 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[7].x, _248);
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[8].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[9].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c4)._m0[10].x, _254);
    float _264 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[7].z, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[8].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[9].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c4)._m0[10].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _274 = _266 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _272;
    out.gl_Position.y = _274;
    out.gl_Position.z = _276;
    out.gl_Position.w = _278;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

