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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c4 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _42 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c7)._m0[1].x, _40);
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[0].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _46 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c7)._m0[1].z, _42);
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _44);
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _56 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c4)._m0[2].x, _48);
    float _58 = _50 * _50;
    float _60 = sqrt(_46);
    float _62 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c4)._m0[2].z, _56);
    float _64 = fma(_54, _54, _58);
    float _66 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _52);
    float _68 = -_62;
    float _70 = fma(_68, (*spvDescriptorSet0.vp_c4)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[1].y);
    float _72 = -_62;
    float _74 = fma(_72, (*spvDescriptorSet0.vp_c4)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[1].x);
    float _76 = -_62;
    float _78 = fma(_76, (*spvDescriptorSet0.vp_c4)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[1].z);
    float _80 = sqrt(_64);
    float _82 = _70 * _70;
    float _84 = _74 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _86 = _78 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _88 = _70 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _90 = fma(_74, _74, _82);
    float _92 = -_84;
    float _94 = fma(_78, (*spvDescriptorSet0.vp_c4)._m0[2].x, _92);
    float _96 = -_86;
    float _98 = fma(_70, (*spvDescriptorSet0.vp_c4)._m0[2].z, _96);
    float _100 = -_88;
    float _102 = fma(_74, (*spvDescriptorSet0.vp_c4)._m0[2].y, _100);
    float _104 = fma(_78, _78, _90);
    float _106 = _94 * _94;
    float _108 = in.m_26.x;
    float _110 = in.m_26.y;
    float _112 = in.m_26.z;
    float _114 = sqrt(_66);
    float _116 = fma(_98, _98, _106);
    float _118 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    bool _122 = _80 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _126 = fma(_102, _102, _116);
    float _128 = rsqrt(_104);
    float _130 = precise::max(0.0, _118);
    float _132 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _124);
    float _134 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _136 = -_130;
    float _138 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[26].w, _136);
    float _140 = rsqrt(_126);
    float _142 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _132);
    float _144 = _104;
    float _146 = _132;
    float _148 = _138;
    if (!_122)
    {
        float _150 = -_54;
        float _152 = _150 + (-0.0);
        _144 = _152;
    }
    float _154 = _144;
    float _156 = _154;
    if (!_122)
    {
        float _158 = -_50;
        float _160 = _158 + (-0.0);
        _146 = _160;
    }
    float _162 = _146;
    bool _164 = !_122;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _80 + _170;
        float _174 = rsqrt(_64);
        float _176 = _172 * _168;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _138 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _182 = _178 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _178 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _194 = fma(_188, _180, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _196 = fma(_138, _184, _192);
        float _198 = -_194;
        float _200 = _174 * _198;
        float _202 = _54 * _200;
        float _204 = _50 * _200;
        _148 = _196;
        _156 = _202;
        _166 = _204;
    }
    float _206 = _148;
    float _208 = _156;
    float _210 = _166;
    float _212 = _206 * _206;
    float _214 = _128 * _60;
    float _216 = _110 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _218 = sqrt(_142);
    float _220 = fma(_208, _208, _212);
    float _222 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _224 = _216 * _214;
    float _226 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _228 = fma(_210, _210, _220);
    float _230 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _232 = _108 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _234 = _140 * _114;
    float _236 = rsqrt(_228);
    float _238 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _226);
    float _240 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _222);
    float _242 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _230);
    float _244 = _78 * _224;
    float _246 = _232 * _234;
    float _248 = _70 * _224;
    float _250 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _240);
    float _252 = _112 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _254 = fma(_102, _246, _244);
    float _256 = fma(_94, _246, _248);
    float _258 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _260 = _74 * _224;
    float _262 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _238);
    float _264 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _242);
    float _266 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _268 = _236 * _206;
    float _270 = _236 * _208;
    float _272 = fma(_252, _258, _254);
    float _274 = fma(_98, _246, _260);
    float _276 = _250 + _268;
    float _278 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _280 = _236 * _210;
    float _282 = fma(_252, _266, _256);
    float _284 = _262 + _270;
    float _286 = -_268;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[15].z, _286);
    float _290 = fma(_252, _278, _274);
    float _292 = _264 + _280;
    float _294 = -_270;
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c7)._m0[15].z, _294);
    float _298 = _282 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _304 = -_280;
    float _306 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[15].z, _304);
    float _308 = _290 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _314 = _298 + _302;
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _320 = _272 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _322 = _308 + _312;
    float _324 = _314 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _326 = _314 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _328 = _320 + _318;
    float _330 = _314 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[1].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[0].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _338 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[1].z, _332);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[0].z, _334);
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[2].z, _336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _346 = _340 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _348 = _342 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _350 = _344 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _352 = _344 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _354 = _344 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[10].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[7].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[8].x, _354);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[10].z, _356);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[7].z, _358);
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[8].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _374 = _368 * 0.999998986721038818359375;
    out.gl_Position.x = _370;
    out.gl_Position.y = _372;
    out.gl_Position.z = _374;
    out.gl_Position.w = _368;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _42 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c7)._m0[1].x, _40);
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[0].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _46 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c7)._m0[1].z, _42);
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _44);
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _56 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c4)._m0[2].x, _48);
    float _58 = _50 * _50;
    float _60 = sqrt(_46);
    float _62 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c4)._m0[2].z, _56);
    float _64 = fma(_54, _54, _58);
    float _66 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _52);
    float _68 = -_62;
    float _70 = fma(_68, (*spvDescriptorSet0.vp_c4)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[1].y);
    float _72 = -_62;
    float _74 = fma(_72, (*spvDescriptorSet0.vp_c4)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[1].x);
    float _76 = -_62;
    float _78 = fma(_76, (*spvDescriptorSet0.vp_c4)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[1].z);
    float _80 = sqrt(_64);
    float _82 = _70 * _70;
    float _84 = _74 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _86 = _78 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _88 = _70 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _90 = fma(_74, _74, _82);
    float _92 = -_84;
    float _94 = fma(_78, (*spvDescriptorSet0.vp_c4)._m0[2].x, _92);
    float _96 = -_86;
    float _98 = fma(_70, (*spvDescriptorSet0.vp_c4)._m0[2].z, _96);
    float _100 = -_88;
    float _102 = fma(_74, (*spvDescriptorSet0.vp_c4)._m0[2].y, _100);
    float _104 = fma(_78, _78, _90);
    float _106 = _94 * _94;
    float _108 = in.m_26.x;
    float _110 = in.m_26.y;
    float _112 = in.m_26.z;
    float _114 = sqrt(_66);
    float _116 = fma(_98, _98, _106);
    float _118 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    bool _122 = _80 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _126 = fma(_102, _102, _116);
    float _128 = rsqrt(_104);
    float _130 = precise::max(0.0, _118);
    float _132 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _124);
    float _134 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _136 = -_130;
    float _138 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[26].w, _136);
    float _140 = rsqrt(_126);
    float _142 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _132);
    float _144 = _104;
    float _146 = _132;
    float _148 = _138;
    if (!_122)
    {
        float _150 = -_54;
        float _152 = _150 + (-0.0);
        _144 = _152;
    }
    float _154 = _144;
    float _156 = _154;
    if (!_122)
    {
        float _158 = -_50;
        float _160 = _158 + (-0.0);
        _146 = _160;
    }
    float _162 = _146;
    bool _164 = !_122;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _80 + _170;
        float _174 = rsqrt(_64);
        float _176 = _172 * _168;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _138 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _182 = _178 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _178 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _194 = fma(_188, _180, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _196 = fma(_138, _184, _192);
        float _198 = -_194;
        float _200 = _174 * _198;
        float _202 = _54 * _200;
        float _204 = _50 * _200;
        _148 = _196;
        _156 = _202;
        _166 = _204;
    }
    float _206 = _148;
    float _208 = _156;
    float _210 = _166;
    float _212 = _206 * _206;
    float _214 = _128 * _60;
    float _216 = _110 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _218 = sqrt(_142);
    float _220 = fma(_208, _208, _212);
    float _222 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _224 = _216 * _214;
    float _226 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _228 = fma(_210, _210, _220);
    float _230 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _232 = _108 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _234 = _140 * _114;
    float _236 = rsqrt(_228);
    float _238 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _226);
    float _240 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _222);
    float _242 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _230);
    float _244 = _78 * _224;
    float _246 = _232 * _234;
    float _248 = _70 * _224;
    float _250 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _240);
    float _252 = _112 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _254 = fma(_102, _246, _244);
    float _256 = fma(_94, _246, _248);
    float _258 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _260 = _74 * _224;
    float _262 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _238);
    float _264 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _242);
    float _266 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _268 = _236 * _206;
    float _270 = _236 * _208;
    float _272 = fma(_252, _258, _254);
    float _274 = fma(_98, _246, _260);
    float _276 = _250 + _268;
    float _278 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _280 = _236 * _210;
    float _282 = fma(_252, _266, _256);
    float _284 = _262 + _270;
    float _286 = -_268;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[15].z, _286);
    float _290 = fma(_252, _278, _274);
    float _292 = _264 + _280;
    float _294 = -_270;
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c7)._m0[15].z, _294);
    float _298 = _282 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _304 = -_280;
    float _306 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[15].z, _304);
    float _308 = _290 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _314 = _298 + _302;
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _320 = _272 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _322 = _308 + _312;
    float _324 = _314 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _326 = _314 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _328 = _320 + _318;
    float _330 = _314 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[1].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[0].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _338 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[1].z, _332);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[0].z, _334);
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[2].z, _336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _346 = _340 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _348 = _342 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _350 = _344 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _352 = _344 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _354 = _344 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[10].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[7].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[8].x, _354);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[10].z, _356);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[7].z, _358);
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[8].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _374 = _368 * 0.999998986721038818359375;
    out.gl_Position.x = _370;
    out.gl_Position.y = _372;
    out.gl_Position.z = _374;
    out.gl_Position.w = _368;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _42 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c7)._m0[1].x, _40);
    float _44 = (*spvDescriptorSet0.vp_c7)._m0[0].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _46 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c7)._m0[1].z, _42);
    float _48 = (*spvDescriptorSet0.vp_c7)._m0[1].y * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _50 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _52 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _44);
    float _54 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _56 = fma((*spvDescriptorSet0.vp_c7)._m0[1].x, (*spvDescriptorSet0.vp_c4)._m0[2].x, _48);
    float _58 = _50 * _50;
    float _60 = sqrt(_46);
    float _62 = fma((*spvDescriptorSet0.vp_c7)._m0[1].z, (*spvDescriptorSet0.vp_c4)._m0[2].z, _56);
    float _64 = fma(_54, _54, _58);
    float _66 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _52);
    float _68 = -_62;
    float _70 = fma(_68, (*spvDescriptorSet0.vp_c4)._m0[2].y, (*spvDescriptorSet0.vp_c7)._m0[1].y);
    float _72 = -_62;
    float _74 = fma(_72, (*spvDescriptorSet0.vp_c4)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[1].x);
    float _76 = -_62;
    float _78 = fma(_76, (*spvDescriptorSet0.vp_c4)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[1].z);
    float _80 = sqrt(_64);
    float _82 = _70 * _70;
    float _84 = _74 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _86 = _78 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _88 = _70 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _90 = fma(_74, _74, _82);
    float _92 = -_84;
    float _94 = fma(_78, (*spvDescriptorSet0.vp_c4)._m0[2].x, _92);
    float _96 = -_86;
    float _98 = fma(_70, (*spvDescriptorSet0.vp_c4)._m0[2].z, _96);
    float _100 = -_88;
    float _102 = fma(_74, (*spvDescriptorSet0.vp_c4)._m0[2].y, _100);
    float _104 = fma(_78, _78, _90);
    float _106 = _94 * _94;
    float _108 = in.m_26.x;
    float _110 = in.m_26.y;
    float _112 = in.m_26.z;
    float _114 = sqrt(_66);
    float _116 = fma(_98, _98, _106);
    float _118 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    bool _122 = _80 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _124 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _126 = fma(_102, _102, _116);
    float _128 = rsqrt(_104);
    float _130 = precise::max(0.0, _118);
    float _132 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _124);
    float _134 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _136 = -_130;
    float _138 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[26].w, _136);
    float _140 = rsqrt(_126);
    float _142 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _132);
    float _144 = _104;
    float _146 = _132;
    float _148 = _138;
    if (!_122)
    {
        float _150 = -_54;
        float _152 = _150 + (-0.0);
        _144 = _152;
    }
    float _154 = _144;
    float _156 = _154;
    if (!_122)
    {
        float _158 = -_50;
        float _160 = _158 + (-0.0);
        _146 = _160;
    }
    float _162 = _146;
    bool _164 = !_122;
    float _166 = _162;
    if (!_164)
    {
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _172 = _80 + _170;
        float _174 = rsqrt(_64);
        float _176 = _172 * _168;
        float _178 = _176 * 0.15915493667125701904296875;
        float _180 = _138 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _182 = _178 * 6.283185482025146484375;
        float _184 = cos(_182);
        float _186 = _178 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 + (-1.0);
        float _192 = _190 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _194 = fma(_188, _180, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _196 = fma(_138, _184, _192);
        float _198 = -_194;
        float _200 = _174 * _198;
        float _202 = _54 * _200;
        float _204 = _50 * _200;
        _148 = _196;
        _156 = _202;
        _166 = _204;
    }
    float _206 = _148;
    float _208 = _156;
    float _210 = _166;
    float _212 = _206 * _206;
    float _214 = _128 * _60;
    float _216 = _110 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _218 = sqrt(_142);
    float _220 = fma(_208, _208, _212);
    float _222 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _224 = _216 * _214;
    float _226 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _228 = fma(_210, _210, _220);
    float _230 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _232 = _108 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _234 = _140 * _114;
    float _236 = rsqrt(_228);
    float _238 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _226);
    float _240 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _222);
    float _242 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _230);
    float _244 = _78 * _224;
    float _246 = _232 * _234;
    float _248 = _70 * _224;
    float _250 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _240);
    float _252 = _112 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _254 = fma(_102, _246, _244);
    float _256 = fma(_94, _246, _248);
    float _258 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].z;
    float _260 = _74 * _224;
    float _262 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _238);
    float _264 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _242);
    float _266 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _268 = _236 * _206;
    float _270 = _236 * _208;
    float _272 = fma(_252, _258, _254);
    float _274 = fma(_98, _246, _260);
    float _276 = _250 + _268;
    float _278 = _218 * (*spvDescriptorSet0.vp_c4)._m0[2].x;
    float _280 = _236 * _210;
    float _282 = fma(_252, _266, _256);
    float _284 = _262 + _270;
    float _286 = -_268;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c7)._m0[15].z, _286);
    float _290 = fma(_252, _278, _274);
    float _292 = _264 + _280;
    float _294 = -_270;
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c7)._m0[15].z, _294);
    float _298 = _282 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _304 = -_280;
    float _306 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[15].z, _304);
    float _308 = _290 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _314 = _298 + _302;
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _320 = _272 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _322 = _308 + _312;
    float _324 = _314 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _326 = _314 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _328 = _320 + _318;
    float _330 = _314 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[1].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[0].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _338 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[1].z, _332);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[0].z, _334);
    float _342 = fma(_328, (*spvDescriptorSet0.vp_c4)._m0[2].z, _336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _346 = _340 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _348 = _342 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _350 = _344 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _352 = _344 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _354 = _344 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[10].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[7].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[8].x, _354);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[10].z, _356);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[7].z, _358);
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c4)._m0[8].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _374 = _368 * 0.999998986721038818359375;
    out.gl_Position.x = _370;
    out.gl_Position.y = _372;
    out.gl_Position.z = _374;
    out.gl_Position.w = _368;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

