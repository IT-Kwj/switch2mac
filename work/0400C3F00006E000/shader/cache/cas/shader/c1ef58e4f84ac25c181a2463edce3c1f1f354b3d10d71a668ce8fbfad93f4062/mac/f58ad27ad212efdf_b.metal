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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _548 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_548, float2(0.0), isnan(_548))).x;
    float2 _559 = float2(_67, _69);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float2 _575 = float2(_67, _69);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_575, float2(0.0), isnan(_575)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_37.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_39.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_37.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _65 * _98;
    float _132 = -_71;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _136 = _132 + _134;
    float _138 = _65 * _104;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _142 = _130 * _140;
    float _144 = fma(_138, _136, _142);
    float _146 = _65 * _110;
    float _148 = _65 * _116;
    float _150 = _146 * _140;
    float _152 = 1.0 / _144;
    float _154 = _148 * _140;
    float _156 = _65 * _122;
    float _158 = _65 * _128;
    float _160 = fma(_156, _136, _150);
    float _162 = fma(_158, _136, _154);
    float _164 = _160 * _152;
    float _166 = _162 * _152;
    float2 _698 = float2(_164, _166);
    float4 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_698, float2(0.0), isnan(_698))).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float _178 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _180 = precise::min(_86, _92);
    float _182 = precise::min(_88, _90);
    float _184 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _178);
    float _186 = precise::max(_86, _92);
    float _188 = precise::max(_88, _90);
    float _190 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].z, _184);
    float _192 = precise::min(_180, _182);
    float _194 = precise::max(_186, _188);
    float _196 = precise::min(_190, _192);
    float _198 = precise::max(_190, _194);
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _202 = -_196;
    float _204 = _202 + _198;
    float _206 = precise::max(_200, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _208 = -_69;
    float _210 = _208 + _166;
    float _212 = -_67;
    float _214 = _212 + _164;
    bool _218 = _204 > _206;
    float _220 = _210 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _224 = _220 * _220;
    float _226 = fma(_222, _222, _224);
    float _228 = _222;
    float _230 = _224;
    float _232 = _78;
    float _234 = _76;
    if (!_218)
    {
        _228 = _76;
    }
    float _236 = _228;
    float _238 = _236;
    if (!_218)
    {
        _230 = _78;
    }
    float _240 = _230;
    float _242 = _240;
    if (!_218)
    {
        _232 = _80;
    }
    float _244 = _232;
    float _246 = _244;
    if (!_218)
    {
        _234 = _82;
    }
    float _248 = _234;
    bool _250 = !_218;
    float _252 = _248;
    if (!_250)
    {
        float _254 = -_90;
        float _256 = _86 + _254;
        float _258 = -_92;
        float _260 = _88 + _258;
        float _262 = in.m_41.y;
        float _264 = gl_FragCoord.w;
        float _266 = _262 * _264;
        float _268 = in.m_41.x;
        float _270 = gl_FragCoord.w;
        float _272 = _268 * _270;
        float _274 = in.m_41.z;
        float _276 = gl_FragCoord.w;
        float _278 = _274 * _276;
        float _280 = -_260;
        float _282 = _256 + _280;
        float _284 = _256 + _260;
        float _286 = in.m_41.w;
        float _288 = gl_FragCoord.w;
        float _290 = _286 * _288;
        float _292 = _282 * _282;
        float _294 = fma(_284, _284, _292);
        float _296 = _294 + 0.00260416674427688121795654296875;
        float _298 = rsqrt(_296);
        float _300 = _65 * _278;
        float _302 = _284 * _298;
        float _304 = _282 * _298;
        float _306 = _65 * _272;
        float _308 = _65 * _266;
        float _310 = _65 * _290;
        float _312 = abs(_302);
        float _314 = abs(_304);
        float _316 = precise::min(_312, _314);
        float _318 = -_306;
        float _320 = fma(_302, _318, _67);
        float _322 = fma(_302, _306, _67);
        float _324 = _316 * 2.0;
        float _326 = 1.0 / _324;
        float _328 = _326 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _330 = _328 * 0.5;
        float _332 = fma(_302, _330, 0.5);
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = fma(_304, _330, 0.5);
        float _338 = precise::clamp(_336, 0.0, 1.0);
        float _340 = _334 + (-0.5);
        float _342 = _338 + (-0.5);
        float _344 = -_308;
        float _346 = fma(_304, _344, _69);
        float _348 = fma(_304, _308, _69);
        float _350 = -_300;
        float _352 = fma(_340, _350, _67);
        float _354 = -_310;
        float _356 = fma(_342, _354, _69);
        float _358 = fma(_340, _300, _67);
        float _360 = fma(_342, _310, _69);
        float2 _982 = float2(_320, _346);
        float4 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_982, float2(0.0), isnan(_982))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_982, float2(0.0), isnan(_982))).xyzw;
        float _364 = _362.x;
        float _366 = _362.y;
        float _368 = _362.z;
        float _370 = _362.w;
        float2 _998 = float2(_322, _348);
        float4 _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_998, float2(0.0), isnan(_998))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_998, float2(0.0), isnan(_998))).xyzw;
        float _374 = _372.x;
        float _376 = _372.y;
        float _378 = _372.z;
        float _380 = _372.w;
        float2 _1014 = float2(_352, _356);
        float4 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1014, float2(0.0), isnan(_1014))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1014, float2(0.0), isnan(_1014))).xyzw;
        float _384 = _382.x;
        float _386 = _382.y;
        float _388 = _382.z;
        float _390 = _382.w;
        float2 _1030 = float2(_358, _360);
        float4 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1030, float2(0.0), isnan(_1030))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1030, float2(0.0), isnan(_1030))).xyzw;
        float _394 = _392.x;
        float _396 = _392.y;
        float _398 = _392.z;
        float _400 = _392.w;
        float _402 = _366 + _376;
        float _404 = _368 + _378;
        float _406 = _370 + _380;
        float _408 = _386 + _396;
        float _410 = _364 + _374;
        float _412 = _384 + _394;
        float _414 = _388 + _398;
        float _416 = _402 + _408;
        float _418 = _406 * 0.5;
        float _420 = _410 + _412;
        float _422 = _404 + _414;
        float _424 = _416 * 0.25;
        float _426 = _420 * 0.25;
        float _428 = _422 * 0.25;
        float _430 = _424 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _432 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[2].x, _430);
        float _434 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[2].z, _432);
        bool _436 = _434 >= _194;
        bool _438 = isnan(_434);
        bool _440 = _436 || _438;
        bool _442 = isnan(_194);
        bool _444 = _440 || _442;
        bool _446 = _192 < _434;
        bool _448 = !_444;
        bool _450 = _446 && _448;
        float _452 = _390 + _400;
        float _454 = _406 + _452;
        float _456 = _426;
        float _458 = _424;
        float _460 = _428;
        _252 = _418;
        if (!_450)
        {
            float _462 = _410 * 0.5;
            _456 = _462;
        }
        float _464 = _456;
        _238 = _464;
        if (!_450)
        {
            float _466 = _402 * 0.5;
            _458 = _466;
        }
        float _468 = _458;
        _242 = _468;
        if (!_450)
        {
            float _470 = _404 * 0.5;
            _460 = _470;
        }
        float _472 = _460;
        _246 = _472;
        if (_450)
        {
            float _474 = _454 * 0.25;
            _252 = _474;
        }
    }
    float _476 = _238;
    float _478 = _246;
    float _480 = _252;
    float _482 = _242;
    float _484 = sqrt(_226);
    float _486 = -_476;
    float _488 = _170 + _486;
    float _490 = -_478;
    float _492 = _174 + _490;
    float _494 = -_480;
    float _496 = _176 + _494;
    float _498 = 0.0 + _484;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = fma(_500, -0.5, 0.5);
    float _504 = -_482;
    float _506 = _172 + _504;
    float _508 = fma(_502, _488, _476);
    float _510 = fma(_502, _506, _482);
    float _512 = fma(_502, _492, _478);
    float _514 = fma(_502, _496, _480);
    out.m_44.x = _508;
    out.m_44.y = _510;
    out.m_44.z = _512;
    out.m_44.w = _514;
    return out;
}

