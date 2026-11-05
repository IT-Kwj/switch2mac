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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _713 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_713, float2(0.0), isnan(_713))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_74;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_74)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    float _98 = in.m_40.x;
    uint _100 = uint(int(uint(_96) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _98;
    bool _110 = as_type<int>(_106) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _142;
            _154 = _144;
            _156 = _146;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _182;
            _154 = _184;
            _156 = _186;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _214;
            _154 = _216;
            _156 = _218;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = -_68;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _234 = -_108;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _238 = -_68;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _242 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _244 = _232 * _232;
    float _246 = -_66;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _250 = _240 * _240;
    float _252 = -_66;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _256 = fma(_236, _236, _244);
    float _258 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _260 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _262 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _264 = fma(_248, _248, _256);
    float _266 = -_108;
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _270 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _272 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _274 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _276 = fma(_268, _268, _250);
    float _278 = sqrt(_264);
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _282 = fma(_254, _254, _276);
    float _284 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _286 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _288 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _290 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _292 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _294 = sqrt(_282);
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _300 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _302 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _304 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _258);
    float _306 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _262);
    bool _308 = _278 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _310 = 1.0 / _222;
    bool _312 = _278 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _314 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _272);
    bool _316 = !_308;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _260);
    float _322 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _270);
    float _324 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _274);
    float _326 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _304);
    bool _328 = _294 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _306);
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _314);
    float _334 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _292);
    int _336 = 2;
    if (!_308)
    {
        _336 = 1;
    }
    int _338 = _336;
    float _340 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _320);
    bool _342 = _294 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _344 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _346 = _338;
    if (!_312)
    {
        _346 = _318;
    }
    int _348 = _346;
    float _350 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _242);
    bool _352 = !_328;
    int _354 = _352 ? 0 : 1;
    float _356 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _322);
    float _358 = float(_348);
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _324);
    float _362 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _280);
    float _364 = precise::min(_358, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _366 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _284);
    int _368 = 2;
    if (!_328)
    {
        _368 = 1;
    }
    int _370 = _368;
    float _372 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _286);
    int _374 = _370;
    if (!_342)
    {
        _374 = _354;
    }
    int _376 = _374;
    float _378 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _288);
    bool _380 = _364 != 1.0;
    bool _382 = isnan(_364);
    bool _384 = _380 || _382;
    bool _386 = isnan(1.0);
    bool _388 = _384 || _386;
    float _390 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _344);
    float _392 = float(_376);
    float _394 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _290);
    float _396 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _296);
    float _398 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _298);
    float _400 = precise::min(_392, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _402 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _300);
    float _404 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _302);
    float _406 = _326 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _408 = _330 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _410 = _332 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _412 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _334);
    float _414 = _406;
    float _416 = _408;
    float _418 = _410;
    if (_388)
    {
        float _420 = _340 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _414 = _420;
    }
    float _422 = _414;
    float _424 = _422;
    if (_388)
    {
        float _426 = _356 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _416 = _426;
    }
    float _428 = _416;
    float _430 = _428;
    if (_388)
    {
        float _432 = _360 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _418 = _432;
    }
    float _434 = _418;
    bool _436 = _400 != 1.0;
    bool _438 = isnan(_400);
    bool _440 = _436 || _438;
    bool _442 = isnan(1.0);
    bool _444 = _440 || _442;
    float _446 = _412 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _448 = _364 != 0.0;
    bool _450 = isnan(_364);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = _310 * _224;
    bool _460 = _400 != 0.0;
    bool _462 = isnan(_400);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = _310 * _226;
    float _472 = _310 * _228;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = float(int(_91));
    float _478 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _396);
    float _480 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _394);
    float _482 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _404);
    float _484 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _372);
    float _486 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _398);
    float _488 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _390);
    float _490 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _402);
    float _492 = _478 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _494 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _350);
    float _496 = rint(_476);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    uint _502 = clamp(_500, 0u, 65535u);
    float _504 = _480 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _506 = _492;
    float _508 = _434;
    float _510 = _504;
    float _512 = _446;
    if (_444)
    {
        float _514 = _482 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _506 = _514;
    }
    float _516 = _506;
    float _518 = _516;
    if (!_456)
    {
        float _520 = _484 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _508 = _520;
    }
    float _522 = _508;
    if (_444)
    {
        float _524 = _486 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _510 = _524;
    }
    float _526 = _510;
    float _528 = _526;
    if (!_468)
    {
        float _530 = _488 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _518 = _530;
    }
    float _532 = _518;
    if (_444)
    {
        float _534 = _490 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _512 = _534;
    }
    float _536 = _512;
    float _538 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _474;
    float _540 = _536;
    if (!_468)
    {
        float _542 = _494 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _540 = _542;
    }
    float _544 = _540;
    float _546 = rint(_364);
    float _548 = precise::max(_546, 0.0);
    uint _550 = uint(_548);
    uint _552 = clamp(_550, 0u, 65535u);
    float _554 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _362);
    float _556 = 0.0 + _522;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _562 = 0.0 + _532;
    float _564 = precise::clamp(_562, 0.0, 1.0);
    float _566 = _538 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _568 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_456)
    {
        float _570 = _554 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _424 = _570;
    }
    float _572 = _424;
    float _574 = rint(_400);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    uint _580 = clamp(_578, 0u, 65535u);
    float _582 = _538 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _584 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _366);
    float _586 = _560 * _564;
    float _588 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _378);
    float _590 = fma(_566, 0.5, _458);
    float _592 = fma(_566, -0.5, _458);
    float _594 = _558 * _568;
    float _596 = fma(_582, 0.5, _470);
    float _598 = fma(_582, -0.5, _470);
    if (!_456)
    {
        float _600 = _584 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _430 = _600;
    }
    float _602 = _430;
    float _604 = _558 * _560;
    float _606 = fma(_586, 0.5, _544);
    if (!_468)
    {
        float _608 = _588 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _528 = _608;
    }
    float _610 = _528;
    float _612 = _568 * _564;
    float _614 = fma(_586, -0.5, _544);
    float _616 = fma(_594, 0.5, _572);
    float _618 = fma(_594, -0.5, _572);
    float _620 = fma(_604, 0.5, _602);
    float _622 = fma(_604, -0.5, _602);
    float _624 = fma(_612, 0.5, _610);
    float _626 = fma(_612, -0.5, _610);
    float3 _1807 = float3(_592, _596, float(int(_502)));
    float3 _1811 = select(_1807, float3(0.0), isnan(_1807));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1811.xy, uint(rint(_1811.z)), _474);
    float3 _1820 = float3(_590, _596, float(int(_502)));
    float3 _1822 = select(_1820, float3(0.0), isnan(_1820));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1822.xy, uint(rint(_1822.z)), _474);
    float3 _1831 = float3(_590, _598, float(int(_502)));
    float3 _1833 = select(_1831, float3(0.0), isnan(_1831));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1833.xy, uint(rint(_1833.z)), _474);
    float3 _1842 = float3(_592, _598, float(int(_502)));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1844.xy, uint(rint(_1844.z)), _474);
    float3 _1853 = float3(_618, _620, float(int(_552)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1855.xy, uint(rint(_1855.z)), _558);
    float3 _1864 = float3(_616, _620, float(int(_552)));
    float3 _1866 = select(_1864, float3(0.0), isnan(_1864));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1866.xy, uint(rint(_1866.z)), _558);
    float3 _1875 = float3(_626, _606, float(int(_580)));
    float3 _1877 = select(_1875, float3(0.0), isnan(_1875));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1877.xy, uint(rint(_1877.z)), _564);
    float3 _1886 = float3(_624, _606, float(int(_580)));
    float3 _1888 = select(_1886, float3(0.0), isnan(_1886));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1888.xy, uint(rint(_1888.z)), _564);
    float3 _1897 = float3(_616, _622, float(int(_552)));
    float3 _1899 = select(_1897, float3(0.0), isnan(_1897));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1899.xy, uint(rint(_1899.z)), _558);
    float3 _1908 = float3(_624, _614, float(int(_580)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), _564);
    float3 _1919 = float3(_618, _622, float(int(_552)));
    float3 _1921 = select(_1919, float3(0.0), isnan(_1919));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1921.xy, uint(rint(_1921.z)), _558);
    float3 _1930 = float3(_626, _614, float(int(_580)));
    float3 _1932 = select(_1930, float3(0.0), isnan(_1930));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1932.xy, uint(rint(_1932.z)), _564);
    float _652 = _630 + _628;
    float _654 = _652 + _632;
    float _656 = -_66;
    float _658 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _660 = _656 + _658;
    float _662 = -_66;
    float _664 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _666 = _662 + _664;
    float _668 = _654 + _634;
    float _670 = _660 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    float _674 = _666 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = _638 + _636;
    float _680 = fma(_668, 0.25, _672);
    float _682 = _642 + _640;
    float _684 = _678 + _644;
    float _686 = _682 + _646;
    float _688 = _684 + _648;
    float _690 = _686 + _650;
    float _692 = _688 * 0.25;
    float _694 = _690 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _696 = _694 * 0.25;
    float _698 = fma(_692, (*spvDescriptorSet0.fp_c3)._m0[49].z, _696);
    float _700 = _698 + _676;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _680;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _700;
    return out;
}

