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
int _44(thread const int& _1015, thread const int& _1016, constant _10& support_buffer)
{
    int _1019 = 1 + _1016;
    float _1021 = support_buffer._m5[_1019].x;
    float _1023 = abs(_1021);
    bool _1025 = _1023 == 1.0;
    if (_1025)
    {
        return _1015;
    }
    float _1027 = float(_1015);
    float _1029 = _1027 / _1023;
    int _1031 = int(_1029);
    return _1031;
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
    float2 _462 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _494 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_494, float2(0.0), isnan(_494))).x;
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _82 = in.m_38.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_80, _102);
    float _106 = _62 * _86;
    float _108 = _62 * _92;
    float _110 = precise::max(_104, _106);
    bool _112 = _110 != 0.0;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan(0.0);
    bool _120 = _116 || _118;
    float _122 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _62 * _98;
    float _132 = precise::min(_124, _128);
    bool _134 = !_120;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_110, _136, 1.0);
        float _140 = log2(_138);
        float _142 = _140 + (-1.0);
        float _144 = trunc(_142);
        int _146 = int(_144);
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _150 = _148;
        int _152 = 2;
        int _154 = _44(_150, _152, (*spvDescriptorSet0.support_buffer));
        int _156 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _158 = _156;
        int _160 = 2;
        int _162 = _44(_158, _160, (*spvDescriptorSet0.support_buffer));
        float _164 = float(_162);
        float _166 = float(_154);
        float _168 = fma(_66, _164, -0.5);
        float _170 = fma(_64, _166, -0.5);
        float _172 = floor(_168);
        float _174 = floor(_170);
        float _176 = -_172;
        float _178 = _168 + _176;
        float _180 = -_178;
        float _182 = _180 + 1.0;
        float _184 = _178 * _178;
        float _186 = -_174;
        float _188 = _170 + _186;
        float _190 = _182 * _182;
        float _192 = _178 * _184;
        float _194 = -_188;
        float _196 = _194 + 1.0;
        float _198 = _182 * _190;
        float _200 = -_188;
        float _202 = _200 + 2.0;
        float _204 = -_178;
        float _206 = _204 + 2.0;
        float _208 = _196 * _196;
        float _210 = _198 * 4.0;
        float _212 = _202 * _202;
        float _214 = _206 * _206;
        float _216 = _196 * _208;
        float _218 = _174 + (-0.5);
        float _220 = _174 + 1.5;
        float _222 = -_210;
        float _224 = fma(_206, _214, _222);
        float _226 = _216 * 4.0;
        float _228 = -_216;
        float _230 = _228 + 6.0;
        float _232 = -_198;
        float _234 = _232 + 6.0;
        float _236 = 1.0 / _166;
        float _238 = -_226;
        float _240 = fma(_202, _212, _238);
        float _242 = _198 + _224;
        float _244 = -_224;
        float _246 = _244 + _234;
        float _248 = _224 * 0.16666667163372039794921875;
        float _250 = -_240;
        float _252 = _250 + _230;
        float _254 = _216 + _240;
        float _256 = _242 * 0.16666667163372039794921875;
        float _258 = _246 * 0.16666667163372039794921875;
        float _260 = _252 * 0.16666667163372039794921875;
        float _262 = _254 * 0.16666667163372039794921875;
        float _264 = 1.0 / _256;
        float _266 = _172 + 1.5;
        float _268 = _240 * 0.16666667163372039794921875;
        float _270 = _192 * 0.16666667163372039794921875;
        float _272 = 1.0 / _262;
        float _274 = 1.0 / _260;
        float _276 = 1.0 / _258;
        float _278 = fma(_268, _272, _218);
        float _280 = _278 * _236;
        float _282 = 1.0 / _164;
        float _284 = _172 + (-0.5);
        float _286 = fma(_248, _264, _284);
        float _288 = fma(_270, _276, _266);
        float _290 = _188 * _188;
        float _292 = _188 * _290;
        float _294 = _292 * 0.16666667163372039794921875;
        float _296 = fma(_294, _274, _220);
        float _298 = _286 * _282;
        float _300 = _288 * _282;
        float _302 = _296 * _236;
        float2 _801 = float2(_280, _298);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_801, float2(0.0), isnan(_801)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_801, float2(0.0), isnan(_801)), level(_142)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _816 = float2(_302, _298);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_816, float2(0.0), isnan(_816)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_816, float2(0.0), isnan(_816)), level(_142)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _831 = float2(_280, _300);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_831, float2(0.0), isnan(_831)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_831, float2(0.0), isnan(_831)), level(_142)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float2 _846 = float2(_302, _300);
        float3 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_846, float2(0.0), isnan(_846)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_846, float2(0.0), isnan(_846)), level(_142)).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        float _338 = 0.0 + _140;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        float _342 = fma(_130, _340, _108);
        float _344 = _340 * _130;
        float _346 = -_320;
        float _348 = _312 + _346;
        float _350 = -_316;
        float _352 = _308 + _350;
        float _354 = -_318;
        float _356 = _310 + _354;
        float _358 = -_336;
        float _360 = _328 + _358;
        float _362 = -_332;
        float _364 = _324 + _362;
        float _366 = fma(_262, _348, _320);
        float _368 = -_334;
        float _370 = _326 + _368;
        float _372 = fma(_262, _360, _336);
        float _374 = fma(_262, _352, _316);
        float _376 = fma(_262, _364, _332);
        float _378 = 1.0 / _342;
        float _380 = fma(_262, _356, _318);
        float _382 = fma(_262, _370, _334);
        float _384 = -_372;
        float _386 = _384 + _366;
        float _388 = -_376;
        float _390 = _388 + _374;
        float _392 = -_382;
        float _394 = _392 + _380;
        float _396 = fma(_256, _386, _372);
        float _398 = fma(_256, _390, _376);
        float _400 = fma(_256, _394, _382);
        float _402 = -_396;
        float _404 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[13].z, _402);
        float _406 = -_398;
        float _408 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[13].x, _406);
        float _410 = -_400;
        float _412 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[13].y, _410);
        float _414 = fma(_132, _404, _396);
        float _416 = fma(_132, _408, _398);
        float _418 = _378 * _344;
        float _420 = fma(_132, _412, _400);
        float _422 = _414 * _344;
        float _424 = _416 * _418;
        float _426 = _420 * _418;
        float _428 = _422 * _378;
        out.m_36.x = _424;
        out.m_36.y = _426;
        out.m_36.z = _428;
        out.m_36.w = _342;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _108;
    return out;
}

