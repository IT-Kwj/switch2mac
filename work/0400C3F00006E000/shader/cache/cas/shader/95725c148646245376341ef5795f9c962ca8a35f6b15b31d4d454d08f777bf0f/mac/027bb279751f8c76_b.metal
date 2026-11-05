#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _998, thread const int& _999, constant _10& support_buffer)
{
    int _1002 = 1 + _999;
    float _1004 = support_buffer._m5[_1002].x;
    float _1006 = abs(_1004);
    bool _1008 = _1006 == 1.0;
    if (_1008)
    {
        return _998;
    }
    float _1010 = float(_998);
    float _1012 = _1010 / _1006;
    int _1014 = int(_1012);
    return _1014;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _456 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).x;
    bool _72 = _68 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_72)
    {
        discard_fragment();
    }
    float2 _476 = float2(_64, _66);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_476, float2(0.0), isnan(_476))).x;
    if (_72)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _76 = in.m_38.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_38.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::max(_74, _96);
    float _100 = _62 * _80;
    float _102 = _62 * _86;
    float _104 = precise::max(_98, _100);
    bool _106 = _104 != 0.0;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _62 * _92;
    float _126 = precise::min(_118, _122);
    bool _128 = !_114;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_104, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _144 = _142;
        int _146 = 2;
        int _148 = _44(_144, _146, (*spvDescriptorSet0.support_buffer));
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _152 = _150;
        int _154 = 2;
        int _156 = _44(_152, _154, (*spvDescriptorSet0.support_buffer));
        float _158 = float(_156);
        float _160 = float(_148);
        float _162 = fma(_66, _158, -0.5);
        float _164 = fma(_64, _160, -0.5);
        float _166 = floor(_162);
        float _168 = floor(_164);
        float _170 = -_166;
        float _172 = _162 + _170;
        float _174 = -_172;
        float _176 = _174 + 1.0;
        float _178 = _172 * _172;
        float _180 = -_168;
        float _182 = _164 + _180;
        float _184 = _176 * _176;
        float _186 = _172 * _178;
        float _188 = -_182;
        float _190 = _188 + 1.0;
        float _192 = _176 * _184;
        float _194 = -_182;
        float _196 = _194 + 2.0;
        float _198 = -_172;
        float _200 = _198 + 2.0;
        float _202 = _190 * _190;
        float _204 = _192 * 4.0;
        float _206 = _196 * _196;
        float _208 = _200 * _200;
        float _210 = _190 * _202;
        float _212 = _168 + (-0.5);
        float _214 = _168 + 1.5;
        float _216 = -_204;
        float _218 = fma(_200, _208, _216);
        float _220 = _210 * 4.0;
        float _222 = -_210;
        float _224 = _222 + 6.0;
        float _226 = -_192;
        float _228 = _226 + 6.0;
        float _230 = 1.0 / _160;
        float _232 = -_220;
        float _234 = fma(_196, _206, _232);
        float _236 = _192 + _218;
        float _238 = -_218;
        float _240 = _238 + _228;
        float _242 = _218 * 0.16666667163372039794921875;
        float _244 = -_234;
        float _246 = _244 + _224;
        float _248 = _210 + _234;
        float _250 = _236 * 0.16666667163372039794921875;
        float _252 = _240 * 0.16666667163372039794921875;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = 1.0 / _250;
        float _260 = _166 + 1.5;
        float _262 = _234 * 0.16666667163372039794921875;
        float _264 = _186 * 0.16666667163372039794921875;
        float _266 = 1.0 / _256;
        float _268 = 1.0 / _254;
        float _270 = 1.0 / _252;
        float _272 = fma(_262, _266, _212);
        float _274 = _272 * _230;
        float _276 = 1.0 / _158;
        float _278 = _166 + (-0.5);
        float _280 = fma(_242, _258, _278);
        float _282 = fma(_264, _270, _260);
        float _284 = _182 * _182;
        float _286 = _182 * _284;
        float _288 = _286 * 0.16666667163372039794921875;
        float _290 = fma(_288, _268, _214);
        float _292 = _280 * _276;
        float _294 = _282 * _276;
        float _296 = _290 * _230;
        float2 _784 = float2(_274, _292);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_784, float2(0.0), isnan(_784)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_784, float2(0.0), isnan(_784)), level(_136)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _799 = float2(_296, _292);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_799, float2(0.0), isnan(_799)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_799, float2(0.0), isnan(_799)), level(_136)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _814 = float2(_274, _294);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_814, float2(0.0), isnan(_814)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_814, float2(0.0), isnan(_814)), level(_136)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _829 = float2(_296, _294);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_829, float2(0.0), isnan(_829)), level(_136)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_829, float2(0.0), isnan(_829)), level(_136)).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 0.0 + _134;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = fma(_124, _334, _102);
        float _338 = _334 * _124;
        float _340 = -_314;
        float _342 = _306 + _340;
        float _344 = -_310;
        float _346 = _302 + _344;
        float _348 = -_312;
        float _350 = _304 + _348;
        float _352 = -_330;
        float _354 = _322 + _352;
        float _356 = -_326;
        float _358 = _318 + _356;
        float _360 = fma(_256, _342, _314);
        float _362 = -_328;
        float _364 = _320 + _362;
        float _366 = fma(_256, _354, _330);
        float _368 = fma(_256, _346, _310);
        float _370 = fma(_256, _358, _326);
        float _372 = 1.0 / _336;
        float _374 = fma(_256, _350, _312);
        float _376 = fma(_256, _364, _328);
        float _378 = -_366;
        float _380 = _378 + _360;
        float _382 = -_370;
        float _384 = _382 + _368;
        float _386 = -_376;
        float _388 = _386 + _374;
        float _390 = fma(_250, _380, _366);
        float _392 = fma(_250, _384, _370);
        float _394 = fma(_250, _388, _376);
        float _396 = -_390;
        float _398 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].z, _396);
        float _400 = -_392;
        float _402 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[13].x, _400);
        float _404 = -_394;
        float _406 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[13].y, _404);
        float _408 = fma(_126, _398, _390);
        float _410 = fma(_126, _402, _392);
        float _412 = _372 * _338;
        float _414 = fma(_126, _406, _394);
        float _416 = _408 * _338;
        float _418 = _410 * _412;
        float _420 = _414 * _412;
        float _422 = _416 * _372;
        out.m_36.x = _418;
        out.m_36.y = _420;
        out.m_36.z = _422;
        out.m_36.w = _336;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _102;
    return out;
}

