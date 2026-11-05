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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
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
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _641 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = in.m_40.x;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _62 * _66;
    float _70 = -_68;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_68;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    float _108 = _68 * _64;
    float _110 = _68 * _56;
    uint _112 = uint(int(uint(_106) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    bool _120 = as_type<int>(_118) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_118) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _110 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _110 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _110 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _152;
            _164 = _154;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _110 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _192;
            _164 = _194;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _110 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _110 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _110 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _110 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _224;
            _164 = _226;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = -_110;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _244 = -_108;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = -_110;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _252 = -_108;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _256 = _242 * _242;
    float _258 = -_68;
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _262 = _110 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _264 = _110 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _266 = fma(_246, _246, _256);
    float _268 = _250 * _250;
    float _270 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _262);
    float _272 = fma(_260, _260, _266);
    float _274 = -_68;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _278 = fma(_254, _254, _268);
    float _280 = 1.0 / _232;
    float _282 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _264);
    float _284 = fma(_276, _276, _278);
    float _286 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _270);
    float _288 = _110 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _290 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _282);
    float _292 = _110 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _296 = sqrt(_272);
    float _298 = _110 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _300 = _110 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _302 = _110 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _304 = _110 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _306 = _110 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _308 = _110 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _310 = _110 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _312 = sqrt(_284);
    float _314 = _110 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _316 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _292);
    float _318 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _300);
    float _320 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _302);
    float _322 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _304);
    float _324 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _306);
    float _326 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _308);
    bool _328 = _296 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _330 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _310);
    bool _332 = _296 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _334 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _314);
    bool _336 = !_328;
    int _338 = _336 ? 0 : 1;
    float _340 = _280 * _234;
    float _342 = _280 * _236;
    float _344 = _280 * _238;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    bool _348 = _312 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _350 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _330);
    bool _352 = _312 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _354 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _320);
    bool _356 = !_348;
    int _358 = _356 ? 0 : 1;
    float _360 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _334);
    int _362 = 2;
    int _364 = 2;
    float _366 = _294;
    if (!_328)
    {
        _362 = 1;
    }
    int _368 = _362;
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _316);
    int _372 = _368;
    if (!_332)
    {
        _372 = _338;
    }
    int _374 = _372;
    float _376 = _110 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _378 = float(int(_102));
    float _380 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _322);
    float _382 = float(_374);
    float _384 = _110 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_348)
    {
        _364 = 1;
    }
    int _386 = _364;
    float _388 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _376);
    int _390 = _386;
    if (!_352)
    {
        _390 = _358;
    }
    int _392 = _390;
    float _394 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _384);
    float _396 = precise::min(_382, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _398 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _388);
    float _400 = float(_392);
    float _402 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _394);
    bool _404 = _396 != 1.0;
    bool _406 = isnan(_396);
    bool _408 = _404 || _406;
    bool _410 = isnan(1.0);
    bool _412 = _408 || _410;
    float _414 = _398 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _416 = precise::min(_400, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _418 = _110 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _420 = _110 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _422 = _396 != 0.0;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = rint(_378);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    uint _438 = clamp(_436, 0u, 65535u);
    bool _440 = _416 != 1.0;
    bool _442 = isnan(_416);
    bool _444 = _440 || _442;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    float _450 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _420);
    bool _452 = _416 != 0.0;
    bool _454 = isnan(_416);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _318);
    float _464 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _324);
    float _466 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _450);
    float _468 = _414;
    if (_412)
    {
        float _470 = _402 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = _110 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _476 = rint(_396);
    float _478 = precise::max(_476, 0.0);
    uint _480 = uint(_478);
    uint _482 = clamp(_480, 0u, 65535u);
    float _484 = _380 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _486 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _326);
    float _488 = _472;
    float _490 = _484;
    if (!_430)
    {
        float _492 = _370 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _488 = _492;
    }
    float _494 = _488;
    if (_412)
    {
        float _496 = _464 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _490 = _496;
    }
    float _498 = _490;
    float _500 = _498;
    if (_448)
    {
        float _502 = _290 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _366 = _502;
    }
    float _504 = _366;
    float _506 = _110 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _508 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _288);
    float _510 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _298);
    float _512 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _418);
    float _514 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _506);
    float _516 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _474);
    float _518 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _508);
    float _520 = rint(_416);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    uint _526 = clamp(_524, 0u, 65535u);
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _512);
    float _530 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _516);
    float _532 = _504;
    if (!_460)
    {
        float _534 = _350 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = _354 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _540 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _510);
    float _542 = _538;
    if (_412)
    {
        float _544 = _518 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _542 = _544;
    }
    float _546 = _542;
    float _548 = _466 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _550 = _528 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _552 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _514);
    float _554 = _548;
    float _556 = _550;
    float _558 = _546;
    if (_448)
    {
        float _560 = _530 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _554 = _560;
    }
    float _562 = _554;
    float _564 = _562;
    if (_448)
    {
        float _566 = _360 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _556 = _566;
    }
    float _568 = _556;
    float _570 = _568;
    if (!_460)
    {
        float _572 = _540 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _564 = _572;
    }
    float _574 = _564;
    if (!_460)
    {
        float _576 = _462 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _570 = _576;
    }
    float _578 = _570;
    float _580 = 0.0 + _536;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    if (!_430)
    {
        float _584 = _552 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _500 = _584;
    }
    float _586 = _500;
    if (!_430)
    {
        float _588 = _486 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _558 = _588;
    }
    float _590 = _558;
    float _592 = 0.0 + _494;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float3 _1677 = float3(_574, _578, float(int(_526)));
    float3 _1681 = select(_1677, float3(0.0), isnan(_1677));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1681.xy, uint(rint(_1681.z)), _582);
    float3 _1690 = float3(_590, _586, float(int(_482)));
    float3 _1692 = select(_1690, float3(0.0), isnan(_1690));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1692.xy, uint(rint(_1692.z)), _594);
    float3 _1701 = float3(_340, _342, float(int(_438)));
    float3 _1703 = select(_1701, float3(0.0), isnan(_1701));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1703.xy, uint(rint(_1703.z)), _346);
    float _602 = -_68;
    float _604 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _606 = _602 + _604;
    float _608 = -_68;
    float _610 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _612 = _608 + _610;
    float _614 = _606 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    float _618 = _596 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _620 = fma(_598, (*spvDescriptorSet0.fp_c3)._m0[49].z, _618);
    float _622 = _612 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _600 + _616;
    float _628 = _620 + _624;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _626;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _628;
    return out;
}

