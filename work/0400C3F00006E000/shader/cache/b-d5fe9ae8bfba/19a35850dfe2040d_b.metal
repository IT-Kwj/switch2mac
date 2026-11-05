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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = in.m_46.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    float _104 = _87;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_51.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1548 = as_type<float>(_112);
        out.gl_Position.z = _1548;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    int _138 = as_type<int>(_136);
    if (_132)
    {
        out.m_51.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _114 = as_type<int>(_140);
    }
    int _142 = _114;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_142);
        out.gl_Position.z = _1606;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_53.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = in.m_55.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_55.w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _178 = _176 != 0;
    float _180 = in.m_55.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _184 = in.m_55.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _144;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_152)
    {
        float _192 = -_144;
        float _194 = _192 + 1.0;
        _138 = as_type<int>(_194);
    }
    int _196 = _138;
    if (!_152)
    {
        _104 = _144;
    }
    float _198 = _104;
    int _200 = 0;
    float _202 = _198;
    if (_156)
    {
        float _204 = -_144;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _212 = false;
    if (_152)
    {
        bool _214 = _148 > 0.5;
        _212 = _214;
    }
    bool _216 = _212;
    float _218 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _220 = in.m_57.w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_152)
    {
        float _224 = _216 ? as_type<float>(_196) : _144;
        _202 = _224;
    }
    float _226 = _202;
    out.m_59.x = _144;
    bool _228 = _158 > 0.5;
    float _230 = -_170;
    float _232 = _230 + 1.0;
    out.m_59.y = _170;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _236 = _180 > 0.5;
    float _238 = _180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _244 = _236 ? as_type<int>(_232) : as_type<int>(_170);
    float _246 = fma(_238, -2.0, _186);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    float _252 = -_240;
    float _254 = fma(_218, 2.0, _252);
    float _256 = _162 ? as_type<float>(_244) : _170;
    float _258 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _260 = _184 > 0.5;
    float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _264 = _240;
    float _266 = _170;
    float _268 = _184;
    if (!_156)
    {
        _264 = _144;
    }
    float _270 = _264;
    float _272 = _164 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _274 = _270;
    if (_156)
    {
        float _276 = _260 ? as_type<float>(_208) : _144;
        _274 = _276;
    }
    float _278 = _274;
    float _280 = fma(_258, _226, -0.5);
    float _282 = _182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _284 = fma(_272, _256, -0.5);
    int _286 = _260 ? as_type<int>(_232) : as_type<int>(_170);
    float _288 = fma(_282, _278, -0.5);
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _294 = _174 ? as_type<float>(_286) : _170;
    float _296 = -_96;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _254);
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _302 = _298;
    if (_178)
    {
        float _304 = _228 ? _232 : _170;
        _266 = _304;
    }
    float _306 = _266;
    float _308 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _292);
    bool _310 = _180 > 0.5;
    bool _312 = _310 && _168;
    float _314 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _290);
    float _316 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _246);
    float _318 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _308);
    float _320 = _262 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _322 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _314);
    if (!_168)
    {
        _300 = _144;
    }
    float _324 = _300;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _328 = fma(_294, _320, -0.5);
    float _330 = fma(_322, _280, _298);
    float _332 = -_316;
    float _334 = fma(_318, _284, _332);
    float _336 = _324;
    if (_250)
    {
        _302 = _148;
    }
    float _338 = _302;
    float _340 = in.m_46.x;
    float _342 = in.m_46.y;
    float _344 = in.m_46.z;
    float _346 = _338;
    if (_312)
    {
        float _348 = -_144;
        float _350 = _348 + 1.0;
        _188 = _350;
    }
    float _352 = _188;
    if (!_250)
    {
        _346 = _184;
    }
    float _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    bool _364 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _368 = _364 || _366;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    float _374 = fma(_242, _306, -0.5);
    float _376 = 0.0;
    float _378 = _354;
    float _380 = _356;
    if (!_250)
    {
        _376 = _180;
    }
    float _382 = _376;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _386 = _382;
    if (_168)
    {
        _336 = _352;
    }
    float _388 = _336;
    float _390 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _326);
    if (!_250)
    {
        _190 = _382;
    }
    float _392 = _190;
    float _394 = -_222;
    float _396 = fma(_384, 2.0, _394);
    float _398 = _392;
    if (_250)
    {
        _398 = _148;
    }
    float _400 = _398;
    float _402 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _404 = _402;
    if (_250)
    {
        _386 = _180;
    }
    float _406 = _386;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _356);
    float _410 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _414 = _412;
    if (!_372)
    {
        float _416 = _402 * _402;
        float _418 = _416 * 0.5;
        _378 = _418;
    }
    float _420 = _378;
    float _422 = _420;
    if (!_250)
    {
        _380 = _184;
    }
    float _424 = _380;
    float _426 = -_412;
    float _428 = fma(_410, 2.0, _426);
    float _430 = _424;
    if (_250)
    {
        _430 = _406;
    }
    float _432 = _430;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_250)
    {
        _268 = _406;
    }
    float _436 = _268;
    if (!_372)
    {
        float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _438;
    }
    float _440 = _422;
    float _442 = _440;
    if (_250)
    {
        _414 = _406;
    }
    float _444 = _414;
    bool _446 = !_372;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _402 * _452;
        float _462 = 1.0 / _456;
        float _464 = _458 * 0.693147182464599609375;
        float _466 = exp2(_460);
        float _468 = 1.0 / _464;
        float _470 = _466 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _468, _402);
        float _476 = _474 * _462;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _478;
    }
    float _480 = _442;
    bool _482 = !_372;
    if (!_482)
    {
        float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _486 = log2(_484);
        float _488 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _490 = _488 + 1.0;
        float _492 = 1.0 / _490;
        float _494 = _402 * _486;
        float _496 = exp2(_494);
        float _498 = -_496;
        float _500 = _498 + 1.0;
        float _502 = _500 * _492;
        _404 = _502;
    }
    float _504 = _404;
    float _506 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _508 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _434);
    if (!_250)
    {
        _448 = _148;
    }
    float _510 = _448;
    float _512 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _514 = fma(_504, _342, _506);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _520 = fma(_504, _340, _512);
    float _522 = fma(_514, _220, _360);
    float _524 = fma(_504, _344, _516);
    float _526 = fma(_518, _388, -0.5);
    float _528 = fma(_520, _220, _358);
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = fma(_524, _220, _362);
    float _536 = _522 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _530);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _552 = _546 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _550 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _552 + _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _554 + _566;
    float _570 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _576 = _432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _580 = -_96;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _396);
    float _584 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _572);
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = fma(_576, -2.0, _564);
    float _592 = fma(_584, -2.0, _574);
    float _594 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _390);
    float _596 = _558 * _558;
    bool _598 = _588 >= 0.0;
    float _600 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _508);
    float _602 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    float _604 = -_96;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _428);
    float _608 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _586);
    float _610 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _612 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _592);
    float _614 = fma(_562, _562, _596);
    float _616 = fma(_600, _526, _582);
    float _618 = -_610;
    float _620 = fma(_608, _374, _618);
    float _622 = -_612;
    float _624 = fma(_594, _328, _622);
    float _626 = fma(_568, _568, _614);
    float _628 = fma(_602, _288, _606);
    float _630 = _586;
    int _632 = as_type<int>(_568);
    if (_598)
    {
        _630 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _634 = _630;
    float _636 = rsqrt(_626);
    float _638 = _334 + 0.5;
    float _640 = _616 + 0.5;
    float _642 = _620 + 0.5;
    float _644 = _330 + 0.5;
    float _646 = _628 + 0.5;
    float _648 = _624 + 0.5;
    int _650 = as_type<int>(_634);
    if (_598)
    {
        float _652 = _634 * 5.0;
        _650 = as_type<int>(_652);
    }
    int _654 = _650;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = as_type<float>(_654);
    if (_598)
    {
        out.m_51.x = 0.0;
    }
    out.m_61.x = _644;
    out.m_61.y = _638;
    out.m_61.z = _646;
    out.m_61.w = _642;
    float _660 = _558 * _636;
    float _662 = _562 * _636;
    out.m_63.x = _640;
    out.m_63.y = _648;
    float _664 = _660;
    if (_598)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_654);
        out.gl_Position.z = _2535;
    }
    out.m_65.w = _656;
    if (_598)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _666 = -_660;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _670 = _568 * _636;
    float _672 = -_662;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _676 = -_660;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _668 + _680;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _674 + _688;
    float _692 = -_662;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _696 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _686 + _698;
    float _702 = _678 * _678;
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _696);
    float _706 = fma(_694, _694, _702);
    float _708 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _704);
    bool _710 = _708 >= 0.0;
    float _712 = -_670;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _716 = fma(_714, _714, _706);
    float _718 = _668;
    if (_710)
    {
        _658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _658;
    if (_710)
    {
        out.m_51.x = 0.0;
    }
    if (_710)
    {
        float _722 = _720 * 5.0;
        _632 = as_type<int>(_722);
    }
    int _724 = _632;
    if (_710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_724);
        out.gl_Position.z = _2658;
    }
    if (_710)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _726 = in.m_57.x;
    float _728 = in.m_57.y;
    float _730 = in.m_57.z;
    float _732 = sqrt(_716);
    float _734 = in.m_67.x;
    float _736 = in.m_67.y;
    float _738 = in.m_67.z;
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _746 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _744;
    float _748 = _742 * _742;
    float _750 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _752 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _750;
    float _754 = fma(_746, _746, _748);
    float _756 = fma(_752, _752, _754);
    float _758 = _636 * _732;
    float _760 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _762 = sqrt(_756);
    float _764 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _766 = _730 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _736);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _758 * _768;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _734);
    float _780 = _758 * _772;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _738);
    float _784 = _770 * _776;
    float _786 = _758 * _774;
    float _788 = _778 * _780;
    float _790 = _784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_762, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _796 = _782 * _786;
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = precise::max(_794, 1.0);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _808 = precise::min(_802, 1.89999997615814208984375);
    float _810 = _804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _814 = fma(_810, _808, _552);
    float _816 = fma(_812, _808, _554);
    float _818 = _784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _814 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _816 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _818);
    float _830 = _822 * _822;
    float _832 = _826 * _826;
    float _834 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = _830 + _832;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _840 = sqrt(_836);
    float _842 = fma(_838, _808, _550);
    bool _844 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _838;
    float _848 = _784;
    float _850 = _834;
    float _852 = _830;
    float _854 = _814;
    if (!_844)
    {
        _846 = _830;
    }
    float _856 = _846;
    float _858 = _856;
    if (!_844)
    {
        _848 = _832;
    }
    float _860 = _848;
    float _862 = _860;
    if (!_844)
    {
        _850 = _816;
    }
    float _864 = _850;
    float _866 = _864;
    if (!_844)
    {
        _852 = _842;
    }
    float _868 = _852;
    bool _870 = !_844;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _840 + _876;
        float _880 = rsqrt(_836);
        float _882 = _878 * _874;
        float _884 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = _882 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _880 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_822, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_842, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _858 = _918;
        _862 = _920;
        _854 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _858;
    float _926 = _862;
    float _928 = _854;
    float _930 = _866;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _934 = _922 + _932;
    out.m_65.w = _656;
    float _936 = fma(_934, _934, _924);
    float _938 = _936 + _926;
    float _940 = sqrt(_938);
    bool _942 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _944 = isnan(_940);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _950 = _946 || _948;
    float _952 = _936;
    if (!_950)
    {
        _952 = 1.0;
    }
    float _954 = _952;
    bool _956 = !_950;
    float _958 = _954;
    if (!_956)
    {
        bool _960 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _962 = isnan(_940);
        bool _964 = _960 || _962;
        bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _968 = _964 || _966;
        if (!_968)
        {
            float _970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _972 = _940 + _970;
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _980 = _978 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _982 = 1.0 / _976;
            float _984 = _972 * _982;
            float _986 = fma(_984, _980, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _958 = _986;
            _988 = true;
        }
        else
        {
            bool _990 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _992 = isnan(_940);
            bool _994 = _990 || _992;
            bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _998 = _994 || _996;
            if (!_998)
            {
                float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1002 = _940 + _1000;
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1012 = 1.0 / _1006;
                float _1014 = _1002 * _1012;
                float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _958 = _1016;
                _988 = true;
            }
            else
            {
                _958 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _988 = false;
    float _1018 = _958;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1022 = _928 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1026 = _930 + _1024;
    bool _1028 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _922 + _1038;
    float _1042 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1044 = fma(_1026, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1046 = fma(_1040, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1048 = -_662;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1052 = -_670;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1056 = -_660;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1060 = _1058;
    float _1062 = _1050;
    float _1064 = _1054;
    if (!_1036)
    {
        float _1066 = _682 * _682;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = -_554;
        float _1072 = _1070 + _1044;
        float _1074 = fma(_690, _690, _1066);
        float _1076 = fma(_700, _700, _1074);
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1080 = sqrt(_1076);
        float _1082 = 1.0 / _758;
        float _1084 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = precise::min(_1080, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1088 = _1086 * _1068;
        float _1090 = -_550;
        float _1092 = _1090 + _1046;
        float _1094 = _1088 * _1082;
        float _1096 = -_552;
        float _1098 = _1096 + _1042;
        float _1100 = _1084 * _1094;
        float _1102 = _1072 * _1094;
        float _1104 = fma(_1098, _1100, _674);
        float _1106 = fma(_1092, _1100, _668);
        float _1108 = fma(_1084, _1102, _686);
        _1060 = _1106;
        _1062 = _1104;
        _1064 = _1108;
    }
    float _1110 = _1060;
    float _1112 = _1062;
    float _1114 = _1064;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1118 = _1110 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1122 = _1112 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1114 + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1122, _1122, _1130);
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = rsqrt(_1134);
    float _1138 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1140 = _1122 * _1138;
    float _1142 = _1126 * _1138;
    float _1144 = _1140 * _1140;
    float _1146 = _1142 * _1142;
    float _1148 = _1144 + _1146;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1150 + _1154;
    float _1158 = _1126;
    float _1160 = _1130;
    float _1162 = _1156;
    float _1164 = _1118;
    float _1166 = _1140;
    if (_1152)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1168;
    }
    float _1170 = _1158;
    if (_1152)
    {
        float _1172 = rsqrt(_1148);
        _1160 = _1172;
    }
    float _1174 = _1160;
    if (_1152)
    {
        float _1176 = _1156 * _1170;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = precise::max(0.0, _1128);
    float _1182 = _1180;
    if (_1152)
    {
        float _1184 = _1178 * 0.15915493667125701904296875;
        _718 = _1184;
    }
    float _1186 = _718;
    float _1188 = -_1138;
    float _1190 = -_1180;
    float _1192 = fma(_1118, _1188, _1190);
    float _1194 = _1178;
    float _1196 = _1186;
    float _1198 = _1192;
    if (_1152)
    {
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    if (_1152)
    {
        float _1206 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    float _1210 = _1136;
    float _1212 = _1208;
    if (_1152)
    {
        float _1214 = _1186 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        _1210 = _1216;
    }
    float _1218 = _1210;
    float _1220 = _1204;
    if (_1152)
    {
        float _1222 = fma(_1204, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1224;
    if (!_1152)
    {
        _1196 = _1142;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (_1152)
    {
        float _1232 = _1174 * _1224;
        _664 = _1232;
    }
    float _1234 = _664;
    if (!_1152)
    {
        _1226 = _1146;
    }
    float _1236 = _1226;
    float _1238 = sqrt(_1134);
    float _1240 = _1236;
    if (_1152)
    {
        float _1242 = _1218 + (-1.0);
        _1220 = _1242;
    }
    float _1244 = _1220;
    float _1246 = _1244;
    if (_1152)
    {
        float _1248 = _1140 * _1234;
        _1166 = _1248;
    }
    float _1250 = _1166;
    if (_1152)
    {
        float _1252 = _1142 * _1234;
        _1230 = _1252;
    }
    float _1254 = _1230;
    if (_1152)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1256;
    }
    float _1258 = _1212;
    if (!_1152)
    {
        _1246 = _1144;
    }
    float _1260 = _1246;
    float _1262 = _1260;
    if (_1152)
    {
        float _1264 = _1250 * _1250;
        _1262 = _1264;
    }
    float _1266 = _1262;
    if (_1152)
    {
        float _1268 = _1254 * _1254;
        _1240 = _1268;
    }
    float _1270 = _1240;
    if (_1152)
    {
        float _1272 = fma(_1192, _1218, _1258);
        _1198 = _1272;
    }
    float _1274 = _1198;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1278 = fma(_1274, _1274, _1266);
    float _1280 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1284 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1282);
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = _1278 + _1270;
    float _1290 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1292 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = rsqrt(_1288);
    float _1296 = -_1286;
    float _1298 = _1296 + 1.0;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1290);
    float _1304 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1292);
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1310 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1312 = abs(_1298);
    float _1314 = log2(_1312);
    float _1316 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1276);
    float _1322 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = -_1318;
    float _1328 = fma(_1326, _1300, 1.0);
    float _1330 = _1294 * _1250;
    float _1332 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = _1294 * _1274;
    float _1340 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1344 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1346 = _1294 * _1254;
    float _1348 = -_1340;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1348);
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1344);
    float _1356 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1350);
    float _1362 = exp2(_1352);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1360, -0.5, 0.5);
    float _1370 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1372 = fma(_1360, 0.5, 0.5);
    float _1374 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = _1338 + 1.0;
    float _1378 = log2(_1328);
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1382 = fma(_1372, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1386 = fma(_1372, _1382, -0.212114393711090087890625);
    float _1388 = 1.0 / _1364;
    float _1390 = -_1338;
    float _1392 = fma(_1362, _1376, _1390);
    float _1394 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1396 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1398 = fma(_1372, _1386, 1.570728778839111328125);
    float _1400 = fma(_1392, 0.5, 0.5);
    float _1402 = sqrt(_1368);
    float _1404 = _1378 * 0.693147182464599609375;
    float _1406 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1394 * _1388;
    float _1410 = _1396 * _1388;
    float _1412 = fma(_1408, 0.5, 0.5);
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = _1402 * 0.636619746685028076171875;
    float3 _3808 = float3(_1412, _1414, _1406);
    float _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3808, float3(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3808, float3(0.0), isnan(_3808)), level(0.0)).x;
    float3 _3819 = float3(_1412, _1414, _1406);
    float4 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3819, float3(0.0), isnan(_3819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3819, float3(0.0), isnan(_3819)), level(0.0)).xyzw;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = _1421.w;
    float _1431 = -_1398;
    float _1433 = fma(_1416, _1431, 1.0);
    float2 _3841 = float2(_1433, _1400);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3841, float2(0.0), isnan(_3841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3841, float2(0.0), isnan(_3841)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1447 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1449 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1447);
    float _1451 = exp2(_1445);
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1455 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1449);
    out.m_69.w = _1453;
    float _1457 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1396;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1364;
    float _1459 = -_1451;
    float _1461 = _1459 + 1.0;
    out.m_51.x = 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1465 = _1463 * _1418;
    float _1467 = -_1463;
    float _1469 = _1467 + 1.0;
    float _1471 = _1429 * _1465;
    float _1473 = _1429 * _1469;
    float _1475 = _1443 * _1465;
    float _1477 = fma(_1439, _1471, _1423);
    float _1479 = fma(_1441, _1471, _1425);
    float _1481 = fma(_1429, _1475, _1427);
    out.m_71.x = _1477;
    out.m_71.y = _1479;
    out.m_71.z = _1481;
    out.m_71.w = _1473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = in.m_46.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    float _104 = _87;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_51.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1548 = as_type<float>(_112);
        out.gl_Position.z = _1548;
    }
    if (!_100)
    {
        return out;
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    int _138 = as_type<int>(_136);
    if (_132)
    {
        out.m_51.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _114 = as_type<int>(_140);
    }
    int _142 = _114;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_142);
        out.gl_Position.z = _1606;
    }
    if (_132)
    {
        return out;
    }
    float _144 = in.m_53.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = in.m_55.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_55.w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _178 = _176 != 0;
    float _180 = in.m_55.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _184 = in.m_55.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _144;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_152)
    {
        float _192 = -_144;
        float _194 = _192 + 1.0;
        _138 = as_type<int>(_194);
    }
    int _196 = _138;
    if (!_152)
    {
        _104 = _144;
    }
    float _198 = _104;
    int _200 = 0;
    float _202 = _198;
    if (_156)
    {
        float _204 = -_144;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _212 = false;
    if (_152)
    {
        bool _214 = _148 > 0.5;
        _212 = _214;
    }
    bool _216 = _212;
    float _218 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _220 = in.m_57.w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_152)
    {
        float _224 = _216 ? as_type<float>(_196) : _144;
        _202 = _224;
    }
    float _226 = _202;
    out.m_59.x = _144;
    bool _228 = _158 > 0.5;
    float _230 = -_170;
    float _232 = _230 + 1.0;
    out.m_59.y = _170;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _236 = _180 > 0.5;
    float _238 = _180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _244 = _236 ? as_type<int>(_232) : as_type<int>(_170);
    float _246 = fma(_238, -2.0, _186);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    float _252 = -_240;
    float _254 = fma(_218, 2.0, _252);
    float _256 = _162 ? as_type<float>(_244) : _170;
    float _258 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _260 = _184 > 0.5;
    float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _264 = _240;
    float _266 = _170;
    float _268 = _184;
    if (!_156)
    {
        _264 = _144;
    }
    float _270 = _264;
    float _272 = _164 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _274 = _270;
    if (_156)
    {
        float _276 = _260 ? as_type<float>(_208) : _144;
        _274 = _276;
    }
    float _278 = _274;
    float _280 = fma(_258, _226, -0.5);
    float _282 = _182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _284 = fma(_272, _256, -0.5);
    int _286 = _260 ? as_type<int>(_232) : as_type<int>(_170);
    float _288 = fma(_282, _278, -0.5);
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _294 = _174 ? as_type<float>(_286) : _170;
    float _296 = -_96;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _254);
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _302 = _298;
    if (_178)
    {
        float _304 = _228 ? _232 : _170;
        _266 = _304;
    }
    float _306 = _266;
    float _308 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _292);
    bool _310 = _180 > 0.5;
    bool _312 = _310 && _168;
    float _314 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _290);
    float _316 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _246);
    float _318 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _308);
    float _320 = _262 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _322 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _314);
    if (!_168)
    {
        _300 = _144;
    }
    float _324 = _300;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _328 = fma(_294, _320, -0.5);
    float _330 = fma(_322, _280, _298);
    float _332 = -_316;
    float _334 = fma(_318, _284, _332);
    float _336 = _324;
    if (_250)
    {
        _302 = _148;
    }
    float _338 = _302;
    float _340 = in.m_46.x;
    float _342 = in.m_46.y;
    float _344 = in.m_46.z;
    float _346 = _338;
    if (_312)
    {
        float _348 = -_144;
        float _350 = _348 + 1.0;
        _188 = _350;
    }
    float _352 = _188;
    if (!_250)
    {
        _346 = _184;
    }
    float _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    bool _364 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _368 = _364 || _366;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    float _374 = fma(_242, _306, -0.5);
    float _376 = 0.0;
    float _378 = _354;
    float _380 = _356;
    if (!_250)
    {
        _376 = _180;
    }
    float _382 = _376;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _386 = _382;
    if (_168)
    {
        _336 = _352;
    }
    float _388 = _336;
    float _390 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _326);
    if (!_250)
    {
        _190 = _382;
    }
    float _392 = _190;
    float _394 = -_222;
    float _396 = fma(_384, 2.0, _394);
    float _398 = _392;
    if (_250)
    {
        _398 = _148;
    }
    float _400 = _398;
    float _402 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _404 = _402;
    if (_250)
    {
        _386 = _180;
    }
    float _406 = _386;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _356);
    float _410 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _414 = _412;
    if (!_372)
    {
        float _416 = _402 * _402;
        float _418 = _416 * 0.5;
        _378 = _418;
    }
    float _420 = _378;
    float _422 = _420;
    if (!_250)
    {
        _380 = _184;
    }
    float _424 = _380;
    float _426 = -_412;
    float _428 = fma(_410, 2.0, _426);
    float _430 = _424;
    if (_250)
    {
        _430 = _406;
    }
    float _432 = _430;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_250)
    {
        _268 = _406;
    }
    float _436 = _268;
    if (!_372)
    {
        float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _438;
    }
    float _440 = _422;
    float _442 = _440;
    if (_250)
    {
        _414 = _406;
    }
    float _444 = _414;
    bool _446 = !_372;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _402 * _452;
        float _462 = 1.0 / _456;
        float _464 = _458 * 0.693147182464599609375;
        float _466 = exp2(_460);
        float _468 = 1.0 / _464;
        float _470 = _466 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _468, _402);
        float _476 = _474 * _462;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _478;
    }
    float _480 = _442;
    bool _482 = !_372;
    if (!_482)
    {
        float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _486 = log2(_484);
        float _488 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _490 = _488 + 1.0;
        float _492 = 1.0 / _490;
        float _494 = _402 * _486;
        float _496 = exp2(_494);
        float _498 = -_496;
        float _500 = _498 + 1.0;
        float _502 = _500 * _492;
        _404 = _502;
    }
    float _504 = _404;
    float _506 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _508 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _434);
    if (!_250)
    {
        _448 = _148;
    }
    float _510 = _448;
    float _512 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _514 = fma(_504, _342, _506);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _520 = fma(_504, _340, _512);
    float _522 = fma(_514, _220, _360);
    float _524 = fma(_504, _344, _516);
    float _526 = fma(_518, _388, -0.5);
    float _528 = fma(_520, _220, _358);
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = fma(_524, _220, _362);
    float _536 = _522 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _530);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _552 = _546 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _550 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _552 + _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _554 + _566;
    float _570 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _576 = _432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _580 = -_96;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _396);
    float _584 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _572);
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = fma(_576, -2.0, _564);
    float _592 = fma(_584, -2.0, _574);
    float _594 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _390);
    float _596 = _558 * _558;
    bool _598 = _588 >= 0.0;
    float _600 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _508);
    float _602 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    float _604 = -_96;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _428);
    float _608 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _586);
    float _610 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _612 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _592);
    float _614 = fma(_562, _562, _596);
    float _616 = fma(_600, _526, _582);
    float _618 = -_610;
    float _620 = fma(_608, _374, _618);
    float _622 = -_612;
    float _624 = fma(_594, _328, _622);
    float _626 = fma(_568, _568, _614);
    float _628 = fma(_602, _288, _606);
    float _630 = _586;
    int _632 = as_type<int>(_568);
    if (_598)
    {
        _630 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _634 = _630;
    float _636 = rsqrt(_626);
    float _638 = _334 + 0.5;
    float _640 = _616 + 0.5;
    float _642 = _620 + 0.5;
    float _644 = _330 + 0.5;
    float _646 = _628 + 0.5;
    float _648 = _624 + 0.5;
    int _650 = as_type<int>(_634);
    if (_598)
    {
        float _652 = _634 * 5.0;
        _650 = as_type<int>(_652);
    }
    int _654 = _650;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = as_type<float>(_654);
    if (_598)
    {
        out.m_51.x = 0.0;
    }
    out.m_61.x = _644;
    out.m_61.y = _638;
    out.m_61.z = _646;
    out.m_61.w = _642;
    float _660 = _558 * _636;
    float _662 = _562 * _636;
    out.m_63.x = _640;
    out.m_63.y = _648;
    float _664 = _660;
    if (_598)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_654);
        out.gl_Position.z = _2535;
    }
    out.m_65.w = _656;
    if (_598)
    {
        return out;
    }
    float _666 = -_660;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _670 = _568 * _636;
    float _672 = -_662;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _676 = -_660;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _668 + _680;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _674 + _688;
    float _692 = -_662;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _696 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _686 + _698;
    float _702 = _678 * _678;
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _696);
    float _706 = fma(_694, _694, _702);
    float _708 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _704);
    bool _710 = _708 >= 0.0;
    float _712 = -_670;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _716 = fma(_714, _714, _706);
    float _718 = _668;
    if (_710)
    {
        _658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _658;
    if (_710)
    {
        out.m_51.x = 0.0;
    }
    if (_710)
    {
        float _722 = _720 * 5.0;
        _632 = as_type<int>(_722);
    }
    int _724 = _632;
    if (_710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_724);
        out.gl_Position.z = _2658;
    }
    if (_710)
    {
        return out;
    }
    float _726 = in.m_57.x;
    float _728 = in.m_57.y;
    float _730 = in.m_57.z;
    float _732 = sqrt(_716);
    float _734 = in.m_67.x;
    float _736 = in.m_67.y;
    float _738 = in.m_67.z;
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _746 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _744;
    float _748 = _742 * _742;
    float _750 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _752 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _750;
    float _754 = fma(_746, _746, _748);
    float _756 = fma(_752, _752, _754);
    float _758 = _636 * _732;
    float _760 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _762 = sqrt(_756);
    float _764 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _766 = _730 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _736);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _758 * _768;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _734);
    float _780 = _758 * _772;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _738);
    float _784 = _770 * _776;
    float _786 = _758 * _774;
    float _788 = _778 * _780;
    float _790 = _784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_762, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _796 = _782 * _786;
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = precise::max(_794, 1.0);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _808 = precise::min(_802, 1.89999997615814208984375);
    float _810 = _804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _814 = fma(_810, _808, _552);
    float _816 = fma(_812, _808, _554);
    float _818 = _784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _814 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _816 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _818);
    float _830 = _822 * _822;
    float _832 = _826 * _826;
    float _834 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = _830 + _832;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _840 = sqrt(_836);
    float _842 = fma(_838, _808, _550);
    bool _844 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _838;
    float _848 = _784;
    float _850 = _834;
    float _852 = _830;
    float _854 = _814;
    if (!_844)
    {
        _846 = _830;
    }
    float _856 = _846;
    float _858 = _856;
    if (!_844)
    {
        _848 = _832;
    }
    float _860 = _848;
    float _862 = _860;
    if (!_844)
    {
        _850 = _816;
    }
    float _864 = _850;
    float _866 = _864;
    if (!_844)
    {
        _852 = _842;
    }
    float _868 = _852;
    bool _870 = !_844;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _840 + _876;
        float _880 = rsqrt(_836);
        float _882 = _878 * _874;
        float _884 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = _882 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _880 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_822, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_842, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _858 = _918;
        _862 = _920;
        _854 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _858;
    float _926 = _862;
    float _928 = _854;
    float _930 = _866;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _934 = _922 + _932;
    out.m_65.w = _656;
    float _936 = fma(_934, _934, _924);
    float _938 = _936 + _926;
    float _940 = sqrt(_938);
    bool _942 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _944 = isnan(_940);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _950 = _946 || _948;
    float _952 = _936;
    if (!_950)
    {
        _952 = 1.0;
    }
    float _954 = _952;
    bool _956 = !_950;
    float _958 = _954;
    if (!_956)
    {
        bool _960 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _962 = isnan(_940);
        bool _964 = _960 || _962;
        bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _968 = _964 || _966;
        if (!_968)
        {
            float _970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _972 = _940 + _970;
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _980 = _978 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _982 = 1.0 / _976;
            float _984 = _972 * _982;
            float _986 = fma(_984, _980, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _958 = _986;
            _988 = true;
        }
        else
        {
            bool _990 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _992 = isnan(_940);
            bool _994 = _990 || _992;
            bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _998 = _994 || _996;
            if (!_998)
            {
                float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1002 = _940 + _1000;
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1012 = 1.0 / _1006;
                float _1014 = _1002 * _1012;
                float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _958 = _1016;
                _988 = true;
            }
            else
            {
                _958 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _988 = false;
    float _1018 = _958;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1022 = _928 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1026 = _930 + _1024;
    bool _1028 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _922 + _1038;
    float _1042 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1044 = fma(_1026, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1046 = fma(_1040, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1048 = -_662;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1052 = -_670;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1056 = -_660;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1060 = _1058;
    float _1062 = _1050;
    float _1064 = _1054;
    if (!_1036)
    {
        float _1066 = _682 * _682;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = -_554;
        float _1072 = _1070 + _1044;
        float _1074 = fma(_690, _690, _1066);
        float _1076 = fma(_700, _700, _1074);
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1080 = sqrt(_1076);
        float _1082 = 1.0 / _758;
        float _1084 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = precise::min(_1080, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1088 = _1086 * _1068;
        float _1090 = -_550;
        float _1092 = _1090 + _1046;
        float _1094 = _1088 * _1082;
        float _1096 = -_552;
        float _1098 = _1096 + _1042;
        float _1100 = _1084 * _1094;
        float _1102 = _1072 * _1094;
        float _1104 = fma(_1098, _1100, _674);
        float _1106 = fma(_1092, _1100, _668);
        float _1108 = fma(_1084, _1102, _686);
        _1060 = _1106;
        _1062 = _1104;
        _1064 = _1108;
    }
    float _1110 = _1060;
    float _1112 = _1062;
    float _1114 = _1064;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1118 = _1110 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1122 = _1112 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1114 + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1122, _1122, _1130);
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = rsqrt(_1134);
    float _1138 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1140 = _1122 * _1138;
    float _1142 = _1126 * _1138;
    float _1144 = _1140 * _1140;
    float _1146 = _1142 * _1142;
    float _1148 = _1144 + _1146;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1150 + _1154;
    float _1158 = _1126;
    float _1160 = _1130;
    float _1162 = _1156;
    float _1164 = _1118;
    float _1166 = _1140;
    if (_1152)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1168;
    }
    float _1170 = _1158;
    if (_1152)
    {
        float _1172 = rsqrt(_1148);
        _1160 = _1172;
    }
    float _1174 = _1160;
    if (_1152)
    {
        float _1176 = _1156 * _1170;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = precise::max(0.0, _1128);
    float _1182 = _1180;
    if (_1152)
    {
        float _1184 = _1178 * 0.15915493667125701904296875;
        _718 = _1184;
    }
    float _1186 = _718;
    float _1188 = -_1138;
    float _1190 = -_1180;
    float _1192 = fma(_1118, _1188, _1190);
    float _1194 = _1178;
    float _1196 = _1186;
    float _1198 = _1192;
    if (_1152)
    {
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    if (_1152)
    {
        float _1206 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    float _1210 = _1136;
    float _1212 = _1208;
    if (_1152)
    {
        float _1214 = _1186 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        _1210 = _1216;
    }
    float _1218 = _1210;
    float _1220 = _1204;
    if (_1152)
    {
        float _1222 = fma(_1204, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1224;
    if (!_1152)
    {
        _1196 = _1142;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (_1152)
    {
        float _1232 = _1174 * _1224;
        _664 = _1232;
    }
    float _1234 = _664;
    if (!_1152)
    {
        _1226 = _1146;
    }
    float _1236 = _1226;
    float _1238 = sqrt(_1134);
    float _1240 = _1236;
    if (_1152)
    {
        float _1242 = _1218 + (-1.0);
        _1220 = _1242;
    }
    float _1244 = _1220;
    float _1246 = _1244;
    if (_1152)
    {
        float _1248 = _1140 * _1234;
        _1166 = _1248;
    }
    float _1250 = _1166;
    if (_1152)
    {
        float _1252 = _1142 * _1234;
        _1230 = _1252;
    }
    float _1254 = _1230;
    if (_1152)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1256;
    }
    float _1258 = _1212;
    if (!_1152)
    {
        _1246 = _1144;
    }
    float _1260 = _1246;
    float _1262 = _1260;
    if (_1152)
    {
        float _1264 = _1250 * _1250;
        _1262 = _1264;
    }
    float _1266 = _1262;
    if (_1152)
    {
        float _1268 = _1254 * _1254;
        _1240 = _1268;
    }
    float _1270 = _1240;
    if (_1152)
    {
        float _1272 = fma(_1192, _1218, _1258);
        _1198 = _1272;
    }
    float _1274 = _1198;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1278 = fma(_1274, _1274, _1266);
    float _1280 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1284 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1282);
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = _1278 + _1270;
    float _1290 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1292 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = rsqrt(_1288);
    float _1296 = -_1286;
    float _1298 = _1296 + 1.0;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1290);
    float _1304 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1292);
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1310 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1312 = abs(_1298);
    float _1314 = log2(_1312);
    float _1316 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1276);
    float _1322 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = -_1318;
    float _1328 = fma(_1326, _1300, 1.0);
    float _1330 = _1294 * _1250;
    float _1332 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = _1294 * _1274;
    float _1340 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1344 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1346 = _1294 * _1254;
    float _1348 = -_1340;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1348);
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1344);
    float _1356 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1350);
    float _1362 = exp2(_1352);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1360, -0.5, 0.5);
    float _1370 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1372 = fma(_1360, 0.5, 0.5);
    float _1374 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = _1338 + 1.0;
    float _1378 = log2(_1328);
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1382 = fma(_1372, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1386 = fma(_1372, _1382, -0.212114393711090087890625);
    float _1388 = 1.0 / _1364;
    float _1390 = -_1338;
    float _1392 = fma(_1362, _1376, _1390);
    float _1394 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1396 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1398 = fma(_1372, _1386, 1.570728778839111328125);
    float _1400 = fma(_1392, 0.5, 0.5);
    float _1402 = sqrt(_1368);
    float _1404 = _1378 * 0.693147182464599609375;
    float _1406 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1394 * _1388;
    float _1410 = _1396 * _1388;
    float _1412 = fma(_1408, 0.5, 0.5);
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = _1402 * 0.636619746685028076171875;
    float3 _3808 = float3(_1412, _1414, _1406);
    float _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3808, float3(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3808, float3(0.0), isnan(_3808)), level(0.0)).x;
    float3 _3819 = float3(_1412, _1414, _1406);
    float4 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3819, float3(0.0), isnan(_3819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3819, float3(0.0), isnan(_3819)), level(0.0)).xyzw;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = _1421.w;
    float _1431 = -_1398;
    float _1433 = fma(_1416, _1431, 1.0);
    float2 _3841 = float2(_1433, _1400);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3841, float2(0.0), isnan(_3841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3841, float2(0.0), isnan(_3841)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1447 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1449 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1447);
    float _1451 = exp2(_1445);
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1455 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1449);
    out.m_69.w = _1453;
    float _1457 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1396;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1364;
    float _1459 = -_1451;
    float _1461 = _1459 + 1.0;
    out.m_51.x = 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1465 = _1463 * _1418;
    float _1467 = -_1463;
    float _1469 = _1467 + 1.0;
    float _1471 = _1429 * _1465;
    float _1473 = _1429 * _1469;
    float _1475 = _1443 * _1465;
    float _1477 = fma(_1439, _1471, _1423);
    float _1479 = fma(_1441, _1471, _1425);
    float _1481 = fma(_1429, _1475, _1427);
    out.m_71.x = _1477;
    out.m_71.y = _1479;
    out.m_71.z = _1481;
    out.m_71.w = _1473;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _988 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = in.m_46.w;
    float _89 = trunc(_85);
    int _92 = int(_89);
    float _94 = -_87;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _96;
    bool _100 = _92 >= 1;
    float _102 = 0.0;
    float _104 = _87;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_51.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1548 = as_type<float>(_112);
        out.gl_Position.z = _1548;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _116 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_87);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = float(_92);
    bool _128 = _96 >= _126;
    bool _130 = !_124;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    int _138 = as_type<int>(_136);
    if (_132)
    {
        out.m_51.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _114 = as_type<int>(_140);
    }
    int _142 = _114;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_142);
        out.gl_Position.z = _1606;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_53.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = in.m_55.x;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _156 = _154 != 0;
    float _158 = in.m_55.w;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_53.y;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _174 = _172 != 0;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _178 = _176 != 0;
    float _180 = in.m_55.y;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _184 = in.m_55.z;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = _144;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_152)
    {
        float _192 = -_144;
        float _194 = _192 + 1.0;
        _138 = as_type<int>(_194);
    }
    int _196 = _138;
    if (!_152)
    {
        _104 = _144;
    }
    float _198 = _104;
    int _200 = 0;
    float _202 = _198;
    if (_156)
    {
        float _204 = -_144;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _212 = false;
    if (_152)
    {
        bool _214 = _148 > 0.5;
        _212 = _214;
    }
    bool _216 = _212;
    float _218 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _220 = in.m_57.w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_152)
    {
        float _224 = _216 ? as_type<float>(_196) : _144;
        _202 = _224;
    }
    float _226 = _202;
    out.m_59.x = _144;
    bool _228 = _158 > 0.5;
    float _230 = -_170;
    float _232 = _230 + 1.0;
    out.m_59.y = _170;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _236 = _180 > 0.5;
    float _238 = _180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _244 = _236 ? as_type<int>(_232) : as_type<int>(_170);
    float _246 = fma(_238, -2.0, _186);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    float _252 = -_240;
    float _254 = fma(_218, 2.0, _252);
    float _256 = _162 ? as_type<float>(_244) : _170;
    float _258 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _260 = _184 > 0.5;
    float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _264 = _240;
    float _266 = _170;
    float _268 = _184;
    if (!_156)
    {
        _264 = _144;
    }
    float _270 = _264;
    float _272 = _164 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _274 = _270;
    if (_156)
    {
        float _276 = _260 ? as_type<float>(_208) : _144;
        _274 = _276;
    }
    float _278 = _274;
    float _280 = fma(_258, _226, -0.5);
    float _282 = _182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _284 = fma(_272, _256, -0.5);
    int _286 = _260 ? as_type<int>(_232) : as_type<int>(_170);
    float _288 = fma(_282, _278, -0.5);
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _294 = _174 ? as_type<float>(_286) : _170;
    float _296 = -_96;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _254);
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _302 = _298;
    if (_178)
    {
        float _304 = _228 ? _232 : _170;
        _266 = _304;
    }
    float _306 = _266;
    float _308 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _292);
    bool _310 = _180 > 0.5;
    bool _312 = _310 && _168;
    float _314 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _290);
    float _316 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[76].y, _246);
    float _318 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].w, _308);
    float _320 = _262 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _322 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[77].z, _314);
    if (!_168)
    {
        _300 = _144;
    }
    float _324 = _300;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _328 = fma(_294, _320, -0.5);
    float _330 = fma(_322, _280, _298);
    float _332 = -_316;
    float _334 = fma(_318, _284, _332);
    float _336 = _324;
    if (_250)
    {
        _302 = _148;
    }
    float _338 = _302;
    float _340 = in.m_46.x;
    float _342 = in.m_46.y;
    float _344 = in.m_46.z;
    float _346 = _338;
    if (_312)
    {
        float _348 = -_144;
        float _350 = _348 + 1.0;
        _188 = _350;
    }
    float _352 = _188;
    if (!_250)
    {
        _346 = _184;
    }
    float _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    bool _364 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _368 = _364 || _366;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    float _374 = fma(_242, _306, -0.5);
    float _376 = 0.0;
    float _378 = _354;
    float _380 = _356;
    if (!_250)
    {
        _376 = _180;
    }
    float _382 = _376;
    float _384 = _354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _386 = _382;
    if (_168)
    {
        _336 = _352;
    }
    float _388 = _336;
    float _390 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _326);
    if (!_250)
    {
        _190 = _382;
    }
    float _392 = _190;
    float _394 = -_222;
    float _396 = fma(_384, 2.0, _394);
    float _398 = _392;
    if (_250)
    {
        _398 = _148;
    }
    float _400 = _398;
    float _402 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _404 = _402;
    if (_250)
    {
        _386 = _180;
    }
    float _406 = _386;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[83].z, _356);
    float _410 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _414 = _412;
    if (!_372)
    {
        float _416 = _402 * _402;
        float _418 = _416 * 0.5;
        _378 = _418;
    }
    float _420 = _378;
    float _422 = _420;
    if (!_250)
    {
        _380 = _184;
    }
    float _424 = _380;
    float _426 = -_412;
    float _428 = fma(_410, 2.0, _426);
    float _430 = _424;
    if (_250)
    {
        _430 = _406;
    }
    float _432 = _430;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_250)
    {
        _268 = _406;
    }
    float _436 = _268;
    if (!_372)
    {
        float _438 = _420 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _422 = _438;
    }
    float _440 = _422;
    float _442 = _440;
    if (_250)
    {
        _414 = _406;
    }
    float _444 = _414;
    bool _446 = !_372;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _402 * _452;
        float _462 = 1.0 / _456;
        float _464 = _458 * 0.693147182464599609375;
        float _466 = exp2(_460);
        float _468 = 1.0 / _464;
        float _470 = _466 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _468, _402);
        float _476 = _474 * _462;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _478;
    }
    float _480 = _442;
    bool _482 = !_372;
    if (!_482)
    {
        float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _486 = log2(_484);
        float _488 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _490 = _488 + 1.0;
        float _492 = 1.0 / _490;
        float _494 = _402 * _486;
        float _496 = exp2(_494);
        float _498 = -_496;
        float _500 = _498 + 1.0;
        float _502 = _500 * _492;
        _404 = _502;
    }
    float _504 = _404;
    float _506 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _508 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _434);
    if (!_250)
    {
        _448 = _148;
    }
    float _510 = _448;
    float _512 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _514 = fma(_504, _342, _506);
    float _516 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _520 = fma(_504, _340, _512);
    float _522 = fma(_514, _220, _360);
    float _524 = fma(_504, _344, _516);
    float _526 = fma(_518, _388, -0.5);
    float _528 = fma(_520, _220, _358);
    float _530 = _522 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _534 = fma(_524, _220, _362);
    float _536 = _522 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _530);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
    float _550 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _552 = _546 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _550 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _562 = _552 + _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _554 + _566;
    float _570 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _576 = _432 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[28].x, _570);
    float _580 = -_96;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[86].x, _396);
    float _584 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].w, _572);
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _578);
    float _590 = fma(_576, -2.0, _564);
    float _592 = fma(_584, -2.0, _574);
    float _594 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].w, _390);
    float _596 = _558 * _558;
    bool _598 = _588 >= 0.0;
    float _600 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[87].z, _508);
    float _602 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    float _604 = -_96;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _428);
    float _608 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[82].w, _586);
    float _610 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _612 = fma(_96, (*spvDescriptorSet0.vp_c9)._m0[86].y, _592);
    float _614 = fma(_562, _562, _596);
    float _616 = fma(_600, _526, _582);
    float _618 = -_610;
    float _620 = fma(_608, _374, _618);
    float _622 = -_612;
    float _624 = fma(_594, _328, _622);
    float _626 = fma(_568, _568, _614);
    float _628 = fma(_602, _288, _606);
    float _630 = _586;
    int _632 = as_type<int>(_568);
    if (_598)
    {
        _630 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _634 = _630;
    float _636 = rsqrt(_626);
    float _638 = _334 + 0.5;
    float _640 = _616 + 0.5;
    float _642 = _620 + 0.5;
    float _644 = _330 + 0.5;
    float _646 = _628 + 0.5;
    float _648 = _624 + 0.5;
    int _650 = as_type<int>(_634);
    if (_598)
    {
        float _652 = _634 * 5.0;
        _650 = as_type<int>(_652);
    }
    int _654 = _650;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = as_type<float>(_654);
    if (_598)
    {
        out.m_51.x = 0.0;
    }
    out.m_61.x = _644;
    out.m_61.y = _638;
    out.m_61.z = _646;
    out.m_61.w = _642;
    float _660 = _558 * _636;
    float _662 = _562 * _636;
    out.m_63.x = _640;
    out.m_63.y = _648;
    float _664 = _660;
    if (_598)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_654);
        out.gl_Position.z = _2535;
    }
    out.m_65.w = _656;
    if (_598)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _666 = -_660;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _670 = _568 * _636;
    float _672 = -_662;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _676 = -_660;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = _668 + _680;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _690 = _674 + _688;
    float _692 = -_662;
    float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _696 = _682 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = _686 + _698;
    float _702 = _678 * _678;
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[28].x, _696);
    float _706 = fma(_694, _694, _702);
    float _708 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _704);
    bool _710 = _708 >= 0.0;
    float _712 = -_670;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _716 = fma(_714, _714, _706);
    float _718 = _668;
    if (_710)
    {
        _658 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _720 = _658;
    if (_710)
    {
        out.m_51.x = 0.0;
    }
    if (_710)
    {
        float _722 = _720 * 5.0;
        _632 = as_type<int>(_722);
    }
    int _724 = _632;
    if (_710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2658 = as_type<float>(_724);
        out.gl_Position.z = _2658;
    }
    if (_710)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _726 = in.m_57.x;
    float _728 = in.m_57.y;
    float _730 = in.m_57.z;
    float _732 = sqrt(_716);
    float _734 = in.m_67.x;
    float _736 = in.m_67.y;
    float _738 = in.m_67.z;
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _746 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _744;
    float _748 = _742 * _742;
    float _750 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _752 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _750;
    float _754 = fma(_746, _746, _748);
    float _756 = fma(_752, _752, _754);
    float _758 = _636 * _732;
    float _760 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _762 = sqrt(_756);
    float _764 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _766 = _730 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _736);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _776 = _758 * _768;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _734);
    float _780 = _758 * _772;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _738);
    float _784 = _770 * _776;
    float _786 = _758 * _774;
    float _788 = _778 * _780;
    float _790 = _784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_762, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _796 = _782 * _786;
    float _798 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = precise::max(_794, 1.0);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _806 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _808 = precise::min(_802, 1.89999997615814208984375);
    float _810 = _804 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _814 = fma(_810, _808, _552);
    float _816 = fma(_812, _808, _554);
    float _818 = _784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _814 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _826 = _816 + _824;
    float _828 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _818);
    float _830 = _822 * _822;
    float _832 = _826 * _826;
    float _834 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _828);
    float _836 = _830 + _832;
    float _838 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _840 = sqrt(_836);
    float _842 = fma(_838, _808, _550);
    bool _844 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _838;
    float _848 = _784;
    float _850 = _834;
    float _852 = _830;
    float _854 = _814;
    if (!_844)
    {
        _846 = _830;
    }
    float _856 = _846;
    float _858 = _856;
    if (!_844)
    {
        _848 = _832;
    }
    float _860 = _848;
    float _862 = _860;
    if (!_844)
    {
        _850 = _816;
    }
    float _864 = _850;
    float _866 = _864;
    if (!_844)
    {
        _852 = _842;
    }
    float _868 = _852;
    bool _870 = !_844;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _878 = _840 + _876;
        float _880 = rsqrt(_836);
        float _882 = _878 * _874;
        float _884 = _842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = _882 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = sin(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = fma(_890, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _898 = _880 * _896;
        float _900 = _894 + (-1.0);
        float _902 = fma(_822, _898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _904 = fma(_826, _898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _906 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _910 = _902 + _908;
        float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _914 = _904 + _912;
        float _916 = fma(_842, _894, _906);
        float _918 = _910 * _910;
        float _920 = _914 * _914;
        _872 = _916;
        _858 = _918;
        _862 = _920;
        _854 = _902;
        _866 = _904;
    }
    float _922 = _872;
    float _924 = _858;
    float _926 = _862;
    float _928 = _854;
    float _930 = _866;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _934 = _922 + _932;
    out.m_65.w = _656;
    float _936 = fma(_934, _934, _924);
    float _938 = _936 + _926;
    float _940 = sqrt(_938);
    bool _942 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _944 = isnan(_940);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _950 = _946 || _948;
    float _952 = _936;
    if (!_950)
    {
        _952 = 1.0;
    }
    float _954 = _952;
    bool _956 = !_950;
    float _958 = _954;
    if (!_956)
    {
        bool _960 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _962 = isnan(_940);
        bool _964 = _960 || _962;
        bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _968 = _964 || _966;
        if (!_968)
        {
            float _970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _972 = _940 + _970;
            float _974 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _976 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _974;
            float _978 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _980 = _978 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _982 = 1.0 / _976;
            float _984 = _972 * _982;
            float _986 = fma(_984, _980, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _958 = _986;
            _988 = true;
        }
        else
        {
            bool _990 = _940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _992 = isnan(_940);
            bool _994 = _990 || _992;
            bool _996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _998 = _994 || _996;
            if (!_998)
            {
                float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1002 = _940 + _1000;
                float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1010 = _1008 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1012 = 1.0 / _1006;
                float _1014 = _1002 * _1012;
                float _1016 = fma(_1014, _1010, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _958 = _1016;
                _988 = true;
            }
            else
            {
                _958 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _988 = false;
    float _1018 = _958;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1022 = _928 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1026 = _930 + _1024;
    bool _1028 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1040 = _922 + _1038;
    float _1042 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1044 = fma(_1026, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1046 = fma(_1040, _1018, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1048 = -_662;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1052 = -_670;
    float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1056 = -_660;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1046);
    float _1060 = _1058;
    float _1062 = _1050;
    float _1064 = _1054;
    if (!_1036)
    {
        float _1066 = _682 * _682;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = -_554;
        float _1072 = _1070 + _1044;
        float _1074 = fma(_690, _690, _1066);
        float _1076 = fma(_700, _700, _1074);
        float _1078 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1080 = sqrt(_1076);
        float _1082 = 1.0 / _758;
        float _1084 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1086 = precise::min(_1080, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1088 = _1086 * _1068;
        float _1090 = -_550;
        float _1092 = _1090 + _1046;
        float _1094 = _1088 * _1082;
        float _1096 = -_552;
        float _1098 = _1096 + _1042;
        float _1100 = _1084 * _1094;
        float _1102 = _1072 * _1094;
        float _1104 = fma(_1098, _1100, _674);
        float _1106 = fma(_1092, _1100, _668);
        float _1108 = fma(_1084, _1102, _686);
        _1060 = _1106;
        _1062 = _1104;
        _1064 = _1108;
    }
    float _1110 = _1060;
    float _1112 = _1062;
    float _1114 = _1064;
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1118 = _1110 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1122 = _1112 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1126 = _1114 + _1124;
    float _1128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1122, _1122, _1130);
    float _1134 = fma(_1126, _1126, _1132);
    float _1136 = rsqrt(_1134);
    float _1138 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1140 = _1122 * _1138;
    float _1142 = _1126 * _1138;
    float _1144 = _1140 * _1140;
    float _1146 = _1142 * _1142;
    float _1148 = _1144 + _1146;
    float _1150 = sqrt(_1148);
    bool _1152 = _1150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1150 + _1154;
    float _1158 = _1126;
    float _1160 = _1130;
    float _1162 = _1156;
    float _1164 = _1118;
    float _1166 = _1140;
    if (_1152)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1168;
    }
    float _1170 = _1158;
    if (_1152)
    {
        float _1172 = rsqrt(_1148);
        _1160 = _1172;
    }
    float _1174 = _1160;
    if (_1152)
    {
        float _1176 = _1156 * _1170;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = precise::max(0.0, _1128);
    float _1182 = _1180;
    if (_1152)
    {
        float _1184 = _1178 * 0.15915493667125701904296875;
        _718 = _1184;
    }
    float _1186 = _718;
    float _1188 = -_1138;
    float _1190 = -_1180;
    float _1192 = fma(_1118, _1188, _1190);
    float _1194 = _1178;
    float _1196 = _1186;
    float _1198 = _1192;
    if (_1152)
    {
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1194 = _1202;
    }
    float _1204 = _1194;
    if (_1152)
    {
        float _1206 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    float _1210 = _1136;
    float _1212 = _1208;
    if (_1152)
    {
        float _1214 = _1186 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        _1210 = _1216;
    }
    float _1218 = _1210;
    float _1220 = _1204;
    if (_1152)
    {
        float _1222 = fma(_1204, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1224;
    if (!_1152)
    {
        _1196 = _1142;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (_1152)
    {
        float _1232 = _1174 * _1224;
        _664 = _1232;
    }
    float _1234 = _664;
    if (!_1152)
    {
        _1226 = _1146;
    }
    float _1236 = _1226;
    float _1238 = sqrt(_1134);
    float _1240 = _1236;
    if (_1152)
    {
        float _1242 = _1218 + (-1.0);
        _1220 = _1242;
    }
    float _1244 = _1220;
    float _1246 = _1244;
    if (_1152)
    {
        float _1248 = _1140 * _1234;
        _1166 = _1248;
    }
    float _1250 = _1166;
    if (_1152)
    {
        float _1252 = _1142 * _1234;
        _1230 = _1252;
    }
    float _1254 = _1230;
    if (_1152)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1256;
    }
    float _1258 = _1212;
    if (!_1152)
    {
        _1246 = _1144;
    }
    float _1260 = _1246;
    float _1262 = _1260;
    if (_1152)
    {
        float _1264 = _1250 * _1250;
        _1262 = _1264;
    }
    float _1266 = _1262;
    if (_1152)
    {
        float _1268 = _1254 * _1254;
        _1240 = _1268;
    }
    float _1270 = _1240;
    if (_1152)
    {
        float _1272 = fma(_1192, _1218, _1258);
        _1198 = _1272;
    }
    float _1274 = _1198;
    float _1276 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1278 = fma(_1274, _1274, _1266);
    float _1280 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1284 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1282);
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = _1278 + _1270;
    float _1290 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1292 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = rsqrt(_1288);
    float _1296 = -_1286;
    float _1298 = _1296 + 1.0;
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1290);
    float _1304 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1292);
    float _1308 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1310 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1312 = abs(_1298);
    float _1314 = log2(_1312);
    float _1316 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1306);
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1276);
    float _1322 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = -_1318;
    float _1328 = fma(_1326, _1300, 1.0);
    float _1330 = _1294 * _1250;
    float _1332 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1334 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1338 = _1294 * _1274;
    float _1340 = _1330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1344 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1336);
    float _1346 = _1294 * _1254;
    float _1348 = -_1340;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1348);
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1344);
    float _1356 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1350);
    float _1362 = exp2(_1352);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1354);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1360, -0.5, 0.5);
    float _1370 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1372 = fma(_1360, 0.5, 0.5);
    float _1374 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = _1338 + 1.0;
    float _1378 = log2(_1328);
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1370);
    float _1382 = fma(_1372, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1384 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1386 = fma(_1372, _1382, -0.212114393711090087890625);
    float _1388 = 1.0 / _1364;
    float _1390 = -_1338;
    float _1392 = fma(_1362, _1376, _1390);
    float _1394 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1396 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1384);
    float _1398 = fma(_1372, _1386, 1.570728778839111328125);
    float _1400 = fma(_1392, 0.5, 0.5);
    float _1402 = sqrt(_1368);
    float _1404 = _1378 * 0.693147182464599609375;
    float _1406 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1394 * _1388;
    float _1410 = _1396 * _1388;
    float _1412 = fma(_1408, 0.5, 0.5);
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = _1402 * 0.636619746685028076171875;
    float3 _3808 = float3(_1412, _1414, _1406);
    float _1418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3808, float3(0.0), isnan(_3808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3808, float3(0.0), isnan(_3808)), level(0.0)).x;
    float3 _3819 = float3(_1412, _1414, _1406);
    float4 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3819, float3(0.0), isnan(_3819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3819, float3(0.0), isnan(_3819)), level(0.0)).xyzw;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = _1421.w;
    float _1431 = -_1398;
    float _1433 = fma(_1416, _1431, 1.0);
    float2 _3841 = float2(_1433, _1400);
    float3 _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3841, float2(0.0), isnan(_3841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3841, float2(0.0), isnan(_3841)), level(0.0)).xyz;
    float _1439 = _1437.x;
    float _1441 = _1437.y;
    float _1443 = _1437.z;
    float _1445 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1447 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1449 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1447);
    float _1451 = exp2(_1445);
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1455 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1449);
    out.m_69.w = _1453;
    float _1457 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1396;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1364;
    float _1459 = -_1451;
    float _1461 = _1459 + 1.0;
    out.m_51.x = 1.0;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1465 = _1463 * _1418;
    float _1467 = -_1463;
    float _1469 = _1467 + 1.0;
    float _1471 = _1429 * _1465;
    float _1473 = _1429 * _1469;
    float _1475 = _1443 * _1465;
    float _1477 = fma(_1439, _1471, _1423);
    float _1479 = fma(_1441, _1471, _1425);
    float _1481 = fma(_1429, _1475, _1427);
    out.m_71.x = _1477;
    out.m_71.y = _1479;
    out.m_71.z = _1481;
    out.m_71.w = _1473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

