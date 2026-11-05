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
int _44(thread const int& _1070, thread const int& _1071, constant _10& support_buffer)
{
    int _1074 = 1 + _1071;
    float _1076 = support_buffer._m5[_1074].x;
    float _1078 = abs(_1076);
    bool _1080 = _1078 == 1.0;
    if (_1080)
    {
        return _1070;
    }
    float _1082 = float(_1070);
    float _1084 = _1082 / _1078;
    int _1086 = int(_1084);
    return _1086;
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
    float2 _480 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _512 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_512, float2(0.0), isnan(_512))).x;
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
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::max(_80, _102);
    float _110 = _62 * _86;
    float _112 = precise::max(_108, _110);
    bool _114 = _112 != 0.0;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    float _124 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _62 * _92;
    float _130 = _62 * _98;
    float _132 = precise::min(_106, _126);
    bool _134 = !_122;
    if (!_134)
    {
        float _136 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _138 = fma(_112, _136, 1.0);
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
        float _164 = float(_154);
        float _166 = float(_162);
        float _168 = fma(_64, _164, -0.5);
        float _170 = fma(_66, _166, -0.5);
        float _172 = 1.0 / _164;
        float _174 = floor(_168);
        float _176 = floor(_170);
        float _178 = -_174;
        float _180 = _168 + _178;
        float _182 = -_180;
        float _184 = _182 + 1.0;
        float _186 = -_180;
        float _188 = _186 + 2.0;
        float _190 = -_176;
        float _192 = _170 + _190;
        float _194 = _184 * _184;
        float _196 = _188 * _188;
        float _198 = -_192;
        float _200 = _198 + 1.0;
        float _202 = _184 * _194;
        float _204 = -_192;
        float _206 = _204 + 2.0;
        float _208 = _200 * _200;
        float _210 = -_202;
        float _212 = _210 + 6.0;
        float _214 = _206 * _206;
        float _216 = _200 * _208;
        float _218 = _202 * 4.0;
        float _220 = _216 * 4.0;
        float _222 = -_218;
        float _224 = fma(_188, _196, _222);
        float _226 = -_216;
        float _228 = _226 + 6.0;
        float _230 = 1.0 / _166;
        float _232 = -_220;
        float _234 = fma(_206, _214, _232);
        float _236 = _202 + _224;
        float _238 = -_224;
        float _240 = _238 + _212;
        float _242 = _224 * 0.16666667163372039794921875;
        float _244 = _216 + _234;
        float _246 = -_234;
        float _248 = _246 + _228;
        float _250 = _236 * 0.16666667163372039794921875;
        float _252 = _240 * 0.16666667163372039794921875;
        float _254 = _244 * 0.16666667163372039794921875;
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = 1.0 / _250;
        float _260 = _180 * _180;
        float _262 = _192 * _192;
        float _264 = _234 * 0.16666667163372039794921875;
        float _266 = _180 * _260;
        float _268 = _192 * _262;
        float _270 = _176 + (-0.5);
        float _272 = 1.0 / _254;
        float _274 = _174 + (-0.5);
        float _276 = _176 + 1.5;
        float _278 = _268 * 0.16666667163372039794921875;
        float _280 = _174 + 1.5;
        float _282 = _266 * 0.16666667163372039794921875;
        float _284 = 1.0 / _256;
        float _286 = fma(_242, _258, _274);
        float _288 = 1.0 / _252;
        float _290 = fma(_264, _272, _270);
        float _292 = _290 * _230;
        float _294 = fma(_278, _284, _276);
        float _296 = _294 * _230;
        float _298 = fma(_282, _288, _280);
        float _300 = _286 * _172;
        float _302 = _298 * _172;
        float2 _819 = float2(_300, _292);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_819, float2(0.0), isnan(_819)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_819, float2(0.0), isnan(_819)), level(_142)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _834 = float2(_302, _292);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_834, float2(0.0), isnan(_834)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_834, float2(0.0), isnan(_834)), level(_142)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _849 = float2(_300, _296);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_849, float2(0.0), isnan(_849)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_849, float2(0.0), isnan(_849)), level(_142)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float2 _864 = float2(_302, _296);
        float3 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_864, float2(0.0), isnan(_864)), level(_142)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_864, float2(0.0), isnan(_864)), level(_142)).xyz;
        float _332 = _330.x;
        float _334 = _330.y;
        float _336 = _330.z;
        float _338 = -_318;
        float _340 = _310 + _338;
        float _342 = -_316;
        float _344 = _308 + _342;
        float _346 = fma(_250, _340, _318);
        float _348 = -_332;
        float _350 = _324 + _348;
        float _352 = fma(_250, _344, _316);
        float _354 = -_334;
        float _356 = _326 + _354;
        float _358 = -_320;
        float _360 = _312 + _358;
        float _362 = -_336;
        float _364 = _328 + _362;
        float _366 = fma(_250, _350, _332);
        float _368 = fma(_250, _356, _334);
        float _370 = fma(_250, _360, _320);
        float _372 = fma(_250, _364, _336);
        float _374 = -_366;
        float _376 = _374 + _352;
        float _378 = -_368;
        float _380 = _378 + _346;
        float _382 = 0.0 + _140;
        float _384 = precise::clamp(_382, 0.0, 1.0);
        float _386 = -_372;
        float _388 = _386 + _370;
        float _390 = fma(_254, _376, _366);
        float _392 = fma(_254, _380, _368);
        float _394 = fma(_130, _384, _128);
        float _396 = fma(_254, _388, _372);
        float _398 = -_390;
        float _400 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
        float _402 = -_392;
        float _404 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[13].y, _402);
        float _406 = 1.0 / _394;
        float _408 = -_396;
        float _410 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[13].z, _408);
        float _412 = fma(_132, _400, _390);
        float _414 = fma(_132, _404, _392);
        float _416 = fma(_132, _410, _396);
        float _418 = _384 * _412;
        float _420 = _384 * _414;
        float _422 = _384 * _416;
        float _424 = -_418;
        float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _428 = -_420;
        float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _432 = -_422;
        float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _436 = fma(_128, _426, _418);
        float _438 = fma(_128, _430, _420);
        float _440 = fma(_128, _434, _422);
        float _442 = _436 * _406;
        float _444 = _438 * _406;
        float _446 = _440 * _406;
        out.m_36.x = _442;
        out.m_36.y = _444;
        out.m_36.z = _446;
        out.m_36.w = _394;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _128;
    return out;
}

