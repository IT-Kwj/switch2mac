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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _563 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return out;
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return out;
    }
    float2 _664 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_664, float2(0.0), isnan(_664))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _138 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _140 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _142 = _102 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _144 = fma(_128, 2.0, -1.0);
    float _146 = fma(_126, 2.0, -1.0);
    float _148 = _102 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _150 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _152 = _146 * _130;
    float _154 = _146 * _132;
    float _156 = _146 * _134;
    float _158 = _150 * _130;
    float _160 = _150 * _148;
    float _162 = _146 * _148;
    float _164 = _146 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _166 = _150 * _132;
    float _168 = _150 * _134;
    float _170 = fma(_144, _136, _152);
    float _172 = -_158;
    float _174 = fma(_164, _136, _172);
    float _176 = fma(_144, _140, _154);
    float _178 = -_168;
    float _180 = fma(_164, _138, _178);
    float _182 = fma(_144, _138, _156);
    float _184 = fma(_144, _142, _162);
    float _186 = -_170;
    float _188 = _63 + _186;
    float _190 = _63 + _170;
    float _192 = _61 + _174;
    float _194 = -_166;
    float _196 = fma(_164, _140, _194);
    float _198 = -_174;
    float _200 = _61 + _198;
    float _202 = -_160;
    float _204 = fma(_164, _142, _202);
    float _206 = _63 + _176;
    float _208 = -_176;
    float _210 = _63 + _208;
    float _212 = _63 + _182;
    float _214 = -_182;
    float _216 = _63 + _214;
    float _218 = _63 + _184;
    float _220 = -_184;
    float _222 = _63 + _220;
    float _224 = -_196;
    float _226 = _61 + _224;
    float2 _836 = float2(_61, _63);
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_836, float2(0.0), isnan(_836))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_836, float2(0.0), isnan(_836))).x;
    float2 _844 = float2(_200, _188);
    float _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_844, float2(0.0), isnan(_844))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_844, float2(0.0), isnan(_844))).x;
    float2 _852 = float2(_192, _190);
    float _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_852, float2(0.0), isnan(_852))).x;
    float _234 = _61 + _196;
    float _236 = _61 + _180;
    float2 _866 = float2(_226, _210);
    float _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_866, float2(0.0), isnan(_866))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_866, float2(0.0), isnan(_866))).x;
    float _240 = -_180;
    float _242 = _61 + _240;
    float _244 = _61 + _204;
    float _246 = -_204;
    float _248 = _61 + _246;
    float2 _887 = float2(_234, _206);
    float _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_887, float2(0.0), isnan(_887))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_887, float2(0.0), isnan(_887))).x;
    float2 _895 = float2(_236, _212);
    float _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_895, float2(0.0), isnan(_895))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_895, float2(0.0), isnan(_895))).x;
    float2 _903 = float2(_242, _216);
    float _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_903, float2(0.0), isnan(_903))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_903, float2(0.0), isnan(_903))).x;
    float2 _911 = float2(_244, _218);
    float _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_911, float2(0.0), isnan(_911))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_911, float2(0.0), isnan(_911))).x;
    float2 _919 = float2(_248, _222);
    float _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_919, float2(0.0), isnan(_919))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_919, float2(0.0), isnan(_919))).x;
    float _260 = 1.0 / _102;
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _266 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _268 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _270 = _266 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _272 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _274 = -_230;
    float _276 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _278 = -_232;
    float _280 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
    float _282 = _276 * _264;
    float _284 = _280 * _264;
    float _286 = -_276;
    float _288 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_280;
    float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = fma(_282, 0.5, 0.5);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = fma(_284, 0.5, 0.5);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = -_250;
    float _308 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
    float _310 = -_238;
    float _312 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
    float _314 = -_300;
    float _316 = _314 + 0.5;
    float _318 = -_304;
    float _320 = _318 + 0.5;
    float _322 = -_256;
    float _324 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _322);
    float _326 = -_258;
    float _328 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _326);
    float _330 = fma(_290, _316, 0.5);
    float _332 = fma(_296, _320, 0.5);
    float _334 = -_330;
    float _336 = _304 + _334;
    float _338 = -_332;
    float _340 = _300 + _338;
    float _342 = fma(_296, _336, _330);
    float _344 = fma(_290, _340, _332);
    float _346 = _308 * _270;
    float _348 = _312 * _270;
    float _350 = -_308;
    float _352 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_312;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_346, 0.5, 0.5);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = fma(_348, 0.5, 0.5);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _372 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _374 = -_364;
    float _376 = _374 + 0.5;
    float _378 = -_368;
    float _380 = _378 + 0.5;
    float _382 = _370 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _384 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = fma(_354, _376, 0.5);
    float _388 = fma(_360, _380, 0.5);
    float _390 = -_386;
    float _392 = _368 + _390;
    float _394 = -_388;
    float _396 = _364 + _394;
    float _398 = fma(_360, _392, _386);
    float _400 = fma(_354, _396, _388);
    float _402 = -_252;
    float _404 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _402);
    float _406 = -_254;
    float _408 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _406);
    float _410 = _324 * _272;
    float _412 = _328 * _272;
    float _414 = _404 * _382;
    float _416 = _408 * _382;
    float _418 = fma(_410, 0.5, 0.5);
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = fma(_412, 0.5, 0.5);
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = fma(_414, 0.5, 0.5);
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = fma(_416, 0.5, 0.5);
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = -_404;
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = -_408;
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = -_428;
    float _448 = _446 + 0.5;
    float _450 = -_432;
    float _452 = _450 + 0.5;
    float _454 = -_324;
    float _456 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[6].w, _372);
    float _462 = -_328;
    float _464 = fma(_462, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[6].w, _384);
    float _470 = fma(_438, _448, 0.5);
    float _472 = -_424;
    float _474 = _472 + 0.5;
    float _476 = fma(_444, _452, 0.5);
    float _478 = -_420;
    float _480 = _478 + 0.5;
    float _482 = -_470;
    float _484 = _432 + _482;
    float _486 = fma(_466, _474, 0.5);
    float _488 = -_476;
    float _490 = _428 + _488;
    float _492 = fma(_458, _480, 0.5);
    float _494 = fma(_444, _484, _470);
    float _496 = -_486;
    float _498 = _420 + _496;
    float _500 = fma(_438, _490, _476);
    float _502 = -_492;
    float _504 = _424 + _502;
    float _506 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[7].w, _460);
    float _508 = fma(_458, _498, _486);
    float _510 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[7].w, _468);
    float _512 = fma(_466, _504, _492);
    float _514 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[8].w, _510);
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[8].w, _506);
    float _518 = _514 + _516;
    float _520 = _518 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _522 = _520 + (-0.5);
    float _524 = _522 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = -_526;
    float _530 = fma(_108, _528, 1.0);
    out.m_38.x = _530;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _563 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _664 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_664, float2(0.0), isnan(_664))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _138 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _140 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _142 = _102 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _144 = fma(_128, 2.0, -1.0);
    float _146 = fma(_126, 2.0, -1.0);
    float _148 = _102 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _150 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _152 = _146 * _130;
    float _154 = _146 * _132;
    float _156 = _146 * _134;
    float _158 = _150 * _130;
    float _160 = _150 * _148;
    float _162 = _146 * _148;
    float _164 = _146 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _166 = _150 * _132;
    float _168 = _150 * _134;
    float _170 = fma(_144, _136, _152);
    float _172 = -_158;
    float _174 = fma(_164, _136, _172);
    float _176 = fma(_144, _140, _154);
    float _178 = -_168;
    float _180 = fma(_164, _138, _178);
    float _182 = fma(_144, _138, _156);
    float _184 = fma(_144, _142, _162);
    float _186 = -_170;
    float _188 = _63 + _186;
    float _190 = _63 + _170;
    float _192 = _61 + _174;
    float _194 = -_166;
    float _196 = fma(_164, _140, _194);
    float _198 = -_174;
    float _200 = _61 + _198;
    float _202 = -_160;
    float _204 = fma(_164, _142, _202);
    float _206 = _63 + _176;
    float _208 = -_176;
    float _210 = _63 + _208;
    float _212 = _63 + _182;
    float _214 = -_182;
    float _216 = _63 + _214;
    float _218 = _63 + _184;
    float _220 = -_184;
    float _222 = _63 + _220;
    float _224 = -_196;
    float _226 = _61 + _224;
    float2 _836 = float2(_61, _63);
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_836, float2(0.0), isnan(_836))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_836, float2(0.0), isnan(_836))).x;
    float2 _844 = float2(_200, _188);
    float _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_844, float2(0.0), isnan(_844))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_844, float2(0.0), isnan(_844))).x;
    float2 _852 = float2(_192, _190);
    float _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_852, float2(0.0), isnan(_852))).x;
    float _234 = _61 + _196;
    float _236 = _61 + _180;
    float2 _866 = float2(_226, _210);
    float _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_866, float2(0.0), isnan(_866))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_866, float2(0.0), isnan(_866))).x;
    float _240 = -_180;
    float _242 = _61 + _240;
    float _244 = _61 + _204;
    float _246 = -_204;
    float _248 = _61 + _246;
    float2 _887 = float2(_234, _206);
    float _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_887, float2(0.0), isnan(_887))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_887, float2(0.0), isnan(_887))).x;
    float2 _895 = float2(_236, _212);
    float _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_895, float2(0.0), isnan(_895))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_895, float2(0.0), isnan(_895))).x;
    float2 _903 = float2(_242, _216);
    float _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_903, float2(0.0), isnan(_903))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_903, float2(0.0), isnan(_903))).x;
    float2 _911 = float2(_244, _218);
    float _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_911, float2(0.0), isnan(_911))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_911, float2(0.0), isnan(_911))).x;
    float2 _919 = float2(_248, _222);
    float _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_919, float2(0.0), isnan(_919))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_919, float2(0.0), isnan(_919))).x;
    float _260 = 1.0 / _102;
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _266 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _268 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _270 = _266 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _272 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _274 = -_230;
    float _276 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _278 = -_232;
    float _280 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
    float _282 = _276 * _264;
    float _284 = _280 * _264;
    float _286 = -_276;
    float _288 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_280;
    float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = fma(_282, 0.5, 0.5);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = fma(_284, 0.5, 0.5);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = -_250;
    float _308 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
    float _310 = -_238;
    float _312 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
    float _314 = -_300;
    float _316 = _314 + 0.5;
    float _318 = -_304;
    float _320 = _318 + 0.5;
    float _322 = -_256;
    float _324 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _322);
    float _326 = -_258;
    float _328 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _326);
    float _330 = fma(_290, _316, 0.5);
    float _332 = fma(_296, _320, 0.5);
    float _334 = -_330;
    float _336 = _304 + _334;
    float _338 = -_332;
    float _340 = _300 + _338;
    float _342 = fma(_296, _336, _330);
    float _344 = fma(_290, _340, _332);
    float _346 = _308 * _270;
    float _348 = _312 * _270;
    float _350 = -_308;
    float _352 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_312;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_346, 0.5, 0.5);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = fma(_348, 0.5, 0.5);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _372 = _344 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _374 = -_364;
    float _376 = _374 + 0.5;
    float _378 = -_368;
    float _380 = _378 + 0.5;
    float _382 = _370 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _384 = _342 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = fma(_354, _376, 0.5);
    float _388 = fma(_360, _380, 0.5);
    float _390 = -_386;
    float _392 = _368 + _390;
    float _394 = -_388;
    float _396 = _364 + _394;
    float _398 = fma(_360, _392, _386);
    float _400 = fma(_354, _396, _388);
    float _402 = -_252;
    float _404 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _402);
    float _406 = -_254;
    float _408 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _406);
    float _410 = _324 * _272;
    float _412 = _328 * _272;
    float _414 = _404 * _382;
    float _416 = _408 * _382;
    float _418 = fma(_410, 0.5, 0.5);
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = fma(_412, 0.5, 0.5);
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = fma(_414, 0.5, 0.5);
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = fma(_416, 0.5, 0.5);
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = -_404;
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = -_408;
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = -_428;
    float _448 = _446 + 0.5;
    float _450 = -_432;
    float _452 = _450 + 0.5;
    float _454 = -_324;
    float _456 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[6].w, _372);
    float _462 = -_328;
    float _464 = fma(_462, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[6].w, _384);
    float _470 = fma(_438, _448, 0.5);
    float _472 = -_424;
    float _474 = _472 + 0.5;
    float _476 = fma(_444, _452, 0.5);
    float _478 = -_420;
    float _480 = _478 + 0.5;
    float _482 = -_470;
    float _484 = _432 + _482;
    float _486 = fma(_466, _474, 0.5);
    float _488 = -_476;
    float _490 = _428 + _488;
    float _492 = fma(_458, _480, 0.5);
    float _494 = fma(_444, _484, _470);
    float _496 = -_486;
    float _498 = _420 + _496;
    float _500 = fma(_438, _490, _476);
    float _502 = -_492;
    float _504 = _424 + _502;
    float _506 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[7].w, _460);
    float _508 = fma(_458, _498, _486);
    float _510 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[7].w, _468);
    float _512 = fma(_466, _504, _492);
    float _514 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[8].w, _510);
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c3)._m0[8].w, _506);
    float _518 = _514 + _516;
    float _520 = _518 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _522 = _520 + (-0.5);
    float _524 = _522 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = -_526;
    float _530 = fma(_108, _528, 1.0);
    out.m_38.x = _530;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

