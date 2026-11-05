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
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
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
    float2 _534 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_534, float2(0.0), isnan(_534))).x;
    float2 _545 = float2(_67, _69);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_545, float2(0.0), isnan(_545))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float2 _561 = float2(_67, _69);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_561, float2(0.0), isnan(_561)), int2(0), component::x).xyzw;
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
    float _112 = in.m_39.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _65 * _98;
    float _132 = _65 * _104;
    float _134 = _65 * _116;
    float _136 = fma(_132, _71, _130);
    float _138 = _65 * _110;
    float _140 = _65 * _122;
    float _142 = _65 * _128;
    float _144 = fma(_134, _71, _138);
    float _146 = 1.0 / _136;
    float _148 = fma(_142, _71, _140);
    float _150 = _144 * _146;
    float _152 = _148 * _146;
    float2 _658 = float2(_150, _152);
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_658, float2(0.0), isnan(_658))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float _164 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _166 = precise::min(_86, _92);
    float _168 = precise::min(_88, _90);
    float _170 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _164);
    float _172 = precise::max(_86, _92);
    float _174 = precise::max(_88, _90);
    float _176 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].z, _170);
    float _178 = precise::min(_166, _168);
    float _180 = precise::max(_172, _174);
    float _182 = precise::min(_176, _178);
    float _184 = precise::max(_176, _180);
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _188 = -_182;
    float _190 = _188 + _184;
    float _192 = precise::max(_186, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _194 = -_69;
    float _196 = _194 + _152;
    float _198 = -_67;
    float _200 = _198 + _150;
    bool _204 = _190 > _192;
    float _206 = _196 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _208 = _200 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _210 = _206 * _206;
    float _212 = fma(_208, _208, _210);
    float _214 = _190;
    float _216 = _210;
    float _218 = _78;
    float _220 = _76;
    if (!_204)
    {
        _214 = _76;
    }
    float _222 = _214;
    float _224 = _222;
    if (!_204)
    {
        _216 = _78;
    }
    float _226 = _216;
    float _228 = _226;
    if (!_204)
    {
        _218 = _80;
    }
    float _230 = _218;
    float _232 = _230;
    if (!_204)
    {
        _220 = _82;
    }
    float _234 = _220;
    bool _236 = !_204;
    float _238 = _234;
    if (!_236)
    {
        float _240 = -_90;
        float _242 = _86 + _240;
        float _244 = -_92;
        float _246 = _88 + _244;
        float _248 = in.m_41.y;
        float _250 = gl_FragCoord.w;
        float _252 = _248 * _250;
        float _254 = in.m_41.z;
        float _256 = gl_FragCoord.w;
        float _258 = _254 * _256;
        float _260 = in.m_41.w;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = -_246;
        float _268 = _242 + _266;
        float _270 = _242 + _246;
        float _272 = _268 * _268;
        float _274 = fma(_270, _270, _272);
        float _276 = _274 + 0.00260416674427688121795654296875;
        float _278 = rsqrt(_276);
        float _280 = _270 * _278;
        float _282 = _268 * _278;
        float _284 = in.m_41.x;
        float _286 = gl_FragCoord.w;
        float _288 = _284 * _286;
        float _290 = abs(_280);
        float _292 = abs(_282);
        float _294 = precise::min(_290, _292);
        float _296 = _294 * 2.0;
        float _298 = 1.0 / _296;
        float _300 = _298 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _302 = _65 * _288;
        float _304 = _65 * _252;
        float _306 = _65 * _258;
        float _308 = _300 * 0.5;
        float _310 = _65 * _264;
        float _312 = -_302;
        float _314 = fma(_280, _312, _67);
        float _316 = fma(_280, _302, _67);
        float _318 = fma(_280, _308, 0.5);
        float _320 = precise::clamp(_318, 0.0, 1.0);
        float _322 = fma(_282, _308, 0.5);
        float _324 = precise::clamp(_322, 0.0, 1.0);
        float _326 = -_304;
        float _328 = fma(_282, _326, _69);
        float _330 = fma(_282, _304, _69);
        float _332 = _320 + (-0.5);
        float _334 = _324 + (-0.5);
        float _336 = -_306;
        float _338 = fma(_332, _336, _67);
        float _340 = -_310;
        float _342 = fma(_334, _340, _69);
        float _344 = fma(_332, _306, _67);
        float _346 = fma(_334, _310, _69);
        float2 _944 = float2(_314, _328);
        float4 _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_944, float2(0.0), isnan(_944))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_944, float2(0.0), isnan(_944))).xyzw;
        float _350 = _348.x;
        float _352 = _348.y;
        float _354 = _348.z;
        float _356 = _348.w;
        float2 _960 = float2(_316, _330);
        float4 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float2(0.0), isnan(_960))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float2(0.0), isnan(_960))).xyzw;
        float _360 = _358.x;
        float _362 = _358.y;
        float _364 = _358.z;
        float _366 = _358.w;
        float2 _976 = float2(_338, _342);
        float4 _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_976, float2(0.0), isnan(_976))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_976, float2(0.0), isnan(_976))).xyzw;
        float _370 = _368.x;
        float _372 = _368.y;
        float _374 = _368.z;
        float _376 = _368.w;
        float2 _992 = float2(_344, _346);
        float4 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_992, float2(0.0), isnan(_992))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_992, float2(0.0), isnan(_992))).xyzw;
        float _380 = _378.x;
        float _382 = _378.y;
        float _384 = _378.z;
        float _386 = _378.w;
        float _388 = _352 + _362;
        float _390 = _350 + _360;
        float _392 = _354 + _364;
        float _394 = _372 + _382;
        float _396 = _370 + _380;
        float _398 = _374 + _384;
        float _400 = _356 + _366;
        float _402 = _388 + _394;
        float _404 = _390 + _396;
        float _406 = _392 + _398;
        float _408 = _402 * 0.25;
        float _410 = _404 * 0.25;
        float _412 = _406 * 0.25;
        float _414 = _408 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _416 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[2].x, _414);
        float _418 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[2].z, _416);
        float _420 = _400 * 0.5;
        bool _422 = _418 >= _180;
        bool _424 = isnan(_418);
        bool _426 = _422 || _424;
        bool _428 = isnan(_180);
        bool _430 = _426 || _428;
        bool _432 = _178 < _418;
        bool _434 = !_430;
        bool _436 = _432 && _434;
        float _438 = _376 + _386;
        float _440 = _400 + _438;
        float _442 = _410;
        float _444 = _408;
        float _446 = _412;
        _238 = _420;
        if (!_436)
        {
            float _448 = _390 * 0.5;
            _442 = _448;
        }
        float _450 = _442;
        _224 = _450;
        if (!_436)
        {
            float _452 = _388 * 0.5;
            _444 = _452;
        }
        float _454 = _444;
        _228 = _454;
        if (!_436)
        {
            float _456 = _392 * 0.5;
            _446 = _456;
        }
        float _458 = _446;
        _232 = _458;
        if (_436)
        {
            float _460 = _440 * 0.25;
            _238 = _460;
        }
    }
    float _462 = _224;
    float _464 = _232;
    float _466 = _238;
    float _468 = _228;
    float _470 = sqrt(_212);
    float _472 = -_462;
    float _474 = _156 + _472;
    float _476 = -_464;
    float _478 = _160 + _476;
    float _480 = -_466;
    float _482 = _162 + _480;
    float _484 = 0.0 + _470;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = fma(_486, -0.5, 0.5);
    float _490 = -_468;
    float _492 = _158 + _490;
    float _494 = fma(_488, _474, _462);
    float _496 = fma(_488, _492, _468);
    float _498 = fma(_488, _478, _464);
    float _500 = fma(_488, _482, _466);
    out.m_44.x = _494;
    out.m_44.y = _496;
    out.m_44.z = _498;
    out.m_44.w = _500;
    return out;
}

