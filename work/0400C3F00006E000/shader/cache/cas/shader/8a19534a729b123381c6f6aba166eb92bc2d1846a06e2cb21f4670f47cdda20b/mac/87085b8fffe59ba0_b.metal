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
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _709 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_709, float2(0.0), isnan(_709))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_709, float2(0.0), isnan(_709))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = in.m_40.x;
    float _66 = _62 * _56;
    float _68 = -_62;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    float _104 = _62 * _64;
    bool _106 = as_type<int>(_102) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_102) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _138;
            _150 = _140;
            _152 = _142;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _178;
            _150 = _180;
            _152 = _182;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _210;
            _150 = _212;
            _152 = _214;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = -_66;
    float _228 = _226 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _230 = -_104;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _234 = -_66;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _238 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _240 = _228 * _228;
    float _242 = -_62;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _246 = _236 * _236;
    float _248 = -_62;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _252 = fma(_232, _232, _240);
    float _254 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _256 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _258 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _260 = fma(_244, _244, _252);
    float _262 = -_104;
    float _264 = _262 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _266 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _268 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _270 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _272 = fma(_264, _264, _246);
    float _274 = sqrt(_260);
    float _276 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _278 = fma(_250, _250, _272);
    float _280 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _282 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _284 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _286 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _288 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _290 = sqrt(_278);
    float _292 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _294 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _296 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _298 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _300 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[19].x, _254);
    float _302 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[20].x, _258);
    bool _304 = _274 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _306 = 1.0 / _218;
    bool _308 = _274 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _310 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[21].x, _268);
    bool _312 = !_304;
    int _314 = _312 ? 0 : 1;
    float _316 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[22].x, _256);
    float _318 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[23].x, _266);
    float _320 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[24].x, _270);
    float _322 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _300);
    bool _324 = _290 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _326 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _302);
    float _328 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _310);
    float _330 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[29].x, _288);
    int _332 = 2;
    if (!_304)
    {
        _332 = 1;
    }
    int _334 = _332;
    float _336 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _316);
    bool _338 = _290 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _340 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _342 = _334;
    if (!_308)
    {
        _342 = _314;
    }
    int _344 = _342;
    float _346 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[26].x, _238);
    bool _348 = !_324;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _318);
    float _354 = float(_344);
    float _356 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _320);
    float _358 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[16].x, _276);
    float _360 = precise::min(_354, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _362 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[17].x, _280);
    int _364 = 2;
    if (!_324)
    {
        _364 = 1;
    }
    int _366 = _364;
    float _368 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[18].x, _282);
    int _370 = _366;
    if (!_338)
    {
        _370 = _350;
    }
    int _372 = _370;
    float _374 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[25].x, _284);
    bool _376 = _360 != 1.0;
    bool _378 = isnan(_360);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    float _386 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[27].x, _340);
    float _388 = float(_372);
    float _390 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[28].x, _286);
    float _392 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[30].x, _292);
    float _394 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[31].x, _294);
    float _396 = precise::min(_388, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _398 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[32].x, _296);
    float _400 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[33].x, _298);
    float _402 = _322 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _404 = _326 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _406 = _328 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _408 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _330);
    float _410 = _402;
    float _412 = _404;
    float _414 = _406;
    if (_384)
    {
        float _416 = _336 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _410 = _416;
    }
    float _418 = _410;
    float _420 = _418;
    if (_384)
    {
        float _422 = _352 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _412 = _422;
    }
    float _424 = _412;
    float _426 = _424;
    if (_384)
    {
        float _428 = _356 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _414 = _428;
    }
    float _430 = _414;
    bool _432 = _396 != 1.0;
    bool _434 = isnan(_396);
    bool _436 = _432 || _434;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    float _442 = _408 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _444 = _360 != 0.0;
    bool _446 = isnan(_360);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = _306 * _220;
    bool _456 = _396 != 0.0;
    bool _458 = isnan(_396);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = _306 * _222;
    float _468 = _306 * _224;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = float(int(_89));
    float _474 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _392);
    float _476 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _390);
    float _478 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _400);
    float _480 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _368);
    float _482 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _394);
    float _484 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _386);
    float _486 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _398);
    float _488 = _474 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _490 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _346);
    float _492 = rint(_472);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    uint _498 = clamp(_496, 0u, 65535u);
    float _500 = _476 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _502 = _488;
    float _504 = _430;
    float _506 = _500;
    float _508 = _442;
    if (_440)
    {
        float _510 = _478 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _502 = _510;
    }
    float _512 = _502;
    float _514 = _512;
    if (!_452)
    {
        float _516 = _480 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _504 = _516;
    }
    float _518 = _504;
    if (_440)
    {
        float _520 = _482 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _506 = _520;
    }
    float _522 = _506;
    float _524 = _522;
    if (!_464)
    {
        float _526 = _484 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _514 = _526;
    }
    float _528 = _514;
    if (_440)
    {
        float _530 = _486 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _508 = _530;
    }
    float _532 = _508;
    float _534 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _470;
    float _536 = _532;
    if (!_464)
    {
        float _538 = _490 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _536 = _538;
    }
    float _540 = _536;
    float _542 = rint(_360);
    float _544 = precise::max(_542, 0.0);
    uint _546 = uint(_544);
    uint _548 = clamp(_546, 0u, 65535u);
    float _550 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _358);
    float _552 = 0.0 + _518;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _558 = 0.0 + _528;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = _534 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _564 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_452)
    {
        float _566 = _550 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _420 = _566;
    }
    float _568 = _420;
    float _570 = rint(_396);
    float _572 = precise::max(_570, 0.0);
    uint _574 = uint(_572);
    uint _576 = clamp(_574, 0u, 65535u);
    float _578 = _534 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _580 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _362);
    float _582 = _556 * _560;
    float _584 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _374);
    float _586 = fma(_562, 0.5, _454);
    float _588 = fma(_562, -0.5, _454);
    float _590 = _554 * _564;
    float _592 = fma(_578, 0.5, _466);
    float _594 = fma(_578, -0.5, _466);
    if (!_452)
    {
        float _596 = _580 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _426 = _596;
    }
    float _598 = _426;
    float _600 = _554 * _556;
    float _602 = fma(_582, 0.5, _540);
    if (!_464)
    {
        float _604 = _584 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _524 = _604;
    }
    float _606 = _524;
    float _608 = _564 * _560;
    float _610 = fma(_582, -0.5, _540);
    float _612 = fma(_590, 0.5, _568);
    float _614 = fma(_590, -0.5, _568);
    float _616 = fma(_600, 0.5, _598);
    float _618 = fma(_600, -0.5, _598);
    float _620 = fma(_608, 0.5, _606);
    float _622 = fma(_608, -0.5, _606);
    float3 _1799 = float3(_588, _592, float(int(_498)));
    float3 _1803 = select(_1799, float3(0.0), isnan(_1799));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1803.xy, uint(rint(_1803.z)), _470);
    float3 _1812 = float3(_586, _592, float(int(_498)));
    float3 _1814 = select(_1812, float3(0.0), isnan(_1812));
    float _626 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1814.xy, uint(rint(_1814.z)), _470);
    float3 _1823 = float3(_586, _594, float(int(_498)));
    float3 _1825 = select(_1823, float3(0.0), isnan(_1823));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1825.xy, uint(rint(_1825.z)), _470);
    float3 _1834 = float3(_588, _594, float(int(_498)));
    float3 _1836 = select(_1834, float3(0.0), isnan(_1834));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1836.xy, uint(rint(_1836.z)), _470);
    float3 _1845 = float3(_614, _616, float(int(_548)));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1847.xy, uint(rint(_1847.z)), _554);
    float3 _1856 = float3(_612, _616, float(int(_548)));
    float3 _1858 = select(_1856, float3(0.0), isnan(_1856));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1858.xy, uint(rint(_1858.z)), _554);
    float3 _1867 = float3(_622, _602, float(int(_576)));
    float3 _1869 = select(_1867, float3(0.0), isnan(_1867));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1869.xy, uint(rint(_1869.z)), _560);
    float3 _1878 = float3(_620, _602, float(int(_576)));
    float3 _1880 = select(_1878, float3(0.0), isnan(_1878));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1880.xy, uint(rint(_1880.z)), _560);
    float3 _1889 = float3(_612, _618, float(int(_548)));
    float3 _1891 = select(_1889, float3(0.0), isnan(_1889));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1891.xy, uint(rint(_1891.z)), _554);
    float3 _1900 = float3(_620, _610, float(int(_576)));
    float3 _1902 = select(_1900, float3(0.0), isnan(_1900));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1902.xy, uint(rint(_1902.z)), _560);
    float3 _1911 = float3(_614, _618, float(int(_548)));
    float3 _1913 = select(_1911, float3(0.0), isnan(_1911));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1913.xy, uint(rint(_1913.z)), _554);
    float3 _1922 = float3(_622, _610, float(int(_576)));
    float3 _1924 = select(_1922, float3(0.0), isnan(_1922));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1924.xy, uint(rint(_1924.z)), _560);
    float _648 = _626 + _624;
    float _650 = _648 + _628;
    float _652 = -_62;
    float _654 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _656 = _652 + _654;
    float _658 = -_62;
    float _660 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _662 = _658 + _660;
    float _664 = _650 + _630;
    float _666 = _656 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _668 = precise::clamp(_666, 0.0, 1.0);
    float _670 = _662 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    float _674 = _634 + _632;
    float _676 = fma(_664, 0.25, _668);
    float _678 = _638 + _636;
    float _680 = _674 + _640;
    float _682 = _678 + _642;
    float _684 = _680 + _644;
    float _686 = _682 + _646;
    float _688 = _684 * 0.25;
    float _690 = _686 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _692 = _690 * 0.25;
    float _694 = fma(_688, (*spvDescriptorSet0.fp_c3)._m0[49].z, _692);
    float _696 = _694 + _672;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _676;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _696;
    return out;
}

