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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _652 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_652, float2(0.0), isnan(_652))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_652, float2(0.0), isnan(_652))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _60;
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
    float _98 = in.m_44.x;
    uint _100 = uint(int(uint(_96) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _98;
    bool _110 = as_type<int>(_106) == 336;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 608;
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
            float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _144;
            _154 = _142;
            _156 = _146;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _184;
            _154 = _182;
            _156 = _186;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _216;
            _154 = _214;
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
    float _242 = _232 * _232;
    float _244 = -_66;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _248 = _240 * _240;
    float _250 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _252 = fma(_236, _236, _242);
    float _254 = -_108;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _258 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _260 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _262 = fma(_246, _246, _252);
    float _264 = -_66;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _268 = fma(_256, _256, _248);
    float _270 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _272 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _274 = fma(_266, _266, _268);
    float _276 = sqrt(_262);
    float _278 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _282 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _270);
    float _284 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _272);
    float _286 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _288 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _278);
    float _290 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _280);
    float _292 = sqrt(_274);
    float _294 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _296 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _284);
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _300 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _302 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _304 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _306 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _308 = _276 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _310 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _286);
    bool _312 = _276 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _314 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _290);
    bool _316 = !_308;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _310);
    float _322 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _298);
    float _324 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _302);
    bool _326 = _292 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _328 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _304);
    bool _330 = _292 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _332 = 1.0 / _222;
    bool _334 = !_326;
    int _336 = _334 ? 0 : 1;
    float _338 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _288);
    int _340 = 2;
    int _342 = 2;
    if (!_308)
    {
        _340 = 1;
    }
    int _344 = _340;
    float _346 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _322);
    int _348 = _344;
    if (!_312)
    {
        _348 = _318;
    }
    int _350 = _348;
    float _352 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _258);
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _324);
    float _356 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _328);
    if (!_326)
    {
        _342 = 1;
    }
    int _358 = _342;
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _352);
    int _362 = _358;
    if (!_330)
    {
        _362 = _336;
    }
    int _364 = _362;
    float _366 = float(_350);
    float _368 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _260);
    float _370 = float(_364);
    float _372 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _250);
    float _374 = precise::min(_366, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _376 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _378 = precise::min(_370, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _372);
    bool _382 = _374 != 1.0;
    bool _384 = isnan(_374);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    float _392 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _368);
    bool _394 = _378 != 1.0;
    bool _396 = isnan(_378);
    bool _398 = _394 || _396;
    bool _400 = isnan(1.0);
    bool _402 = _398 || _400;
    float _404 = _380 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _406 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _408 = _374 != 0.0;
    bool _410 = isnan(_374);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _376);
    bool _420 = _378 != 0.0;
    bool _422 = isnan(_378);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _282);
    float _432 = _360 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _434 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _436 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _406);
    float _438 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _440 = _432;
    float _442 = _404;
    if (_390)
    {
        float _444 = _392 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _440 = _444;
    }
    float _446 = _440;
    float _448 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _294);
    float _450 = _446;
    if (_402)
    {
        float _452 = _296 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _442 = _452;
    }
    float _454 = _442;
    float _456 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _436);
    float _458 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _300);
    float _460 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _434);
    float _462 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _306);
    float _464 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _438);
    float _466 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _448);
    float _468 = _314 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _470 = _468;
    float _472 = _454;
    if (_402)
    {
        float _474 = _456 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _470 = _474;
    }
    float _476 = _470;
    float _478 = _476;
    if (!_416)
    {
        float _480 = _430 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _450 = _480;
    }
    float _482 = _450;
    if (!_428)
    {
        float _484 = _320 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _478 = _484;
    }
    float _486 = _478;
    float _488 = float(int(_91));
    float2 _1509 = float2(_54, _56);
    float2 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1509, float2(0.0), isnan(_1509))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1509, float2(0.0), isnan(_1509))).xy;
    float _494 = _492.x;
    float _496 = _492.y;
    float _498 = rint(_378);
    float _500 = precise::max(_498, 0.0);
    uint _502 = uint(_500);
    uint _504 = clamp(_502, 0u, 65535u);
    float _506 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _418);
    float _508 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _464);
    float _510 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _458);
    float _512 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _462);
    float _514 = _332 * _224;
    float _516 = _332 * _226;
    float _518 = _332 * _228;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = rint(_374);
    float _524 = precise::max(_522, 0.0);
    uint _526 = uint(_524);
    uint _528 = clamp(_526, 0u, 65535u);
    float _530 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _460);
    if (!_428)
    {
        float _532 = _338 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _472 = _532;
    }
    float _534 = _472;
    float _536 = _506 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _538 = _346 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _540 = _536;
    float _542 = _538;
    if (_402)
    {
        float _544 = _508 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _540 = _544;
    }
    float _546 = _540;
    float _548 = _546;
    if (_390)
    {
        float _550 = _510 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _542 = _550;
    }
    float _552 = _542;
    float _554 = _552;
    if (!_428)
    {
        float _556 = _512 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _548 = _556;
    }
    float _558 = _548;
    float _560 = rint(_488);
    float _562 = precise::max(_560, 0.0);
    uint _564 = uint(_562);
    uint _566 = clamp(_564, 0u, 65535u);
    float _568 = _354 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _570 = _568;
    if (!_416)
    {
        float _572 = _530 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _554 = _572;
    }
    float _574 = _554;
    if (_390)
    {
        float _576 = _466 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _570 = _576;
    }
    float _578 = _570;
    float _580 = 0.0 + _534;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    float _584 = _578;
    if (!_416)
    {
        float _586 = _356 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = 0.0 + _482;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float3 _1680 = float3(_486, _558, float(int(_504)));
    float3 _1684 = select(_1680, float3(0.0), isnan(_1680));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1684.xy, uint(rint(_1684.z)), _582);
    float3 _1693 = float3(_574, _588, float(int(_528)));
    float3 _1695 = select(_1693, float3(0.0), isnan(_1693));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1695.xy, uint(rint(_1695.z)), _592);
    float3 _1704 = float3(_514, _516, float(int(_566)));
    float3 _1706 = select(_1704, float3(0.0), isnan(_1704));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1706.xy, uint(rint(_1706.z)), _520);
    float _600 = fma(_494, 2.0, -1.0);
    float _602 = fma(_496, 2.0, -1.0);
    float _604 = _600 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _606 = _602 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _608 = fma(_604, 2.0, _54);
    float _610 = fma(_606, 2.0, _56);
    float2 _1733 = float2(_608, _610);
    float _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1733, float2(0.0), isnan(_1733))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1733, float2(0.0), isnan(_1733))).x;
    float _614 = -_66;
    float _616 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _618 = _614 + _616;
    float _620 = -_66;
    float _622 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _624 = _620 + _622;
    float _626 = _618 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _624 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _594 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _636 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[49].z, _634);
    float _638 = _598 + _628;
    float _640 = _636 + _632;
    out.m_47.x = _612;
    out.m_47.y = _638;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _640;
    return out;
}

