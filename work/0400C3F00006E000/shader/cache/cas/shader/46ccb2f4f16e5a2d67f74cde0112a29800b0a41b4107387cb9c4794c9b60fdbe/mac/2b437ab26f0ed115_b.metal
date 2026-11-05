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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1037, thread const int& _1038, constant _10& support_buffer)
{
    int _1041 = 1 + _1038;
    float _1043 = support_buffer._m5[_1041].x;
    float _1045 = abs(_1043);
    bool _1047 = _1045 == 1.0;
    if (_1047)
    {
        return _1037;
    }
    float _1049 = float(_1037);
    float _1051 = _1049 / _1045;
    int _1053 = int(_1051);
    return _1053;
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
    float2 _472 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
    float2 _483 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float _72 = in.m_35.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_70, _94);
    float _102 = _62 * _88;
    float _104 = precise::max(_100, _90);
    bool _108 = _104 != 0.0;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _62 * _82;
    float _124 = precise::min(_98, _120);
    bool _126 = !_116;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_104, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _142 = _140;
        int _144 = 2;
        int _146 = _44(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _150 = _148;
        int _152 = 2;
        int _154 = _44(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_146);
        float _158 = float(_154);
        float _160 = fma(_64, _156, -0.5);
        float _162 = fma(_66, _158, -0.5);
        float _164 = 1.0 / _156;
        float _166 = floor(_160);
        float _168 = floor(_162);
        float _170 = -_166;
        float _172 = _160 + _170;
        float _174 = -_172;
        float _176 = _174 + 1.0;
        float _178 = -_172;
        float _180 = _178 + 2.0;
        float _182 = -_168;
        float _184 = _162 + _182;
        float _186 = _176 * _176;
        float _188 = _180 * _180;
        float _190 = -_184;
        float _192 = _190 + 1.0;
        float _194 = _176 * _186;
        float _196 = -_184;
        float _198 = _196 + 2.0;
        float _200 = _192 * _192;
        float _202 = -_194;
        float _204 = _202 + 6.0;
        float _206 = _198 * _198;
        float _208 = _192 * _200;
        float _210 = _194 * 4.0;
        float _212 = _208 * 4.0;
        float _214 = -_210;
        float _216 = fma(_180, _188, _214);
        float _218 = -_208;
        float _220 = _218 + 6.0;
        float _222 = 1.0 / _158;
        float _224 = -_212;
        float _226 = fma(_198, _206, _224);
        float _228 = _194 + _216;
        float _230 = -_216;
        float _232 = _230 + _204;
        float _234 = _216 * 0.16666667163372039794921875;
        float _236 = _208 + _226;
        float _238 = -_226;
        float _240 = _238 + _220;
        float _242 = _228 * 0.16666667163372039794921875;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _236 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _242;
        float _252 = _172 * _172;
        float _254 = _184 * _184;
        float _256 = _226 * 0.16666667163372039794921875;
        float _258 = _172 * _252;
        float _260 = _184 * _254;
        float _262 = _168 + (-0.5);
        float _264 = 1.0 / _246;
        float _266 = _166 + (-0.5);
        float _268 = _168 + 1.5;
        float _270 = _260 * 0.16666667163372039794921875;
        float _272 = _166 + 1.5;
        float _274 = _258 * 0.16666667163372039794921875;
        float _276 = 1.0 / _248;
        float _278 = fma(_234, _250, _266);
        float _280 = 1.0 / _244;
        float _282 = fma(_256, _264, _262);
        float _284 = _282 * _222;
        float _286 = fma(_270, _276, _268);
        float _288 = _286 * _222;
        float _290 = fma(_274, _280, _272);
        float _292 = _278 * _164;
        float _294 = _290 * _164;
        float2 _785 = float2(_292, _284);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _800 = float2(_294, _284);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _815 = float2(_292, _288);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_815, float2(0.0), isnan(_815)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_815, float2(0.0), isnan(_815)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _830 = float2(_294, _288);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_830, float2(0.0), isnan(_830)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_830, float2(0.0), isnan(_830)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = -_310;
        float _332 = _302 + _330;
        float _334 = -_308;
        float _336 = _300 + _334;
        float _338 = fma(_242, _332, _310);
        float _340 = -_324;
        float _342 = _316 + _340;
        float _344 = fma(_242, _336, _308);
        float _346 = -_326;
        float _348 = _318 + _346;
        float _350 = -_312;
        float _352 = _304 + _350;
        float _354 = -_328;
        float _356 = _320 + _354;
        float _358 = fma(_242, _342, _324);
        float _360 = fma(_242, _348, _326);
        float _362 = fma(_242, _352, _312);
        float _364 = fma(_242, _356, _328);
        float _366 = -_358;
        float _368 = _366 + _344;
        float _370 = -_360;
        float _372 = _370 + _338;
        float _374 = 0.0 + _132;
        float _376 = precise::clamp(_374, 0.0, 1.0);
        float _378 = -_364;
        float _380 = _378 + _362;
        float _382 = fma(_246, _368, _358);
        float _384 = fma(_246, _372, _360);
        float _386 = fma(_102, _376, _122);
        float _388 = fma(_246, _380, _364);
        float _390 = -_382;
        float _392 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].x, _390);
        float _394 = -_384;
        float _396 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].y, _394);
        float _398 = 1.0 / _386;
        float _400 = -_388;
        float _402 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].z, _400);
        float _404 = fma(_124, _392, _382);
        float _406 = fma(_124, _396, _384);
        float _408 = fma(_124, _402, _388);
        float _410 = _376 * _404;
        float _412 = _376 * _406;
        float _414 = _376 * _408;
        float _416 = -_410;
        float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _420 = -_412;
        float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _424 = -_414;
        float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _428 = fma(_122, _418, _410);
        float _430 = fma(_122, _422, _412);
        float _432 = fma(_122, _426, _414);
        float _434 = _428 * _398;
        float _436 = _430 * _398;
        float _438 = _432 * _398;
        out.m_38.x = _434;
        out.m_38.y = _436;
        out.m_38.z = _438;
        out.m_38.w = _386;
        return out;
    }
    out.m_38.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_38.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_38.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_38.w = _122;
    return out;
}

