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
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _110 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _42;
    float _46 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _46;
    float _50 = _44 * _44;
    float _52 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _52;
    float _56 = fma(_48, _48, _50);
    float _58 = fma(_54, _54, _56);
    float _60 = sqrt(_58);
    bool _64 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _72 = _68 || _70;
    float _74 = _54;
    if (!_72)
    {
        _74 = 1.0;
    }
    float _76 = _74;
    bool _78 = !_72;
    float _80 = _76;
    if (!_78)
    {
        bool _82 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _84 = isnan(_60);
        bool _86 = _82 || _84;
        bool _88 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _90 = _86 || _88;
        if (!_90)
        {
            float _92 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _94 = _60 + _92;
            float _96 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _98 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _96;
            float _100 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _102 = _100 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _104 = 1.0 / _98;
            float _106 = _94 * _104;
            float _108 = fma(_106, _102, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _80 = _108;
            _110 = true;
        }
        else
        {
            bool _112 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _114 = isnan(_60);
            bool _116 = _112 || _114;
            bool _118 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _120 = _116 || _118;
            if (!_120)
            {
                float _122 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _124 = _60 + _122;
                float _126 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _128 = _126 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _130 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _132 = _130 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _134 = 1.0 / _128;
                float _136 = _124 * _134;
                float _138 = fma(_136, _132, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _80 = _138;
                _110 = true;
            }
            else
            {
                _80 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _110 = false;
    float _140 = _80;
    float _142 = in.m_28.x;
    float _144 = in.m_28.y;
    float _146 = in.m_28.z;
    float _148 = _140 + (-1.0);
    float _150 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _152 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _154 = fma(_140, _144, _150);
    float _156 = fma(_140, _142, _152);
    float _158 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _160 = _154 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _164 = fma(_140, _146, _158);
    float _166 = _154 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[2].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[0].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[1].x, _166);
    float _174 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[2].z, _168);
    float _176 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[0].z, _170);
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[1].z, _172);
    float _180 = _174 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _182 = _176 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _184 = _178 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _188 = _180 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _192 = _182 + _190;
    float _194 = _188 * _188;
    float _196 = fma(_192, _192, _194);
    float _198 = _184 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _200 = sqrt(_196);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _208 = _200 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _210 = _178;
    float _212 = _204;
    float _214 = _182;
    float _216 = _206;
    if (!_208)
    {
        _210 = _182;
    }
    float _218 = _210;
    float _220 = _218;
    if (!_208)
    {
        _212 = _180;
    }
    float _222 = _212;
    float _224 = _222;
    if (!_208)
    {
        _214 = _184;
    }
    float _226 = _214;
    bool _228 = !_208;
    float _230 = _226;
    if (!_228)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _236 = _200 + _234;
        float _238 = _184 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _240 = rsqrt(_196);
        float _242 = _236 * _232;
        float _244 = _242 * 0.15915493667125701904296875;
        float _246 = _244 * 6.283185482025146484375;
        float _248 = cos(_246);
        float _250 = _244 * 6.283185482025146484375;
        float _252 = sin(_250);
        float _254 = _248 + (-1.0);
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = fma(_252, _238, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _260 = fma(_184, _248, _256);
        float _262 = _240 * _258;
        float _264 = _260 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _266 = fma(_192, _262, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _268 = fma(_188, _262, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].x, _264);
        float _272 = fma(_268, (*spvDescriptorSet0.vp_c4)._m0[2].z, _270);
        float _274 = _272 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _260;
        _220 = _266;
        _224 = _268;
        _216 = _274;
    }
    float _276 = _230;
    float _278 = _220;
    float _280 = _224;
    float _282 = _216;
    float _284 = _276 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].x, _286);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _288);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _290);
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[8].x, _300);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[7].x, _302);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[9].x, _304);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[10].x, _306);
    float _316 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[8].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[7].z, _310);
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[9].z, _312);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[10].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _326;
    out.gl_Position.y = _324;
    out.gl_Position.z = _328;
    out.gl_Position.w = _330;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _110 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _42;
    float _46 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _46;
    float _50 = _44 * _44;
    float _52 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _52;
    float _56 = fma(_48, _48, _50);
    float _58 = fma(_54, _54, _56);
    float _60 = sqrt(_58);
    bool _64 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _72 = _68 || _70;
    float _74 = _54;
    if (!_72)
    {
        _74 = 1.0;
    }
    float _76 = _74;
    bool _78 = !_72;
    float _80 = _76;
    if (!_78)
    {
        bool _82 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _84 = isnan(_60);
        bool _86 = _82 || _84;
        bool _88 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _90 = _86 || _88;
        if (!_90)
        {
            float _92 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _94 = _60 + _92;
            float _96 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _98 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _96;
            float _100 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _102 = _100 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _104 = 1.0 / _98;
            float _106 = _94 * _104;
            float _108 = fma(_106, _102, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _80 = _108;
            _110 = true;
        }
        else
        {
            bool _112 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _114 = isnan(_60);
            bool _116 = _112 || _114;
            bool _118 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _120 = _116 || _118;
            if (!_120)
            {
                float _122 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _124 = _60 + _122;
                float _126 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _128 = _126 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _130 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _132 = _130 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _134 = 1.0 / _128;
                float _136 = _124 * _134;
                float _138 = fma(_136, _132, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _80 = _138;
                _110 = true;
            }
            else
            {
                _80 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _110 = false;
    float _140 = _80;
    float _142 = in.m_28.x;
    float _144 = in.m_28.y;
    float _146 = in.m_28.z;
    float _148 = _140 + (-1.0);
    float _150 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _152 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _154 = fma(_140, _144, _150);
    float _156 = fma(_140, _142, _152);
    float _158 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _160 = _154 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _164 = fma(_140, _146, _158);
    float _166 = _154 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[2].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[0].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[1].x, _166);
    float _174 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[2].z, _168);
    float _176 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[0].z, _170);
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[1].z, _172);
    float _180 = _174 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _182 = _176 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _184 = _178 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _188 = _180 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _192 = _182 + _190;
    float _194 = _188 * _188;
    float _196 = fma(_192, _192, _194);
    float _198 = _184 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _200 = sqrt(_196);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _208 = _200 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _210 = _178;
    float _212 = _204;
    float _214 = _182;
    float _216 = _206;
    if (!_208)
    {
        _210 = _182;
    }
    float _218 = _210;
    float _220 = _218;
    if (!_208)
    {
        _212 = _180;
    }
    float _222 = _212;
    float _224 = _222;
    if (!_208)
    {
        _214 = _184;
    }
    float _226 = _214;
    bool _228 = !_208;
    float _230 = _226;
    if (!_228)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _236 = _200 + _234;
        float _238 = _184 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _240 = rsqrt(_196);
        float _242 = _236 * _232;
        float _244 = _242 * 0.15915493667125701904296875;
        float _246 = _244 * 6.283185482025146484375;
        float _248 = cos(_246);
        float _250 = _244 * 6.283185482025146484375;
        float _252 = sin(_250);
        float _254 = _248 + (-1.0);
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = fma(_252, _238, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _260 = fma(_184, _248, _256);
        float _262 = _240 * _258;
        float _264 = _260 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _266 = fma(_192, _262, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _268 = fma(_188, _262, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].x, _264);
        float _272 = fma(_268, (*spvDescriptorSet0.vp_c4)._m0[2].z, _270);
        float _274 = _272 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _260;
        _220 = _266;
        _224 = _268;
        _216 = _274;
    }
    float _276 = _230;
    float _278 = _220;
    float _280 = _224;
    float _282 = _216;
    float _284 = _276 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].x, _286);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _288);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _290);
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[8].x, _300);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[7].x, _302);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[9].x, _304);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[10].x, _306);
    float _316 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[8].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[7].z, _310);
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[9].z, _312);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[10].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _326;
    out.gl_Position.y = _324;
    out.gl_Position.z = _328;
    out.gl_Position.w = _330;
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
    bool _110 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _42 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _42;
    float _46 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _46;
    float _50 = _44 * _44;
    float _52 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _52;
    float _56 = fma(_48, _48, _50);
    float _58 = fma(_54, _54, _56);
    float _60 = sqrt(_58);
    bool _64 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _72 = _68 || _70;
    float _74 = _54;
    if (!_72)
    {
        _74 = 1.0;
    }
    float _76 = _74;
    bool _78 = !_72;
    float _80 = _76;
    if (!_78)
    {
        bool _82 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _84 = isnan(_60);
        bool _86 = _82 || _84;
        bool _88 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _90 = _86 || _88;
        if (!_90)
        {
            float _92 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _94 = _60 + _92;
            float _96 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _98 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _96;
            float _100 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _102 = _100 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _104 = 1.0 / _98;
            float _106 = _94 * _104;
            float _108 = fma(_106, _102, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _80 = _108;
            _110 = true;
        }
        else
        {
            bool _112 = _60 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _114 = isnan(_60);
            bool _116 = _112 || _114;
            bool _118 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _120 = _116 || _118;
            if (!_120)
            {
                float _122 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _124 = _60 + _122;
                float _126 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _128 = _126 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _130 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _132 = _130 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _134 = 1.0 / _128;
                float _136 = _124 * _134;
                float _138 = fma(_136, _132, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _80 = _138;
                _110 = true;
            }
            else
            {
                _80 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _110 = false;
    float _140 = _80;
    float _142 = in.m_28.x;
    float _144 = in.m_28.y;
    float _146 = in.m_28.z;
    float _148 = _140 + (-1.0);
    float _150 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _152 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _154 = fma(_140, _144, _150);
    float _156 = fma(_140, _142, _152);
    float _158 = _148 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _160 = _154 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _164 = fma(_140, _146, _158);
    float _166 = _154 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[2].x, _160);
    float _170 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[0].x, _162);
    float _172 = fma(_156, (*spvDescriptorSet0.vp_c7)._m0[1].x, _166);
    float _174 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[2].z, _168);
    float _176 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[0].z, _170);
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c7)._m0[1].z, _172);
    float _180 = _174 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _182 = _176 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _184 = _178 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _188 = _180 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _192 = _182 + _190;
    float _194 = _188 * _188;
    float _196 = fma(_192, _192, _194);
    float _198 = _184 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _200 = sqrt(_196);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[2].x, _198);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _206 = _204 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _208 = _200 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _210 = _178;
    float _212 = _204;
    float _214 = _182;
    float _216 = _206;
    if (!_208)
    {
        _210 = _182;
    }
    float _218 = _210;
    float _220 = _218;
    if (!_208)
    {
        _212 = _180;
    }
    float _222 = _212;
    float _224 = _222;
    if (!_208)
    {
        _214 = _184;
    }
    float _226 = _214;
    bool _228 = !_208;
    float _230 = _226;
    if (!_228)
    {
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _236 = _200 + _234;
        float _238 = _184 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _240 = rsqrt(_196);
        float _242 = _236 * _232;
        float _244 = _242 * 0.15915493667125701904296875;
        float _246 = _244 * 6.283185482025146484375;
        float _248 = cos(_246);
        float _250 = _244 * 6.283185482025146484375;
        float _252 = sin(_250);
        float _254 = _248 + (-1.0);
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = fma(_252, _238, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _260 = fma(_184, _248, _256);
        float _262 = _240 * _258;
        float _264 = _260 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _266 = fma(_192, _262, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _268 = fma(_188, _262, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].x, _264);
        float _272 = fma(_268, (*spvDescriptorSet0.vp_c4)._m0[2].z, _270);
        float _274 = _272 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _260;
        _220 = _266;
        _224 = _268;
        _216 = _274;
    }
    float _276 = _230;
    float _278 = _220;
    float _280 = _224;
    float _282 = _216;
    float _284 = _276 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].x, _286);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _288);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _290);
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[8].x, _300);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[7].x, _302);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[9].x, _304);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[10].x, _306);
    float _316 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[8].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[7].z, _310);
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[9].z, _312);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c4)._m0[10].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _326;
    out.gl_Position.y = _324;
    out.gl_Position.z = _328;
    out.gl_Position.w = _330;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

