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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _272 = false;
    bool _270 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _933 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_933, float2(0.0), isnan(_933)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _950 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_950, float2(0.0), isnan(_950))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_950, float2(0.0), isnan(_950))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = _150 * _156;
    float _168 = -_160;
    float _170 = fma(_150, _152, _168);
    float _172 = _164 * _164;
    float _174 = -_70;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = -_166;
    float _182 = fma(_146, _154, _180);
    float _184 = fma(_170, _170, _172);
    float _186 = _178 * _74;
    float _188 = -_178;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _194 = fma(_182, _182, _184);
    float _196 = -_178;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _200 = _178 * _72;
    bool _202 = !_192;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_194);
    uint _209 = 2u;
    if (!_192)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_198)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _164 * _207;
    float _221 = _170 * _207;
    int _224 = int(_217) << 2;
    float _226 = _182 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_224) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_221, _258, _186);
    float _262 = fma(_219, _258, _200);
    float _264 = fma(_226, _258, _178);
    bool _266 = as_type<int>(_236) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_236) == 1488;
        _270 = _268;
        if (!_270)
        {
            _272 = true;
        }
    }
    float _306;
    float _308;
    float _310;
    float _312;
    if (!_270)
    {
        if (!_272)
        {
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _280 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _280);
            float _290 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
            float _292 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
            float _296 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].z, _288);
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _306 = _304;
            _308 = _302;
            _310 = _300;
            _312 = _298;
        }
    }
    if ((false || _272) || _270)
    {
        if ((!_272) || _270)
        {
            _270 = false;
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _320 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _320);
            float _330 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].z, _322);
            float _332 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[6].z, _326);
            float _336 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[7].z, _328);
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _306 = _344;
            _308 = _342;
            _310 = _340;
            _312 = _338;
        }
        if (false || _272)
        {
            _272 = false;
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _352 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _352);
            float _362 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[8].z, _354);
            float _364 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[10].z, _358);
            float _368 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[11].z, _360);
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _306 = _376;
            _308 = _374;
            _310 = _372;
            _312 = _370;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = float(int(_215));
    float _388 = 1.0 / _378;
    float _390 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _392 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _394 = rint(_386);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    uint _400 = clamp(_398, 0u, 65535u);
    float _402 = _388 * _380;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _388 * _382;
    float _408 = _388 * _384;
    float _410 = fma(_404, _390, _406);
    float _412 = fma(_404, _392, _408);
    float _414 = -_392;
    float _416 = fma(_404, _414, _408);
    float3 _1595 = float3(_408, _410, float(int(_400)));
    float3 _1599 = select(_1595, float3(0.0), isnan(_1595));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1599.xy, uint(rint(_1599.z)), _404);
    float3 _1608 = float3(_412, _410, float(int(_400)));
    float3 _1610 = select(_1608, float3(0.0), isnan(_1608));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1610.xy, uint(rint(_1610.z)), _404);
    float3 _1619 = float3(_416, _410, float(int(_400)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1621.xy, uint(rint(_1621.z)), _404);
    float3 _1630 = float3(_412, _406, float(int(_400)));
    float3 _1632 = select(_1630, float3(0.0), isnan(_1630));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1632.xy, uint(rint(_1632.z)), _404);
    float3 _1641 = float3(_408, _406, float(int(_400)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1643.xy, uint(rint(_1643.z)), _404);
    float3 _1652 = float3(_416, _406, float(int(_400)));
    float3 _1654 = select(_1652, float3(0.0), isnan(_1652));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1654.xy, uint(rint(_1654.z)), _404);
    float _430 = -_200;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _434 = -_186;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _438 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _440 = -_390;
    float _442 = fma(_404, _440, _406);
    float _444 = _432 * _432;
    float _446 = _200 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _448 = _200 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _450 = fma(_436, _436, _444);
    float _452 = -_178;
    float _454 = _452 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _456 = _200 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _458 = _200 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _460 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[24].x, _446);
    float _462 = fma(_454, _454, _450);
    float _464 = _200 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _466 = _200 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _468 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[22].x, _456);
    float _470 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[23].x, _458);
    float _472 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[19].x, _464);
    float _474 = sqrt(_462);
    float _476 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[20].x, _466);
    float _478 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[22].z, _468);
    float _480 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[19].z, _472);
    float _482 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[23].z, _470);
    float _484 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[20].z, _476);
    float _486 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[18].x, _448);
    float _488 = _480 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _490 = _200 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _492 = _484 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _494 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[24].z, _460);
    float _496 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[18].z, _486);
    float _498 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _500 = _474 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _502 = _474 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _504 = !_500;
    int _506 = _504 ? 0 : 1;
    int _508 = 2;
    float _510 = _488;
    float _512 = _492;
    if (!_500)
    {
        _508 = 1;
    }
    int _514 = _508;
    int _516 = _514;
    if (!_502)
    {
        _516 = _506;
    }
    int _518 = _516;
    float _520 = float(_518);
    float _522 = precise::min(_520, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _524 = _522 != 1.0;
    bool _526 = isnan(_522);
    bool _528 = _524 || _526;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = _522 != 0.0;
    bool _536 = isnan(_522);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = rint(_522);
    float _546 = precise::max(_544, 0.0);
    uint _548 = uint(_546);
    uint _550 = clamp(_548, 0u, 65535u);
    if (_532)
    {
        float _552 = _478 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _510 = _552;
    }
    float _554 = _510;
    float _556 = _200 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _558 = _554;
    if (_532)
    {
        float _560 = _482 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _512 = _560;
    }
    float _562 = _512;
    float _564 = _200 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _566 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[21].x, _556);
    float _568 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[17].x, _564);
    float _570 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[21].z, _566);
    float _572 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[16].x, _490);
    float _574 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[17].z, _568);
    float _576 = _570 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _578 = _576;
    float _580 = _562;
    if (_532)
    {
        float _582 = _494 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = _584;
    if (!_542)
    {
        float _588 = _496 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _586 = _588;
    }
    float _590 = _586;
    float _592 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[16].z, _572);
    if (!_542)
    {
        float _594 = _574 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _580 = _594;
    }
    float _596 = _580;
    float _598 = 0.0 + _590;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    if (!_542)
    {
        float _602 = _592 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _558 = _602;
    }
    float _604 = _558;
    float3 _1987 = float3(_412, _442, float(int(_400)));
    float3 _1989 = select(_1987, float3(0.0), isnan(_1987));
    float _606 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1989.xy, uint(rint(_1989.z)), _404);
    float _608 = fma(_600, _498, _596);
    float _610 = _420 + _418;
    float _612 = _610 + _422;
    float3 _2008 = float3(_408, _442, float(int(_400)));
    float3 _2010 = select(_2008, float3(0.0), isnan(_2008));
    float _614 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2010.xy, uint(rint(_2010.z)), _404);
    float3 _2019 = float3(_416, _442, float(int(_400)));
    float3 _2021 = select(_2019, float3(0.0), isnan(_2019));
    float _616 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2021.xy, uint(rint(_2021.z)), _404);
    float3 _2030 = float3(_604, _608, float(int(_550)));
    float3 _2032 = select(_2030, float3(0.0), isnan(_2030));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2032.xy, uint(rint(_2032.z)), _600);
    float _620 = _612 + _424;
    float _622 = -_438;
    float _624 = fma(_600, _622, _604);
    float3 _2050 = float3(_624, _608, float(int(_550)));
    float3 _2052 = select(_2050, float3(0.0), isnan(_2050));
    float _626 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2052.xy, uint(rint(_2052.z)), _600);
    float3 _2061 = float3(_604, _596, float(int(_550)));
    float3 _2063 = select(_2061, float3(0.0), isnan(_2061));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2063.xy, uint(rint(_2063.z)), _600);
    float _630 = _620 + _426;
    float _632 = -_498;
    float _634 = fma(_600, _632, _596);
    float _636 = _630 + _428;
    float _638 = fma(_600, _438, _604);
    float3 _2088 = float3(_638, _596, float(int(_550)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2090.xy, uint(rint(_2090.z)), _600);
    float3 _2099 = float3(_638, _608, float(int(_550)));
    float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2101.xy, uint(rint(_2101.z)), _600);
    float3 _2110 = float3(_624, _596, float(int(_550)));
    float3 _2112 = select(_2110, float3(0.0), isnan(_2110));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2112.xy, uint(rint(_2112.z)), _600);
    float3 _2121 = float3(_638, _634, float(int(_550)));
    float3 _2123 = select(_2121, float3(0.0), isnan(_2121));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2123.xy, uint(rint(_2123.z)), _600);
    float3 _2132 = float3(_604, _634, float(int(_550)));
    float3 _2134 = select(_2132, float3(0.0), isnan(_2132));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2134.xy, uint(rint(_2134.z)), _600);
    float3 _2143 = float3(_624, _634, float(int(_550)));
    float3 _2145 = select(_2143, float3(0.0), isnan(_2143));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2145.xy, uint(rint(_2145.z)), _600);
    float _652 = _200 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _654 = _200 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _656 = _200 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _658 = _200 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _660 = _200 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _662 = _200 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _664 = _200 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _666 = _200 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _668 = -_186;
    float _670 = _668 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _672 = _200 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _674 = -_200;
    float _676 = _674 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _678 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[27].x, _658);
    float _680 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[28].x, _656);
    float _682 = _676 * _676;
    float _684 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[29].x, _672);
    float _686 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[30].x, _652);
    float _688 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[31].x, _662);
    float _690 = fma(_670, _670, _682);
    float _692 = -_178;
    float _694 = _692 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _696 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[32].x, _664);
    float _698 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[33].x, _666);
    float _700 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[28].z, _680);
    float _702 = fma(_694, _694, _690);
    float _704 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[29].z, _684);
    float _706 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[30].z, _686);
    float _708 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[31].z, _688);
    float _710 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[32].z, _696);
    float _712 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[33].z, _698);
    float _714 = sqrt(_702);
    float _716 = _700 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _718 = _706 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _720 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[26].x, _660);
    float _722 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[27].z, _678);
    float _724 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[25].x, _654);
    float _726 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[26].z, _720);
    float _728 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[25].z, _724);
    bool _730 = _714 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _732 = _714 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _734 = !_730;
    int _736 = _734 ? 0 : 1;
    int _738 = 2;
    float _740 = _716;
    float _742 = _718;
    if (!_730)
    {
        _738 = 1;
    }
    int _744 = _738;
    int _746 = _744;
    if (!_732)
    {
        _746 = _736;
    }
    int _748 = _746;
    float _750 = float(_748);
    float _752 = _704 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _754 = precise::min(_750, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _756 = _754 != 1.0;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(1.0);
    bool _764 = _760 || _762;
    float _766 = _752;
    if (_764)
    {
        float _768 = _708 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _740 = _768;
    }
    float _770 = _740;
    float _772 = _770;
    if (_764)
    {
        float _774 = _710 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _766 = _774;
    }
    float _776 = _766;
    float _778 = _776;
    if (_764)
    {
        float _780 = _712 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _742 = _780;
    }
    float _782 = _742;
    bool _784 = _754 != 0.0;
    bool _786 = isnan(_754);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = rint(_754);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    uint _800 = clamp(_798, 0u, 65535u);
    float _802 = _782;
    if (!_792)
    {
        float _804 = _722 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _802 = _804;
    }
    float _806 = _802;
    if (!_792)
    {
        float _808 = _726 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _778 = _808;
    }
    float _810 = _778;
    if (!_792)
    {
        float _812 = _728 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _772 = _812;
    }
    float _814 = _772;
    float _816 = 0.0 + _806;
    float _818 = precise::clamp(_816, 0.0, 1.0);
    float _820 = fma(_498, _818, _810);
    float _822 = -_438;
    float _824 = fma(_822, _818, _814);
    float _826 = fma(_438, _818, _814);
    float3 _2474 = float3(_814, _820, float(int(_800)));
    float3 _2476 = select(_2474, float3(0.0), isnan(_2474));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2476.xy, uint(rint(_2476.z)), _818);
    float3 _2485 = float3(_824, _820, float(int(_800)));
    float3 _2487 = select(_2485, float3(0.0), isnan(_2485));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2487.xy, uint(rint(_2487.z)), _818);
    float3 _2496 = float3(_826, _820, float(int(_800)));
    float3 _2498 = select(_2496, float3(0.0), isnan(_2496));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2498.xy, uint(rint(_2498.z)), _818);
    float3 _2507 = float3(_826, _810, float(int(_800)));
    float3 _2509 = select(_2507, float3(0.0), isnan(_2507));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2509.xy, uint(rint(_2509.z)), _818);
    float3 _2518 = float3(_814, _810, float(int(_800)));
    float3 _2520 = select(_2518, float3(0.0), isnan(_2518));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2520.xy, uint(rint(_2520.z)), _818);
    float _838 = -_498;
    float _840 = fma(_838, _818, _810);
    float3 _2535 = float3(_824, _810, float(int(_800)));
    float3 _2537 = select(_2535, float3(0.0), isnan(_2535));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2537.xy, uint(rint(_2537.z)), _818);
    float3 _2546 = float3(_826, _840, float(int(_800)));
    float3 _2548 = select(_2546, float3(0.0), isnan(_2546));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2548.xy, uint(rint(_2548.z)), _818);
    float3 _2557 = float3(_814, _840, float(int(_800)));
    float3 _2559 = select(_2557, float3(0.0), isnan(_2557));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2559.xy, uint(rint(_2559.z)), _818);
    float3 _2568 = float3(_824, _840, float(int(_800)));
    float3 _2570 = select(_2568, float3(0.0), isnan(_2568));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2570.xy, uint(rint(_2570.z)), _818);
    float2 _2576 = float2(_56, _58);
    float _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2576, float2(0.0), isnan(_2576))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2576, float2(0.0), isnan(_2576))).x;
    float _852 = _636 + _606;
    float _854 = -_178;
    float _856 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _858 = _854 + _856;
    float _860 = -_178;
    float _862 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _864 = _860 + _862;
    float _866 = _858 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _868 = precise::clamp(_866, 0.0, 1.0);
    float _870 = _852 + _614;
    float _872 = _870 + _616;
    float _874 = _642 + _618;
    float _876 = _874 + _626;
    float _878 = _876 + _640;
    float _880 = _878 + _628;
    float _882 = _880 + _644;
    float _884 = _882 + _646;
    float _886 = _884 + _648;
    float _888 = fma(_872, 0.111111111938953399658203125, _868);
    float _890 = _886 + _650;
    float _892 = _890 * 0.111111111938953399658203125;
    float _894 = _832 + _828;
    float _896 = _894 + _830;
    float _898 = _896 + _834;
    float _900 = _898 + _836;
    float _902 = _900 + _842;
    float _904 = _902 + _844;
    float _906 = _904 + _846;
    float _908 = _906 + _848;
    float _910 = _908 * 0.111111111938953399658203125;
    float _912 = _910 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _914 = fma(_892, (*spvDescriptorSet0.fp_c3)._m0[49].z, _912);
    float _916 = _864 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _918 = precise::clamp(_916, 0.0, 1.0);
    float _920 = _914 + _918;
    out.m_49.x = _850;
    out.m_49.y = _888;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _920;
    return out;
}

